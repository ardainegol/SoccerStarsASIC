module datapath_tb();

//-------------Input Regs----------------------------------
reg in_clka, in_clkb, in_restart;
reg [3:0] in_ring_power, in_ring_spin, in_ring_v_angle, in_ring_h_angle;
reg in_strike_store_enable, in_spin_store_enable;
reg in_v_angle_store_enable, in_h_angle_store_enable;
reg in_access_trig_enable;
reg [1:0] in_multiplication_select;
reg in_sample_keeper_enable;
reg in_range_enable, in_lateral_enable;
reg in_collision_check_enable;
reg in_display_enable;

//-------------Output Wires--------------------------------
wire [3:0] out_ball_x, out_ball_y;
wire [3:0] out_keeper_x, out_keeper_y;
wire       out_goal_flag, out_valid;
wire [7:0] out_mult_product_debug;
wire [7:0] out_range_debug;
wire [7:0] out_lateral_debug;

// Create datapath instance
datapath myDatapath(
    .clka(in_clka),
    .clkb(in_clkb),
    .restart(in_restart),
    .ring_power(in_ring_power),
    .ring_spin(in_ring_spin),
    .ring_v_angle(in_ring_v_angle),
    .ring_h_angle(in_ring_h_angle),
    .strike_store_enable(in_strike_store_enable),
    .spin_store_enable(in_spin_store_enable),
    .v_angle_store_enable(in_v_angle_store_enable),
    .h_angle_store_enable(in_h_angle_store_enable),
    .access_trig_enable(in_access_trig_enable),
    .multiplication_select(in_multiplication_select),
    .sample_keeper_enable(in_sample_keeper_enable),
    .range_enable(in_range_enable),
    .lateral_enable(in_lateral_enable),
    .collision_check_enable(in_collision_check_enable),
    .display_enable(in_display_enable),
    .ball_x(out_ball_x),
    .ball_y(out_ball_y),
    .keeper_x(out_keeper_x),
    .keeper_y(out_keeper_y),
    .goal_flag(out_goal_flag),
    .valid(out_valid),
    .mult_product_debug(out_mult_product_debug),
    .range_debug(out_range_debug),
    .lateral_debug(out_lateral_debug)
);

// Task for one clock cycle (two-phase non-overlapping)
task one_cycle;
  begin
    in_clka = 0; in_clkb = 0; #10;
    in_clka = 1; in_clkb = 0; #10;
    in_clka = 0; in_clkb = 0; #10;
    in_clka = 0; in_clkb = 1; #10;
  end
endtask

initial
begin

// Initialize all inputs
in_clka = 0; in_clkb = 0;
in_restart = 0; in_ring_power = 4'd0; in_ring_spin = 4'd0; in_ring_v_angle = 4'd0; in_ring_h_angle = 4'd0;
in_strike_store_enable = 0; in_spin_store_enable = 0; in_v_angle_store_enable = 0; in_h_angle_store_enable = 0;
in_access_trig_enable = 0; in_multiplication_select = 2'b00; in_sample_keeper_enable = 0;
in_range_enable = 0; in_lateral_enable = 0; in_collision_check_enable = 0; in_display_enable = 0;

// Restart
in_restart = 1'b1;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b00;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// IDLE
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b00;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// LOAD_STRIKE
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b1;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b00;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// LOAD_SPIN
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b1;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b00;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// LOAD_V_ANGLE
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b1;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b00;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// LOAD_H_ANGLE
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b1;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b00;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// LOOKUP_TRIG
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b1;    in_multiplication_select = 2'b00;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// CALC_V_SQ cycle 0 (load)
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b01;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// CALC_V_SQ cycle 1 (shift+accum)
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b01;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// CALC_V_SQ cycle 2 (shift+accum)
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b01;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// CALC_V_SQ cycle 3 (shift+accum)
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b01;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// CALC_V_SQ wait cycle 4 (mult still selected, result settles)
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b01;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// CALC_V_SQ wait cycle 5 (mult still selected, result settles)
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b01;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// CALC_RANGE cycle 0 (load)
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b10;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b1;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// CALC_RANGE cycle 1 (shift+accum)
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b10;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b1;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// CALC_RANGE cycle 2 (shift+accum)
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b10;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b1;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// CALC_RANGE cycle 3 (shift+accum)
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b10;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b1;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// CALC_RANGE wait cycle 4 (result settles)
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b10;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b1;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// CALC_RANGE wait cycle 5 (result settles)
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b10;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b1;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// APPLY_SPIN
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b00;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b1;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// CALC_LATERAL cycle 0 (load)
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b11;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b1;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// CALC_LATERAL cycle 1 (shift+accum)
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b11;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b1;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// CALC_LATERAL cycle 2 (shift+accum)
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b11;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b1;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// CALC_LATERAL cycle 3 (shift+accum)
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b11;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b1;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// CALC_LATERAL wait cycle 4 (result settles)
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b11;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b1;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// CALC_LATERAL wait cycle 5 (result settles)
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b11;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b1;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// GOALKEEPER
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b00;    in_sample_keeper_enable = 1'b1;    in_range_enable = 1'b0;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b0;
one_cycle;
// COLLISION
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b00;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b1;    in_display_enable = 1'b0;
one_cycle;
// DISPLAY_SHOT
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b00;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b1;
one_cycle;
// DISPLAY_KEEPER
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b00;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b1;
one_cycle;
// OUTPUT_VALID
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b00;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b1;
one_cycle;
// OUTPUT_VALID (hold)
in_restart = 1'b0;    in_ring_power = 4'd5;    in_ring_spin = 4'd4;    in_ring_v_angle = 4'd8;    in_ring_h_angle = 4'd6;    in_strike_store_enable = 1'b0;    in_spin_store_enable = 1'b0;    in_v_angle_store_enable = 1'b0;    in_h_angle_store_enable = 1'b0;    in_access_trig_enable = 1'b0;    in_multiplication_select = 2'b00;    in_sample_keeper_enable = 1'b0;    in_range_enable = 1'b0;    in_lateral_enable = 1'b0;    in_collision_check_enable = 1'b0;    in_display_enable = 1'b1;
one_cycle;

$display ("in_clka, \t in_clkb, \t in_restart, \t in_ring_power, \t in_ring_spin, \t in_ring_v_angle, \t in_ring_h_angle, \t in_strike_store_enable, \t in_spin_store_enable, \t in_v_angle_store_enable, \t in_h_angle_store_enable, \t in_access_trig_enable, \t in_multiplication_select, \t in_sample_keeper_enable, \t in_range_enable, \t in_lateral_enable, \t in_collision_check_enable, \t in_display_enable, \t out_ball_x, \t out_ball_y, \t out_keeper_x, \t out_keeper_y, \t out_goal_flag, \t out_valid, \t out_mult_product_debug, \t out_range_debug, \t out_lateral_debug");
$dumpfile ("datapath_tb.vcd");
$dumpvars;

$stop;
end

endmodule