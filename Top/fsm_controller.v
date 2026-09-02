module fsm_controller(
    input wire clka,
    input wire clkb,
    input wire restart,
    input wire enable,
    input wire strike_power_ctrl,
    input wire spin_ctrl,
    input wire v_angle_ctrl,
    input wire h_angle_ctrl,

    output reg strike_store_enable,
    output reg spin_store_enable,
    output reg v_angle_store_enable,
    output reg h_angle_store_enable,
    output reg access_trig_enable,
    output reg [1:0] multiplication_select,
    output reg sample_keeper_enable,
    output reg range_enable,
    output reg lateral_enable,
    output reg collision_check_enable,
    output reg display_enable,

    output reg [3:0] state_debug
);

parameter IDLE = 4'b0000,
          LOAD_STRIKE = 4'b0001,
          LOAD_SPIN = 4'b0010,
          LOAD_V_ANGLE = 4'b0011,
          LOAD_H_ANGLE = 4'b0100,
          LOOKUP_TRIG = 4'b0101,
          CALC_V_SQ = 4'b0110,
          CALC_RANGE  = 4'b0111,
          APPLY_SPIN  = 4'b1000,
          CALC_LATERAL = 4'b1001,
          GOALKEEPER = 4'b1010,
          COLLISION = 4'b1011,
          DISPLAY_SHOT = 4'b1100,
          DISPLAY_KEEPER = 4'b1101,
          OUTPUT_VALID = 4'b1110;

reg [3:0] current_state, next_state;
reg [2:0] calc_v_sq_counter, calc_range_counter, calc_lateral_counter;

always @(negedge clka) begin
    if (restart) begin
        next_state           <= IDLE;
        calc_v_sq_counter    <= 3'b0;
        calc_range_counter   <= 3'b0;
        calc_lateral_counter <= 3'b0;
    end
    else begin
        calc_v_sq_counter    <= calc_v_sq_counter;
        calc_range_counter   <= calc_range_counter;
        calc_lateral_counter <= calc_lateral_counter;

        case (current_state)
            IDLE: begin
                if (enable) next_state <= LOAD_STRIKE;
                else        next_state <= IDLE;
            end
            LOAD_STRIKE: begin
                if (strike_power_ctrl) next_state <= LOAD_SPIN;
                else                   next_state <= LOAD_STRIKE;
            end
            LOAD_SPIN: begin
                if (spin_ctrl) next_state <= LOAD_V_ANGLE;
                else           next_state <= LOAD_SPIN;
            end
            LOAD_V_ANGLE: begin
                if (v_angle_ctrl) next_state <= LOAD_H_ANGLE;
                else              next_state <= LOAD_V_ANGLE;
            end
            LOAD_H_ANGLE: begin
                if (h_angle_ctrl) next_state <= LOOKUP_TRIG;
                else              next_state <= LOAD_H_ANGLE;
            end
            LOOKUP_TRIG: begin
                next_state <= CALC_V_SQ;
            end
            CALC_V_SQ: begin
                if (calc_v_sq_counter == 3'd4)
                    next_state <= CALC_RANGE;
                else begin
                    calc_v_sq_counter <= calc_v_sq_counter + 3'd1;
                    next_state        <= CALC_V_SQ;
                end
            end
            CALC_RANGE: begin
                if (calc_range_counter == 3'd4)
                    next_state <= APPLY_SPIN;
                else begin
                    calc_range_counter <= calc_range_counter + 3'd1;
                    next_state         <= CALC_RANGE;
                end
            end
            APPLY_SPIN: begin
                next_state <= CALC_LATERAL;
            end
            CALC_LATERAL: begin
                if (calc_lateral_counter == 3'd4)
                    next_state <= GOALKEEPER;
                else begin
                    calc_lateral_counter <= calc_lateral_counter + 3'd1;
                    next_state           <= CALC_LATERAL;
                end
            end
            GOALKEEPER:     next_state <= COLLISION;
            COLLISION:      next_state <= DISPLAY_SHOT;
            DISPLAY_SHOT:   next_state <= DISPLAY_KEEPER;
            DISPLAY_KEEPER: next_state <= OUTPUT_VALID;
            OUTPUT_VALID:   next_state <= OUTPUT_VALID;
            default:        next_state <= IDLE;
        endcase
    end
end

always @(negedge clkb) begin
    if (restart) begin
        current_state          <= IDLE;
        state_debug            <= IDLE;
        strike_store_enable    <= 1'b0;
        spin_store_enable      <= 1'b0;
        v_angle_store_enable   <= 1'b0;
        h_angle_store_enable   <= 1'b0;
        access_trig_enable     <= 1'b0;
        multiplication_select  <= 2'b00;
        sample_keeper_enable   <= 1'b0;
        range_enable           <= 1'b0;
        lateral_enable         <= 1'b0;
        collision_check_enable <= 1'b0;
        display_enable         <= 1'b0;
    end
    else begin
        current_state <= next_state;
        state_debug   <= next_state;

        strike_store_enable    <= 1'b0;
        spin_store_enable      <= 1'b0;
        v_angle_store_enable   <= 1'b0;
        h_angle_store_enable   <= 1'b0;
        access_trig_enable     <= 1'b0;
        multiplication_select  <= 2'b00;
        sample_keeper_enable   <= 1'b0;
        range_enable           <= 1'b0;
        lateral_enable         <= 1'b0;
        collision_check_enable <= 1'b0;
        display_enable         <= 1'b0;

        case (next_state)
            LOAD_STRIKE: begin
                if (strike_power_ctrl) strike_store_enable <= 1'b1;
            end
            LOAD_SPIN: begin
                if (spin_ctrl) spin_store_enable <= 1'b1;
            end
            LOAD_V_ANGLE: begin
                if (v_angle_ctrl) v_angle_store_enable <= 1'b1;
            end
            LOAD_H_ANGLE: begin
                if (h_angle_ctrl) h_angle_store_enable <= 1'b1;
            end
            LOOKUP_TRIG: begin
                access_trig_enable <= 1'b1;
            end
            CALC_V_SQ: begin
                multiplication_select <= 2'b01;
            end
            CALC_RANGE: begin
                multiplication_select <= 2'b10;
                range_enable          <= 1'b1;
            end
            APPLY_SPIN: begin
                range_enable <= 1'b1;
            end
            CALC_LATERAL: begin
                multiplication_select <= 2'b11;
                lateral_enable        <= 1'b1;
            end
            GOALKEEPER: begin
                sample_keeper_enable <= 1'b1;
            end
            COLLISION: begin
                collision_check_enable <= 1'b1;
            end
            DISPLAY_SHOT: begin
                display_enable <= 1'b1;
            end
            DISPLAY_KEEPER: begin
                display_enable <= 1'b1;
            end
            OUTPUT_VALID: begin
                display_enable <= 1'b1;
            end
            default: ;
        endcase
    end
end

endmodule