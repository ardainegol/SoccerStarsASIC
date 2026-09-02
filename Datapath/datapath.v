module datapath (
    input wire clka,
    input wire clkb,
    input wire restart,

    input wire [3:0] ring_power,
    input wire [3:0] ring_spin,
    input wire [3:0] ring_v_angle,
    input wire [3:0] ring_h_angle,

    input wire strike_store_enable,
    input wire spin_store_enable,
    input wire v_angle_store_enable,
    input wire h_angle_store_enable,
    input wire access_trig_enable,
    input wire [1:0] multiplication_select,
    input wire sample_keeper_enable,
    input wire range_enable,
    input wire lateral_enable,
    input wire collision_check_enable,
    input wire display_enable,

    output reg [3:0] ball_x,
    output reg [3:0] ball_y,
    output reg [3:0] keeper_x,
    output reg [3:0] keeper_y,
    output reg       goal_flag,
    output reg       valid,

    output wire [7:0] mult_product_debug,
    output wire [7:0] range_debug,
    output wire [7:0] lateral_debug
);

reg [3:0] power_reg;
reg [3:0] spin_reg;
reg [3:0] v_reg;
reg [3:0] h_reg;

reg [3:0] trig_v;
reg [3:0] trig_h;

reg [7:0] mult_accum;
reg [7:0] mult_shift_a;
reg [3:0] mult_shift_b;
reg [2:0] mult_cycle;

