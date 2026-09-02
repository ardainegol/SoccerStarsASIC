// =============================================================================
// soccer_stars_top_tb.v
//
// CHANGE: the four ring oscillator buses are now generated INSIDE the chip
// (in soccer_stars_top.v) by free-running counters. The testbench no longer
// drives them — it only drives the player-facing controls (clocks, restart,
// enable, and the four ctrl pulses).
//
// Each shot now also waits a different number of "thinking time" cycles
// between entering a LOAD state and pulsing the corresponding ctrl signal,
// to simulate a real player taking variable time to press each button.
// This makes the latched values genuinely shot-dependent.
// =============================================================================
module soccer_stars_top_tb();

//-------------Input Regs----------------------------------
reg in_clka, in_clkb, in_restart, in_enable;
reg in_strike_power_ctrl, in_spin_ctrl, in_v_angle_ctrl, in_h_angle_ctrl;

//-------------Output Wires--------------------------------
wire [3:0] out_ball_x, out_ball_y;
wire [3:0] out_keeper_x, out_keeper_y;
wire       out_win_loss, out_valid;
wire [3:0] out_state_debug;
wire [7:0] out_mult_product_debug, out_range_debug, out_lateral_debug;

// Create top instance — no more ring_* connections
soccer_stars_top myTop(
    .clka(in_clka),
    .clkb(in_clkb),
    .restart(in_restart),
    .enable(in_enable),
    .strike_power_ctrl(in_strike_power_ctrl),
    .spin_ctrl(in_spin_ctrl),
    .v_angle_ctrl(in_v_angle_ctrl),
    .h_angle_ctrl(in_h_angle_ctrl),
    .ball_x(out_ball_x),
    .ball_y(out_ball_y),
    .keeper_x(out_keeper_x),
    .keeper_y(out_keeper_y),
    .win_loss(out_win_loss),
    .valid(out_valid),
    .state_debug(out_state_debug),
    .mult_product_debug(out_mult_product_debug),
    .range_debug(out_range_debug),
    .lateral_debug(out_lateral_debug)
);

// Two-phase non-overlapping clocks. Task ends with both clocks LOW so
// inputs can be safely changed between calls without setup races.
task one_cycle;
  begin
    in_clka = 0; in_clkb = 1; #10;   // posedge clkb (no flops fire)
    in_clka = 0; in_clkb = 0; #10;   // negedge clkb (clkb-domain flops sample)
    in_clka = 1; in_clkb = 0; #10;   // posedge clka
    in_clka = 0; in_clkb = 0; #10;   // negedge clka (clka-domain flops sample)
  end
endtask

// Convenience: hold all ctrl signals low for N cycles, then pulse one ctrl
// for one cycle. The N cycles of "thinking time" let the internal ring
// oscillators advance to a different state before the player presses, so
// the latched value depends on press timing.
task wait_then_pulse;
  input integer wait_cycles;
  input integer which;   // 0=strike, 1=spin, 2=v_angle, 3=h_angle
  integer i;
  begin
    in_strike_power_ctrl = 0; in_spin_ctrl = 0;
    in_v_angle_ctrl = 0;      in_h_angle_ctrl = 0;
    for (i = 0; i < wait_cycles; i = i + 1) one_cycle;
    case (which)
        0: in_strike_power_ctrl = 1;
        1: in_spin_ctrl         = 1;
        2: in_v_angle_ctrl      = 1;
        3: in_h_angle_ctrl      = 1;
    endcase
    one_cycle;
    in_strike_power_ctrl = 0; in_spin_ctrl = 0;
    in_v_angle_ctrl = 0;      in_h_angle_ctrl = 0;
  end
endtask

// Walk through the rest of the FSM (math + display) — 30 cycles is plenty.
task walk_to_done;
  integer i;
  begin
    in_strike_power_ctrl = 0; in_spin_ctrl = 0;
    in_v_angle_ctrl = 0;      in_h_angle_ctrl = 0;
    in_enable = 0;
    for (i = 0; i < 30; i = i + 1) one_cycle;
  end
endtask

// One complete shot: restart, enable, four button presses with player-style
// thinking delays, then walk through the math.
task play_shot;
  input integer t_strike;   // thinking time (cycles) before each press
  input integer t_spin;
  input integer t_v;
  input integer t_h;
  begin
    // Restart pulse — held for one full cycle.
    in_restart = 1;
    in_enable  = 0;
    in_strike_power_ctrl = 0; in_spin_ctrl = 0;
    in_v_angle_ctrl = 0;      in_h_angle_ctrl = 0;
    one_cycle;

    // Release restart, assert enable to leave IDLE.
    in_restart = 0;
    in_enable  = 1;
    one_cycle;
    in_enable  = 0;

    // Player presses each of the four buttons with a "thinking" delay.
    // The internal ring counter increments every cycle, so these delays
    // determine the latched values (player can't see or predict them).
    wait_then_pulse(t_strike, 0);
    wait_then_pulse(t_spin,   1);
    wait_then_pulse(t_v,      2);
    wait_then_pulse(t_h,      3);

    // Let the FSM walk through math, collision, display.
    walk_to_done;
  end
endtask

initial
begin
    $dumpfile("soccer_stars_top_tb.vcd");
    $dumpvars;

    // Power-on init
    in_clka = 0; in_clkb = 0;
    in_restart = 0; in_enable = 0;
    in_strike_power_ctrl = 0; in_spin_ctrl = 0;
    in_v_angle_ctrl = 0;      in_h_angle_ctrl = 0;
    #5;

    // ====================== SHOT 1 ======================
    // Player thinks 1, 2, 3, 4 cycles before each press.
    play_shot(1, 2, 3, 4);
    $display("---- SHOT 1 RESULTS ----");
    $display("ball=(%0d,%0d) keeper=(%0d,%0d) win_loss=%0d valid=%0d  range=%0d lateral=%0d",
             out_ball_x, out_ball_y, out_keeper_x, out_keeper_y,
             out_win_loss, out_valid, out_range_debug, out_lateral_debug);

    // ====================== SHOT 2 ======================
    // Different thinking pattern -> different ring values latched.
    play_shot(5, 1, 6, 2);
    $display("---- SHOT 2 RESULTS ----");
    $display("ball=(%0d,%0d) keeper=(%0d,%0d) win_loss=%0d valid=%0d  range=%0d lateral=%0d",
             out_ball_x, out_ball_y, out_keeper_x, out_keeper_y,
             out_win_loss, out_valid, out_range_debug, out_lateral_debug);

    // ====================== SHOT 3 ======================
    // Quick reflexes — minimal thinking on each press.
    play_shot(0, 0, 0, 0);
    $display("---- SHOT 3 (FAST PRESSES) RESULTS ----");
    $display("ball=(%0d,%0d) keeper=(%0d,%0d) win_loss=%0d valid=%0d  range=%0d lateral=%0d",
             out_ball_x, out_ball_y, out_keeper_x, out_keeper_y,
             out_win_loss, out_valid, out_range_debug, out_lateral_debug);

    // ====================== SHOT 4 ======================
    // Long, irregular thinking times.
    play_shot(7, 3, 9, 5);
    $display("---- SHOT 4 (SLOW PRESSES) RESULTS ----");
    $display("ball=(%0d,%0d) keeper=(%0d,%0d) win_loss=%0d valid=%0d  range=%0d lateral=%0d",
             out_ball_x, out_ball_y, out_keeper_x, out_keeper_y,
             out_win_loss, out_valid, out_range_debug, out_lateral_debug);

    $stop;
end

endmodule