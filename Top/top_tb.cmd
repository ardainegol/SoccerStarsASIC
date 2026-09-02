|
| soccer_stars_top_shot1.cmd
| Cycles 0-47: initial restart + first shot sequence
|

vector p_ball_x  p_ball_x\[3\] p_ball_x\[2\] p_ball_x\[1\] p_ball_x\[0\]
vector p_ball_y  p_ball_y\[3\] p_ball_y\[2\] p_ball_y\[1\] p_ball_y\[0\]
vector p_keeper_x  p_keeper_x\[3\] p_keeper_x\[2\] p_keeper_x\[1\] p_keeper_x\[0\]
vector p_keeper_y  p_keeper_y\[3\] p_keeper_y\[2\] p_keeper_y\[1\] p_keeper_y\[0\]
vector p_state_debug  p_state_debug\[3\] p_state_debug\[2\] p_state_debug\[1\] p_state_debug\[0\]
vector p_mult_product_debug  p_mult_product_debug\[7\] p_mult_product_debug\[6\] p_mult_product_debug\[5\] p_mult_product_debug\[4\] p_mult_product_debug\[3\] p_mult_product_debug\[2\] p_mult_product_debug\[1\] p_mult_product_debug\[0\]
vector p_range_debug  p_range_debug\[7\] p_range_debug\[6\] p_range_debug\[5\] p_range_debug\[4\] p_range_debug\[3\] p_range_debug\[2\] p_range_debug\[1\] p_range_debug\[0\]
vector p_lateral_debug  p_lateral_debug\[7\] p_lateral_debug\[6\] p_lateral_debug\[5\] p_lateral_debug\[4\] p_lateral_debug\[3\] p_lateral_debug\[2\] p_lateral_debug\[1\] p_lateral_debug\[0\]

ana p_clka p_clkb p_restart p_enable p_strike_power_ctrl p_spin_ctrl p_v_angle_ctrl p_h_angle_ctrl
ana p_state_debug p_mult_product_debug p_range_debug p_lateral_debug
ana p_ball_x p_ball_y p_keeper_x p_keeper_y p_win_loss p_valid

| Shot 1: restart at cycle 0, enable at 1, strike at 3, spin at 6, v_angle at 10, h_angle at 15
V p_restart             1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V p_enable              0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V p_strike_power_ctrl   0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V p_spin_ctrl           0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V p_v_angle_ctrl        0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
V p_h_angle_ctrl        0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0

clock p_clkb 1 0 0 0
clock p_clka 0 0 1 0

R