wire mult_running;
assign mult_running = (multiplication_select != 2'b00);

reg [1:0] prev_mult_select;

reg [7:0] v_sq_reg;
reg [7:0] range_reg;
reg [3:0] spin_adj;
reg [7:0] lateral_reg;

reg [7:0] lfsr_reg;
reg       lfsr_seeded;

initial begin
    lfsr_reg    = 8'b00000000;
    lfsr_seeded = 1'b0;
end

reg [2:0] score;

assign mult_product_debug = mult_accum;
assign range_debug        = range_reg;
assign lateral_debug      = lateral_reg;

function [3:0] trig_table;
    input [3:0] index;
    begin
        case (index)
            4'd0:  trig_table = 4'd0;
            4'd1:  trig_table = 4'd2;
            4'd2:  trig_table = 4'd3;
            4'd3:  trig_table = 4'd5;
            4'd4:  trig_table = 4'd6;
            4'd5:  trig_table = 4'd8;
            4'd6:  trig_table = 4'd9;
            4'd7:  trig_table = 4'd10;
            4'd8:  trig_table = 4'd11;
            4'd9:  trig_table = 4'd12;
            4'd10: trig_table = 4'd13;
            4'd11: trig_table = 4'd14;
            4'd12: trig_table = 4'd14;
            4'd13: trig_table = 4'd15;
            4'd14: trig_table = 4'd15;
            4'd15: trig_table = 4'd15;
            default: trig_table = 4'd0;
        endcase
    end
endfunction

// ---------------- LFSR ----------------
// Seeded on every restart with a known constant. This works post-synth
// because it doesn't depend on `initial` blocks (which DC strips) — the
// reset path explicitly drives the flops. The LFSR shifts on every clka
// edge while not in reset.
//
// To get a DIFFERENT keeper position per shot (since restart reseeds the
// LFSR to the same value each time), the keeper sample logic XORs the
// LFSR output with the latched input registers (power, spin, v, h). Each
// distinct shot input combination produces a distinct keeper position,
// while the LFSR itself stays deterministic and post-synth-safe.
always @(negedge clka) begin : LFSR_LOGIC
    if (restart) begin
        lfsr_reg    <= 8'b10101010;
        lfsr_seeded <= 1'b1;
    end else begin
        lfsr_seeded <= lfsr_seeded;
        if (lfsr_reg[0])
            lfsr_reg <= {1'b0, lfsr_reg[7:1]} ^ 8'b01110000;
        else
            lfsr_reg <= {1'b0, lfsr_reg[7:1]};
    end
end

// ---------------- clka domain ----------------
always @(negedge clka) begin : CLKA_LOGIC
    if (restart) begin
        power_reg        <= 4'b0;
        spin_reg         <= 4'b0;
        v_reg            <= 4'b0;
        h_reg            <= 4'b0;
        trig_v           <= 4'b0;
        trig_h           <= 4'b0;
        spin_adj         <= 4'b0;
        mult_cycle       <= 3'b0;
        mult_shift_a     <= 8'b0;
        mult_shift_b     <= 4'b0;
        prev_mult_select <= 2'b00;
    end else begin
        if (strike_store_enable)  power_reg <= ring_power;
        else                      power_reg <= power_reg;

        if (spin_store_enable)    spin_reg  <= ring_spin;
        else                      spin_reg  <= spin_reg;

        if (v_angle_store_enable) v_reg     <= ring_v_angle;
        else                      v_reg     <= v_reg;

        if (h_angle_store_enable) h_reg     <= ring_h_angle;
        else                      h_reg     <= h_reg;

        if (access_trig_enable) begin
            trig_v   <= trig_table(v_reg);
            trig_h   <= trig_table(h_reg);
            spin_adj <= spin_reg >> 1;
        end else begin
            trig_v   <= trig_v;
            trig_h   <= trig_h;
            spin_adj <= spin_adj;
        end

        prev_mult_select <= multiplication_select;

        if (mult_running && (multiplication_select != prev_mult_select)) begin
            case (multiplication_select)
                2'b01: begin
                    mult_shift_a <= {4'b0000, power_reg};
                    mult_shift_b <= power_reg;
                end
                2'b10: begin
                    mult_shift_a <= {4'b0000, v_sq_reg[3:0]};
                    mult_shift_b <= trig_v;
                end
                2'b11: begin
                    mult_shift_a <= {4'b0000, range_reg[3:0]};
                    mult_shift_b <= trig_h;
                end
                default: begin
                    mult_shift_a <= mult_shift_a;
                    mult_shift_b <= mult_shift_b;
                end
            endcase
            mult_cycle <= 3'd1;
        end else if (mult_running && (mult_cycle < 3'd5)) begin
            mult_shift_a <= {mult_shift_a[6:0], 1'b0};
            mult_shift_b <= {1'b0, mult_shift_b[3:1]};
            mult_cycle   <= mult_cycle + 3'd1;
        end else if (mult_running) begin
            mult_shift_a <= mult_shift_a;
            mult_shift_b <= mult_shift_b;
            mult_cycle   <= mult_cycle;
        end else begin
            mult_shift_a <= mult_shift_a;
            mult_shift_b <= mult_shift_b;
            mult_cycle   <= 3'd0;
        end
    end
end

wire [7:0] partial_product;
assign partial_product = mult_shift_b[0] ? mult_shift_a : 8'b0;

// ---------------- clkb domain ----------------
always @(negedge clkb) begin : CLKB_LOGIC
    if (restart) begin
        mult_accum  <= 8'b0;
        v_sq_reg    <= 8'b0;
        range_reg   <= 8'b0;
        lateral_reg <= 8'b0;
        keeper_x    <= 4'b0;
        keeper_y    <= 4'b0;
        ball_x      <= 4'b0;
        ball_y      <= 4'b0;
        goal_flag   <= 1'b0;
        valid       <= 1'b0;
        score       <= 3'b0;
    end else begin

        if (mult_running && mult_cycle == 3'd1)
            mult_accum <= partial_product;
        else if (mult_running && mult_cycle >= 3'd2 && mult_cycle <= 3'd4)
            mult_accum <= mult_accum + partial_product;
        else
            mult_accum <= mult_accum;

        if (mult_running && mult_cycle == 3'd5 && multiplication_select == 2'b01)
            v_sq_reg <= mult_accum;
        else
            v_sq_reg <= v_sq_reg;

        if (mult_running && mult_cycle == 3'd5 && multiplication_select == 2'b10)
            range_reg <= {4'b0000, mult_accum[7:4]};
        else if (range_enable && multiplication_select == 2'b00)
            range_reg <= range_reg + {4'b0000, spin_adj};
        else
            range_reg <= range_reg;

        if (mult_running && mult_cycle == 3'd5 && multiplication_select == 2'b11)
            lateral_reg <= mult_accum + {4'b0000, spin_adj};
        else
            lateral_reg <= lateral_reg;

        if (sample_keeper_enable) begin
            keeper_x <= lfsr_reg[3:0] ^ power_reg ^ v_reg;
            keeper_y <= lfsr_reg[7:4] ^ spin_reg ^ h_reg;
        end else begin
            keeper_x <= keeper_x;
            keeper_y <= keeper_y;
        end

        if (collision_check_enable) begin
            ball_x <= lateral_reg[3:0];
            ball_y <= range_reg[3:0];
        end else begin
            ball_x <= ball_x;
            ball_y <= ball_y;
        end

        if (collision_check_enable) begin
            if (  ((lateral_reg[3:0] >= keeper_x) ? (lateral_reg[3:0] - keeper_x) : (keeper_x - lateral_reg[3:0])) <= 4'd2
               && ((range_reg[3:0]   >= keeper_y) ? (range_reg[3:0]   - keeper_y) : (keeper_y - range_reg[3:0]))   <= 4'd2) begin
                goal_flag <= 1'b0;
                score     <= score;
            end else begin
                goal_flag <= 1'b1;
                score     <= score + 3'd1;
            end
        end else begin
            goal_flag <= goal_flag;
            score     <= score;
        end

        if (display_enable)
            valid <= 1'b1;
        else
            valid <= 1'b0;
    end
end

endmodule