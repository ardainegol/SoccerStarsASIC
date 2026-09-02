// =============================================================================
// soccer_stars_top.v
//
// Top-level integration of fsm_controller and datapath for the ELEC 422
// Penalty Shootout Game (Soccer Stars) project.
//
// CHANGE: the four 4-bit ring oscillator buses are now generated INTERNALLY
// by free-running counters on `clka`, instead of being driven from outside
// the chip. This models the real game: the player has no way to set these
// values directly — they cycle continuously inside the chip, and the player's
// button press freezes whatever value happens to be on the bus at that
// instant. From the player's perspective the latched value is unpredictable.
//
// The four counters use different odd increments (1, 3, 5, 7) so they don't
// march in lockstep — each "ring" walks through all 16 values but in a
// different sequence and at a different phase relative to the others.
//
// External pin count drops by 16 (the four 4-bit ring_* buses are gone).
// =============================================================================
module soccer_stars_top (
    // Clocks and reset
    input  wire        clka,
    input  wire        clkb,
    input  wire        restart,

    // Game start trigger
    input  wire        enable,

    // 1-bit player control inputs (latch the corresponding ring osc value)
    input  wire        strike_power_ctrl,
    input  wire        spin_ctrl,
    input  wire        v_angle_ctrl,
    input  wire        h_angle_ctrl,

    // Result outputs
    output wire [3:0]  ball_x,
    output wire [3:0]  ball_y,
    output wire [3:0]  keeper_x,
    output wire [3:0]  keeper_y,
    output wire        win_loss,
    output wire        valid,

    // Debug
    output wire [3:0]  state_debug,
    output wire [7:0]  mult_product_debug,
    output wire [7:0]  range_debug,
    output wire [7:0]  lateral_debug
);

    // ----- Internal "ring oscillator" counters -----
    // Free-running, all reset to 0 on restart, all increment on negedge clka.
    // Different odd increments give each ring a unique value sequence so
    // they don't track each other.
    reg [3:0] ring_power_cnt;
    reg [3:0] ring_spin_cnt;
    reg [3:0] ring_v_angle_cnt;
    reg [3:0] ring_h_angle_cnt;

    always @(negedge clka) begin
        if (restart) begin
            ring_power_cnt   <= 4'd0;
            ring_spin_cnt    <= 4'd0;
            ring_v_angle_cnt <= 4'd0;
            ring_h_angle_cnt <= 4'd0;
        end else begin
            ring_power_cnt   <= ring_power_cnt   + 4'd1;  // step 1
            ring_spin_cnt    <= ring_spin_cnt    + 4'd3;  // step 3
            ring_v_angle_cnt <= ring_v_angle_cnt + 4'd5;  // step 5
            ring_h_angle_cnt <= ring_h_angle_cnt + 4'd7;  // step 7
        end
    end

    wire [3:0] w_ring_power    = ring_power_cnt;
    wire [3:0] w_ring_spin     = ring_spin_cnt;
    wire [3:0] w_ring_v_angle  = ring_v_angle_cnt;
    wire [3:0] w_ring_h_angle  = ring_h_angle_cnt;

    // ----- FSM -> datapath control bus -----
    wire        w_strike_store_enable;
    wire        w_spin_store_enable;
    wire        w_v_angle_store_enable;
    wire        w_h_angle_store_enable;
    wire        w_access_trig_enable;
    wire [1:0]  w_multiplication_select;
    wire        w_sample_keeper_enable;
    wire        w_range_enable;
    wire        w_lateral_enable;
    wire        w_collision_check_enable;
    wire        w_display_enable;

    // ----- FSM controller instance -----
    fsm_controller u_fsm (
        .clka                  (clka),
        .clkb                  (clkb),
        .restart               (restart),
        .enable                (enable),
        .strike_power_ctrl     (strike_power_ctrl),
        .spin_ctrl             (spin_ctrl),
        .v_angle_ctrl          (v_angle_ctrl),
        .h_angle_ctrl          (h_angle_ctrl),

        .strike_store_enable   (w_strike_store_enable),
        .spin_store_enable     (w_spin_store_enable),
        .v_angle_store_enable  (w_v_angle_store_enable),
        .h_angle_store_enable  (w_h_angle_store_enable),
        .access_trig_enable    (w_access_trig_enable),
        .multiplication_select (w_multiplication_select),
        .sample_keeper_enable  (w_sample_keeper_enable),
        .range_enable          (w_range_enable),
        .lateral_enable        (w_lateral_enable),
        .collision_check_enable(w_collision_check_enable),
        .display_enable        (w_display_enable),
        .state_debug           (state_debug)
    );

    // ----- Datapath instance -----
    datapath u_datapath (
        .clka                  (clka),
        .clkb                  (clkb),
        .restart               (restart),

        .ring_power            (w_ring_power),
        .ring_spin             (w_ring_spin),
        .ring_v_angle          (w_ring_v_angle),
        .ring_h_angle          (w_ring_h_angle),

        .strike_store_enable   (w_strike_store_enable),
        .spin_store_enable     (w_spin_store_enable),
        .v_angle_store_enable  (w_v_angle_store_enable),
        .h_angle_store_enable  (w_h_angle_store_enable),
        .access_trig_enable    (w_access_trig_enable),
        .multiplication_select (w_multiplication_select),
        .sample_keeper_enable  (w_sample_keeper_enable),
        .range_enable          (w_range_enable),
        .lateral_enable        (w_lateral_enable),
        .collision_check_enable(w_collision_check_enable),
        .display_enable        (w_display_enable),

        .ball_x                (ball_x),
        .ball_y                (ball_y),
        .keeper_x              (keeper_x),
        .keeper_y              (keeper_y),
        .goal_flag             (win_loss),
        .valid                 (valid),

        .mult_product_debug    (mult_product_debug),
        .range_debug           (range_debug),
        .lateral_debug         (lateral_debug)
    );

endmodule