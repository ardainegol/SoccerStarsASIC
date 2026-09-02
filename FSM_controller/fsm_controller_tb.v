module fsm_controller_tb();

reg in_clka, in_clkb, in_restart, in_enable;
reg in_strike_power_ctrl, in_spin_ctrl, in_v_angle_ctrl, in_h_angle_ctrl;

wire out_strike_store_enable, out_spin_store_enable, out_v_angle_store_enable, out_h_angle_store_enable, out_access_trig_enable, out_sample_keeper_enable, out_range_enable, out_lateral_enable, out_collision_check_enable, out_display_enable;
wire [3:0] out_state_debug;
wire [1:0] out_multiplication_select;

// Create fsm_accum instance
fsm_controller myFSM(
    .clka(in_clka),
    .clkb(in_clkb),
    .restart(in_restart),
    .enable(in_enable),
    .strike_power_ctrl(in_strike_power_ctrl),
    .spin_ctrl(in_spin_ctrl),
    .v_angle_ctrl(in_v_angle_ctrl),
    .h_angle_ctrl(in_h_angle_ctrl),
    
    .strike_store_enable(out_strike_store_enable),
    .spin_store_enable(out_spin_store_enable),
    .v_angle_store_enable(out_v_angle_store_enable),
    .h_angle_store_enable(out_h_angle_store_enable),
    .access_trig_enable(out_access_trig_enable),
    .multiplication_select(out_multiplication_select),
    .sample_keeper_enable(out_sample_keeper_enable),
    .range_enable(out_range_enable),
    .lateral_enable(out_lateral_enable),
    .collision_check_enable(out_collision_check_enable),
    .display_enable(out_display_enable),
    .state_debug(out_state_debug)
);

// Task for one clock cycle (4 substeps)
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

$dumpfile ("fsm_controller_tb.vcd");
$dumpvars;

// Initialize all inputs
in_restart = 0;in_enable = 0;in_strike_power_ctrl = 0;in_v_angle_ctrl = 0;in_spin_ctrl = 0;
in_h_angle_ctrl = 0;in_clka = 0; in_clkb = 0;

// Restart
in_restart = 1'b1;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Trigger enable to start the game
in_restart = 1'b0;    in_enable = 1'b1;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Stay in strike
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Stay in strike
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Trigger strike power ctrl
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b1;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Trigger spin ctrl
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b1;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Trigger v angle ctrl
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b1;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Stay in h angle  
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Trigger h angle ctrl 
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b1;
one_cycle;
// Lookup trig
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Stay in CALC_V_SQ while multiplication happens in datapath
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Stay in CALC_V_SQ while multiplication happens in datapath
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Stay in CALC_V_SQ while multiplication happens in datapath
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Stay in CALC_V_SQ while multiplication happens in datapath
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Stay in CALC_RANGE while multiplication happens in datapath
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Stay in CALC_RANGE while multiplication happens in datapath
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Stay in CALC_RANGE while multiplication happens in datapath
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Stay in CALC_RANGE while multiplication happens in datapath
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Apply spin
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Stay in CALC_LATERAL while multiplication happens in datapath
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Stay in CALC_LATERAL while multiplication happens in datapath
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Stay in CALC_LATERAL while multiplication happens in datapath
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Stay in CALC_LATERAL while multiplication happens in datapath
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Goalkeeper
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Collision
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Display shot
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Display keeper
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Output valid
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Output valid
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Output valid
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Output valid
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;
// Output valid
in_restart = 1'b0;    in_enable = 1'b0;    in_strike_power_ctrl = 1'b0;    in_spin_ctrl = 1'b0;    in_v_angle_ctrl = 1'b0;    in_h_angle_ctrl = 1'b0;
one_cycle;

$display ("in_clka, \t in_clkb, \t in_restart, \t in_enable, \t in_strike_power_ctrl, \t in_spin_ctrl, \t in_v_angle_ctrl, \t in_h_angle_ctrl, \t out_strike_store_enable, \t out_spin_store_enable, \t out_v_angle_store_enable, \t out_h_angle_store_enable, \t out_access_trig_enable, \t out_multiplication_select, \t out_sample_keeper_enable, \t out_range_enable, \t out_lateral_enable, \t out_collision_check_enable, \t out_display_enable, \t out_state_debug");

$stop;
end

endmodule