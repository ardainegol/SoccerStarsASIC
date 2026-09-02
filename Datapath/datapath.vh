/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Mon May  4 18:47:59 2026
/////////////////////////////////////////////////////////////


module datapath ( clka, clkb, restart, ring_power, ring_spin, ring_v_angle, 
        ring_h_angle, strike_store_enable, spin_store_enable, 
        v_angle_store_enable, h_angle_store_enable, access_trig_enable, 
        multiplication_select, sample_keeper_enable, range_enable, 
        lateral_enable, collision_check_enable, display_enable, ball_x, ball_y, 
        keeper_x, keeper_y, goal_flag, valid, mult_product_debug, range_debug, 
        lateral_debug );
  input [3:0] ring_power;
  input [3:0] ring_spin;
  input [3:0] ring_v_angle;
  input [3:0] ring_h_angle;
  input [1:0] multiplication_select;
  output [3:0] ball_x;
  output [3:0] ball_y;
  output [3:0] keeper_x;
  output [3:0] keeper_y;
  output [7:0] mult_product_debug;
  output [7:0] range_debug;
  output [7:0] lateral_debug;
  input clka, clkb, restart, strike_store_enable, spin_store_enable,
         v_angle_store_enable, h_angle_store_enable, access_trig_enable,
         sample_keeper_enable, range_enable, lateral_enable,
         collision_check_enable, display_enable;
  output goal_flag, valid;
  wire   N57, N58, N59, N60, N61, N62, N63, N275, N276, N277, N290, N291, N305,
         N306, N307, N308, N309, N310, N311, N312, N327, N328, N329, N330,
         N331, N332, N333, N334, N345, N346, N347, N348, N349, N350, N351,
         N352, N397, N398, N399, N400, N401, N402, N403, N404, N409, N410,
         N411, N412, N442, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n152, n153, n154, n155, n156, n157, n158, n159,
         n160, n161, n162, n163, n164, n165, n166, n167, n168, n169, n170,
         n171, n172, n173, n174, n175, n176, n177, n178, n179, n180, n181,
         n182, n183, n184, n185, n186, n187, n188, n189, n190, n191, n192,
         n193, n194, n195, n196, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n229, n230, n231, n232, n233, n234, n235, n236,
         n237, n238, n239, n240, n241, n242, n243, n244, n245, n246, n247,
         n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, n258,
         n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269,
         n270, n271, n272, n273, n274, n275, n276, n277, n278, n279, n280,
         n281, n282, n283, n284, n285, n286, n287, n288, n289, n290, n291,
         n292, n293, n294, n295, n296, n297, n298, n299, n300, n301, n302,
         n303, n304, n305, n306, n307, n308, n309, n310, n311, n312, n313,
         n314, n315, n316, n317, n318, n319, n320, n321, n322, n323, n324,
         n325, n326, n327, n328, n329, n330, n331, n332, n333, n334, n335,
         n336, n337, n338, n339, n340, n341, n342, n343, n344, n345, n346,
         n347, n348, n349, n350, n351, n352, n353, n354, n355, n356, n357,
         n358, n359, n360, n361, n362, n363, n364, n365, n366, n367, n368,
         n369, n370, n371, n372, n373, n374, n375, n376, n377, n378, n379,
         n380, n381, n382, n383, n384, n385, n386, n387, n388, n389, n390,
         n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401,
         n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412,
         n413, n414, n415, n416, n417, n418, n419, n420, n421, n422, n423,
         n424, n425, n426, n427, n428, n429, n430, n431, n432, n433, n434,
         n435, n436, n437, n438, n439, n440, n441, n442, n443, n444, n445,
         n446, n447, n448, n449, n450, n451, n452, n453, n454, n455, n456,
         n457, n458, n459, n460, n461, n462, n463, n464, n465, n466, n467,
         n468, n469, n470, n471, n472, n473, n474, n475, n476, n477, n478,
         n479, n480, n481, n482, n483, n484, n485, n486, n487, n488, n489,
         n490, n491, n492, n493, n494, n495, n496, n497, n498, n499, n500,
         n501, n502, n503, n504, n505, n506, n507, n508, n509, n510, n511,
         n512, n513, n514, n515, n516, n517, n518, n519, n520, n521, n522,
         n523, n524, n525, n526, n527, n528, n529, n530, n531, n532, n533,
         n534, n535, n536, n537, n538, n539, n540, n541, n542, n543, n544,
         n545, n546, n547, n548, n549, n550, n551, n552, n553, n554, n555,
         n556, n557, n558, n559, n560, n561, n562, n563, n564, n565, n566,
         n567, n568, n569, n570, n571, n572, n573, n574, n575, n576, n577,
         n578, n579, n580, n581, n582, n583, n584, n585, n586, n587, n588,
         n589;
  wire   [7:0] lfsr_reg;
  wire   [3:0] power_reg;
  wire   [3:0] spin_reg;
  wire   [3:0] v_reg;
  wire   [3:0] h_reg;
  wire   [3:0] trig_v;
  wire   [3:0] trig_h;
  wire   [7:0] mult_shift_a;
  wire   [3:0] mult_shift_b;
  wire   [2:0] mult_cycle;
  wire   [3:0] spin_adj;
  wire   [1:0] prev_mult_select;
  wire   [3:0] v_sq_reg;
  wire   [7:1] \add_235/carry ;
  wire   [7:1] \add_230/carry ;
  wire   [7:1] \add_218/carry ;

  DFFNEGX1 \lfsr_reg_reg[7]  ( .D(n471), .CLK(clka), .Q(lfsr_reg[7]) );
  DFFNEGX1 \lfsr_reg_reg[0]  ( .D(N57), .CLK(clka), .Q(lfsr_reg[0]) );
  DFFNEGX1 \lfsr_reg_reg[6]  ( .D(N63), .CLK(clka), .Q(lfsr_reg[6]) );
  DFFNEGX1 \lfsr_reg_reg[5]  ( .D(N62), .CLK(clka), .Q(lfsr_reg[5]) );
  DFFNEGX1 \lfsr_reg_reg[4]  ( .D(N61), .CLK(clka), .Q(lfsr_reg[4]) );
  DFFNEGX1 \lfsr_reg_reg[3]  ( .D(N60), .CLK(clka), .Q(lfsr_reg[3]) );
  DFFNEGX1 \lfsr_reg_reg[2]  ( .D(N59), .CLK(clka), .Q(lfsr_reg[2]) );
  DFFNEGX1 \lfsr_reg_reg[1]  ( .D(N58), .CLK(clka), .Q(lfsr_reg[1]) );
  DFFNEGX1 \prev_mult_select_reg[1]  ( .D(N291), .CLK(clka), .Q(
        prev_mult_select[1]) );
  DFFNEGX1 \prev_mult_select_reg[0]  ( .D(N290), .CLK(clka), .Q(
        prev_mult_select[0]) );
  DFFNEGX1 \spin_reg_reg[3]  ( .D(n458), .CLK(clka), .Q(spin_reg[3]) );
  DFFNEGX1 \spin_reg_reg[2]  ( .D(n457), .CLK(clka), .Q(spin_reg[2]) );
  DFFNEGX1 \spin_reg_reg[1]  ( .D(n456), .CLK(clka), .Q(spin_reg[1]) );
  DFFNEGX1 \spin_reg_reg[0]  ( .D(n455), .CLK(clka), .Q(spin_reg[0]) );
  DFFNEGX1 \h_reg_reg[3]  ( .D(n454), .CLK(clka), .Q(h_reg[3]) );
  DFFNEGX1 \h_reg_reg[2]  ( .D(n453), .CLK(clka), .Q(h_reg[2]) );
  DFFNEGX1 \h_reg_reg[1]  ( .D(n452), .CLK(clka), .Q(h_reg[1]) );
  DFFNEGX1 \h_reg_reg[0]  ( .D(n451), .CLK(clka), .Q(h_reg[0]) );
  DFFNEGX1 \mult_cycle_reg[0]  ( .D(N275), .CLK(clka), .Q(mult_cycle[0]) );
  DFFNEGX1 \mult_cycle_reg[2]  ( .D(N277), .CLK(clka), .Q(mult_cycle[2]) );
  DFFNEGX1 \mult_cycle_reg[1]  ( .D(N276), .CLK(clka), .Q(mult_cycle[1]) );
  DFFNEGX1 \trig_h_reg[3]  ( .D(n450), .CLK(clka), .Q(trig_h[3]) );
  DFFNEGX1 \trig_h_reg[2]  ( .D(n449), .CLK(clka), .Q(trig_h[2]) );
  DFFNEGX1 \trig_h_reg[1]  ( .D(n448), .CLK(clka), .Q(trig_h[1]) );
  DFFNEGX1 \trig_h_reg[0]  ( .D(n447), .CLK(clka), .Q(trig_h[0]) );
  DFFNEGX1 \spin_adj_reg[2]  ( .D(n446), .CLK(clka), .Q(spin_adj[2]) );
  DFFNEGX1 \spin_adj_reg[1]  ( .D(n445), .CLK(clka), .Q(spin_adj[1]) );
  DFFNEGX1 \spin_adj_reg[0]  ( .D(n444), .CLK(clka), .Q(spin_adj[0]) );
  DFFNEGX1 \v_reg_reg[3]  ( .D(n443), .CLK(clka), .Q(v_reg[3]) );
  DFFNEGX1 \v_reg_reg[2]  ( .D(n442), .CLK(clka), .Q(v_reg[2]) );
  DFFNEGX1 \v_reg_reg[1]  ( .D(n441), .CLK(clka), .Q(v_reg[1]) );
  DFFNEGX1 \v_reg_reg[0]  ( .D(n440), .CLK(clka), .Q(v_reg[0]) );
  DFFNEGX1 \trig_v_reg[1]  ( .D(n438), .CLK(clka), .Q(trig_v[1]) );
  DFFNEGX1 \trig_v_reg[0]  ( .D(n439), .CLK(clka), .Q(trig_v[0]) );
  DFFNEGX1 \trig_v_reg[3]  ( .D(n436), .CLK(clka), .Q(trig_v[3]) );
  DFFNEGX1 \trig_v_reg[2]  ( .D(n437), .CLK(clka), .Q(trig_v[2]) );
  DFFNEGX1 \power_reg_reg[3]  ( .D(n435), .CLK(clka), .Q(power_reg[3]) );
  DFFNEGX1 \mult_shift_b_reg[3]  ( .D(n428), .CLK(clka), .Q(mult_shift_b[3])
         );
  DFFNEGX1 \power_reg_reg[2]  ( .D(n434), .CLK(clka), .Q(power_reg[2]) );
  DFFNEGX1 \mult_shift_b_reg[2]  ( .D(n429), .CLK(clka), .Q(mult_shift_b[2])
         );
  DFFNEGX1 \power_reg_reg[1]  ( .D(n433), .CLK(clka), .Q(power_reg[1]) );
  DFFNEGX1 \mult_shift_b_reg[1]  ( .D(n430), .CLK(clka), .Q(mult_shift_b[1])
         );
  DFFNEGX1 \power_reg_reg[0]  ( .D(n432), .CLK(clka), .Q(power_reg[0]) );
  DFFNEGX1 \mult_shift_b_reg[0]  ( .D(n431), .CLK(clka), .Q(mult_shift_b[0])
         );
  DFFNEGX1 valid_reg ( .D(N442), .CLK(clkb), .Q(valid) );
  DFFNEGX1 \keeper_x_reg[3]  ( .D(n427), .CLK(clkb), .Q(keeper_x[3]) );
  DFFNEGX1 \keeper_x_reg[2]  ( .D(n426), .CLK(clkb), .Q(keeper_x[2]) );
  DFFNEGX1 \keeper_x_reg[1]  ( .D(n425), .CLK(clkb), .Q(keeper_x[1]) );
  DFFNEGX1 \keeper_x_reg[0]  ( .D(n424), .CLK(clkb), .Q(keeper_x[0]) );
  DFFNEGX1 \keeper_y_reg[3]  ( .D(n423), .CLK(clkb), .Q(keeper_y[3]) );
  DFFNEGX1 \keeper_y_reg[2]  ( .D(n422), .CLK(clkb), .Q(keeper_y[2]) );
  DFFNEGX1 \keeper_y_reg[1]  ( .D(n421), .CLK(n483), .Q(keeper_y[1]) );
  DFFNEGX1 \keeper_y_reg[0]  ( .D(n420), .CLK(n483), .Q(keeper_y[0]) );
  DFFNEGX1 \mult_accum_reg[0]  ( .D(N397), .CLK(n483), .Q(
        mult_product_debug[0]) );
  DFFNEGX1 \v_sq_reg_reg[0]  ( .D(n419), .CLK(n483), .Q(v_sq_reg[0]) );
  DFFNEGX1 \mult_shift_a_reg[0]  ( .D(n407), .CLK(clka), .Q(mult_shift_a[0])
         );
  DFFNEGX1 \mult_shift_a_reg[1]  ( .D(n406), .CLK(clka), .Q(mult_shift_a[1])
         );
  DFFNEGX1 \mult_shift_a_reg[2]  ( .D(n405), .CLK(clka), .Q(mult_shift_a[2])
         );
  DFFNEGX1 \mult_shift_a_reg[3]  ( .D(n404), .CLK(clka), .Q(mult_shift_a[3])
         );
  DFFNEGX1 \mult_shift_a_reg[4]  ( .D(n501), .CLK(clka), .Q(mult_shift_a[4])
         );
  DFFNEGX1 \mult_shift_a_reg[5]  ( .D(n502), .CLK(clka), .Q(mult_shift_a[5])
         );
  DFFNEGX1 \mult_shift_a_reg[6]  ( .D(n503), .CLK(clka), .Q(mult_shift_a[6])
         );
  DFFNEGX1 \mult_shift_a_reg[7]  ( .D(n504), .CLK(clka), .Q(mult_shift_a[7])
         );
  DFFNEGX1 \mult_accum_reg[1]  ( .D(N398), .CLK(n483), .Q(
        mult_product_debug[1]) );
  DFFNEGX1 \v_sq_reg_reg[1]  ( .D(n418), .CLK(n483), .Q(v_sq_reg[1]) );
  DFFNEGX1 \mult_accum_reg[2]  ( .D(N399), .CLK(n483), .Q(
        mult_product_debug[2]) );
  DFFNEGX1 \v_sq_reg_reg[2]  ( .D(n417), .CLK(n483), .Q(v_sq_reg[2]) );
  DFFNEGX1 \mult_accum_reg[3]  ( .D(N400), .CLK(n483), .Q(
        mult_product_debug[3]) );
  DFFNEGX1 \v_sq_reg_reg[3]  ( .D(n416), .CLK(n483), .Q(v_sq_reg[3]) );
  DFFNEGX1 \mult_accum_reg[4]  ( .D(N401), .CLK(n483), .Q(
        mult_product_debug[4]) );
  DFFNEGX1 \mult_accum_reg[5]  ( .D(N402), .CLK(n483), .Q(
        mult_product_debug[5]) );
  DFFNEGX1 \mult_accum_reg[6]  ( .D(N403), .CLK(n483), .Q(
        mult_product_debug[6]) );
  DFFNEGX1 \mult_accum_reg[7]  ( .D(N404), .CLK(n482), .Q(
        mult_product_debug[7]) );
  DFFNEGX1 \lateral_reg_reg[0]  ( .D(n415), .CLK(n482), .Q(lateral_debug[0])
         );
  DFFNEGX1 \ball_x_reg[0]  ( .D(n411), .CLK(n482), .Q(ball_x[0]) );
  DFFNEGX1 \lateral_reg_reg[1]  ( .D(n414), .CLK(n482), .Q(lateral_debug[1])
         );
  DFFNEGX1 \ball_x_reg[1]  ( .D(n410), .CLK(n482), .Q(ball_x[1]) );
  DFFNEGX1 \lateral_reg_reg[2]  ( .D(n413), .CLK(n482), .Q(lateral_debug[2])
         );
  DFFNEGX1 \ball_x_reg[2]  ( .D(n409), .CLK(n482), .Q(ball_x[2]) );
  DFFNEGX1 \lateral_reg_reg[3]  ( .D(n412), .CLK(n482), .Q(lateral_debug[3])
         );
  DFFNEGX1 \ball_x_reg[3]  ( .D(n408), .CLK(n482), .Q(ball_x[3]) );
  DFFNEGX1 \lateral_reg_reg[4]  ( .D(n494), .CLK(n482), .Q(lateral_debug[4])
         );
  DFFNEGX1 \lateral_reg_reg[5]  ( .D(n495), .CLK(n482), .Q(lateral_debug[5])
         );
  DFFNEGX1 \lateral_reg_reg[6]  ( .D(n496), .CLK(n482), .Q(lateral_debug[6])
         );
  DFFNEGX1 \lateral_reg_reg[7]  ( .D(n497), .CLK(n482), .Q(lateral_debug[7])
         );
  DFFNEGX1 \range_reg_reg[3]  ( .D(N412), .CLK(n481), .Q(range_debug[3]) );
  DFFNEGX1 \range_reg_reg[0]  ( .D(N409), .CLK(n481), .Q(range_debug[0]) );
  DFFNEGX1 \ball_y_reg[0]  ( .D(n403), .CLK(n481), .Q(ball_y[0]) );
  DFFNEGX1 \range_reg_reg[1]  ( .D(N410), .CLK(n481), .Q(range_debug[1]) );
  DFFNEGX1 \ball_y_reg[1]  ( .D(n402), .CLK(n481), .Q(ball_y[1]) );
  DFFNEGX1 \range_reg_reg[2]  ( .D(N411), .CLK(n481), .Q(range_debug[2]) );
  DFFNEGX1 \ball_y_reg[2]  ( .D(n401), .CLK(n481), .Q(ball_y[2]) );
  DFFNEGX1 \range_reg_reg[4]  ( .D(n488), .CLK(n481), .Q(range_debug[4]) );
  DFFNEGX1 \range_reg_reg[5]  ( .D(n489), .CLK(n481), .Q(range_debug[5]) );
  DFFNEGX1 \range_reg_reg[6]  ( .D(n490), .CLK(n481), .Q(range_debug[6]) );
  DFFNEGX1 \range_reg_reg[7]  ( .D(n491), .CLK(n481), .Q(range_debug[7]) );
  DFFNEGX1 \ball_y_reg[3]  ( .D(n400), .CLK(n481), .Q(ball_y[3]) );
  DFFNEGX1 goal_flag_reg ( .D(n399), .CLK(n481), .Q(goal_flag) );
  AND2X2 U4 ( .A(n266), .B(n511), .Y(n256) );
  AND2X2 U5 ( .A(n266), .B(n512), .Y(n203) );
  AND2X2 U6 ( .A(n270), .B(n479), .Y(n272) );
  AND2X2 U7 ( .A(n300), .B(n480), .Y(n302) );
  AND2X2 U8 ( .A(n335), .B(n480), .Y(n337) );
  AND2X2 U9 ( .A(n341), .B(n480), .Y(n343) );
  AND2X2 U10 ( .A(n479), .B(lfsr_reg[3]), .Y(N59) );
  AND2X2 U11 ( .A(n479), .B(lfsr_reg[1]), .Y(N57) );
  AND2X2 U12 ( .A(display_enable), .B(n480), .Y(N442) );
  AND2X2 U13 ( .A(n357), .B(n480), .Y(n351) );
  AND2X2 U14 ( .A(n358), .B(n480), .Y(N412) );
  AND2X2 U15 ( .A(n361), .B(n480), .Y(N411) );
  AND2X2 U16 ( .A(n363), .B(n480), .Y(N410) );
  AND2X2 U17 ( .A(n365), .B(n480), .Y(N409) );
  AND2X2 U18 ( .A(n356), .B(n359), .Y(n357) );
  AND2X2 U19 ( .A(n368), .B(n480), .Y(N404) );
  AND2X2 U20 ( .A(n373), .B(n480), .Y(N403) );
  AND2X2 U24 ( .A(n375), .B(n480), .Y(N402) );
  AND2X2 U25 ( .A(n377), .B(n480), .Y(N401) );
  AND2X2 U26 ( .A(n379), .B(n479), .Y(N400) );
  AND2X2 U27 ( .A(n381), .B(n479), .Y(N399) );
  AND2X2 U28 ( .A(n383), .B(n479), .Y(N398) );
  AND2X2 U29 ( .A(n385), .B(n480), .Y(N397) );
  AND2X2 U30 ( .A(n269), .B(n367), .Y(n398) );
  OAI21X1 U136 ( .A(n493), .B(n589), .C(n148), .Y(n399) );
  OAI21X1 U137 ( .A(n149), .B(n150), .C(n459), .Y(n148) );
  NAND3X1 U138 ( .A(n152), .B(n153), .C(n154), .Y(n150) );
  OAI21X1 U139 ( .A(n155), .B(n156), .C(n157), .Y(n154) );
  XNOR2X1 U140 ( .A(n158), .B(n159), .Y(n156) );
  AOI21X1 U141 ( .A(n158), .B(keeper_y[2]), .C(n561), .Y(n155) );
  NOR2X1 U142 ( .A(n566), .B(range_debug[1]), .Y(n158) );
  OAI21X1 U143 ( .A(n160), .B(n161), .C(n554), .Y(n153) );
  XOR2X1 U144 ( .A(n163), .B(n164), .Y(n161) );
  AOI21X1 U145 ( .A(n163), .B(keeper_x[2]), .C(n165), .Y(n160) );
  NOR2X1 U146 ( .A(n558), .B(lateral_debug[1]), .Y(n163) );
  OAI21X1 U147 ( .A(n166), .B(n167), .C(n562), .Y(n152) );
  XNOR2X1 U148 ( .A(n168), .B(n159), .Y(n167) );
  AOI21X1 U149 ( .A(n168), .B(n564), .C(n561), .Y(n166) );
  NOR2X1 U150 ( .A(n587), .B(keeper_y[1]), .Y(n168) );
  NAND3X1 U151 ( .A(n170), .B(n171), .C(n172), .Y(n149) );
  OAI21X1 U152 ( .A(n173), .B(n174), .C(n162), .Y(n172) );
  XOR2X1 U153 ( .A(n175), .B(n164), .Y(n174) );
  AOI21X1 U154 ( .A(n175), .B(n556), .C(n165), .Y(n173) );
  NOR2X1 U155 ( .A(n582), .B(keeper_x[1]), .Y(n175) );
  OAI21X1 U156 ( .A(n559), .B(n176), .C(n177), .Y(n171) );
  OAI21X1 U157 ( .A(n557), .B(n178), .C(n179), .Y(n177) );
  NAND3X1 U158 ( .A(n180), .B(n181), .C(n162), .Y(n179) );
  OR2X1 U159 ( .A(n162), .B(n176), .Y(n178) );
  AOI22X1 U160 ( .A(n555), .B(lateral_debug[3]), .C(n182), .D(n165), .Y(n162)
         );
  XOR2X1 U161 ( .A(keeper_x[3]), .B(n584), .Y(n165) );
  OAI22X1 U162 ( .A(n164), .B(keeper_x[1]), .C(n583), .D(keeper_x[2]), .Y(n182) );
  XOR2X1 U163 ( .A(n556), .B(n583), .Y(n164) );
  XNOR2X1 U164 ( .A(n558), .B(lateral_debug[1]), .Y(n180) );
  NOR2X1 U165 ( .A(n560), .B(lateral_debug[0]), .Y(n176) );
  NAND2X1 U166 ( .A(lateral_debug[0]), .B(n560), .Y(n181) );
  OAI21X1 U167 ( .A(n567), .B(n183), .C(n184), .Y(n170) );
  OAI21X1 U168 ( .A(n565), .B(n185), .C(n186), .Y(n184) );
  NAND3X1 U169 ( .A(n187), .B(n188), .C(n562), .Y(n186) );
  OR2X1 U170 ( .A(n562), .B(n183), .Y(n185) );
  OAI22X1 U171 ( .A(keeper_y[3]), .B(n585), .C(n189), .D(n169), .Y(n157) );
  XNOR2X1 U172 ( .A(n563), .B(range_debug[3]), .Y(n169) );
  AOI22X1 U173 ( .A(n159), .B(n566), .C(range_debug[2]), .D(n564), .Y(n189) );
  XOR2X1 U174 ( .A(keeper_y[2]), .B(n588), .Y(n159) );
  XNOR2X1 U175 ( .A(n566), .B(range_debug[1]), .Y(n187) );
  NOR2X1 U176 ( .A(n568), .B(range_debug[0]), .Y(n183) );
  NAND2X1 U177 ( .A(range_debug[0]), .B(n568), .Y(n188) );
  OAI21X1 U178 ( .A(n585), .B(n478), .C(n190), .Y(n400) );
  NAND2X1 U179 ( .A(ball_y[3]), .B(n477), .Y(n190) );
  OAI21X1 U180 ( .A(n588), .B(n478), .C(n192), .Y(n401) );
  NAND2X1 U181 ( .A(ball_y[2]), .B(n477), .Y(n192) );
  OAI21X1 U182 ( .A(n587), .B(n478), .C(n193), .Y(n402) );
  NAND2X1 U183 ( .A(ball_y[1]), .B(n477), .Y(n193) );
  OAI21X1 U184 ( .A(n586), .B(n478), .C(n194), .Y(n403) );
  NAND2X1 U185 ( .A(ball_y[0]), .B(n477), .Y(n194) );
  AOI22X1 U186 ( .A(mult_shift_a[7]), .B(n476), .C(mult_shift_a[6]), .D(n473), 
        .Y(n195) );
  AOI22X1 U187 ( .A(mult_shift_a[6]), .B(n476), .C(mult_shift_a[5]), .D(n473), 
        .Y(n198) );
  AOI22X1 U188 ( .A(mult_shift_a[5]), .B(n476), .C(mult_shift_a[4]), .D(n473), 
        .Y(n199) );
  AOI22X1 U189 ( .A(mult_shift_a[4]), .B(n476), .C(mult_shift_a[3]), .D(n473), 
        .Y(n200) );
  NAND2X1 U190 ( .A(n201), .B(n202), .Y(n404) );
  AOI21X1 U191 ( .A(v_sq_reg[3]), .B(n203), .C(n204), .Y(n202) );
  OAI21X1 U192 ( .A(n585), .B(n205), .C(n206), .Y(n204) );
  AOI22X1 U193 ( .A(n473), .B(mult_shift_a[2]), .C(n476), .D(mult_shift_a[3]), 
        .Y(n201) );
  NAND2X1 U194 ( .A(n207), .B(n208), .Y(n405) );
  AOI21X1 U195 ( .A(v_sq_reg[2]), .B(n203), .C(n209), .Y(n208) );
  OAI21X1 U196 ( .A(n588), .B(n205), .C(n210), .Y(n209) );
  AOI22X1 U197 ( .A(n473), .B(mult_shift_a[1]), .C(n476), .D(mult_shift_a[2]), 
        .Y(n207) );
  NAND2X1 U198 ( .A(n211), .B(n212), .Y(n406) );
  AOI21X1 U199 ( .A(v_sq_reg[1]), .B(n203), .C(n213), .Y(n212) );
  OAI21X1 U200 ( .A(n587), .B(n205), .C(n214), .Y(n213) );
  AOI22X1 U201 ( .A(n473), .B(mult_shift_a[0]), .C(n476), .D(mult_shift_a[1]), 
        .Y(n211) );
  NAND2X1 U202 ( .A(n499), .B(n215), .Y(n407) );
  AOI22X1 U203 ( .A(mult_shift_a[0]), .B(n476), .C(n203), .D(v_sq_reg[0]), .Y(
        n215) );
  OAI21X1 U204 ( .A(n586), .B(n205), .C(n217), .Y(n216) );
  AOI22X1 U205 ( .A(N352), .B(n219), .C(lateral_debug[7]), .D(n220), .Y(n218)
         );
  AOI22X1 U206 ( .A(N351), .B(n219), .C(lateral_debug[6]), .D(n220), .Y(n221)
         );
  AOI22X1 U207 ( .A(N350), .B(n219), .C(lateral_debug[5]), .D(n220), .Y(n222)
         );
  AOI22X1 U208 ( .A(N349), .B(n219), .C(lateral_debug[4]), .D(n220), .Y(n223)
         );
  OAI21X1 U209 ( .A(n584), .B(n478), .C(n224), .Y(n408) );
  NAND2X1 U210 ( .A(ball_x[3]), .B(n477), .Y(n224) );
  OAI21X1 U211 ( .A(n583), .B(n478), .C(n225), .Y(n409) );
  NAND2X1 U212 ( .A(ball_x[2]), .B(n477), .Y(n225) );
  OAI21X1 U213 ( .A(n582), .B(n478), .C(n226), .Y(n410) );
  NAND2X1 U214 ( .A(ball_x[1]), .B(n477), .Y(n226) );
  OAI21X1 U215 ( .A(n581), .B(n478), .C(n227), .Y(n411) );
  NAND2X1 U216 ( .A(ball_x[0]), .B(n477), .Y(n227) );
  NOR2X1 U218 ( .A(collision_check_enable), .B(n471), .Y(n191) );
  OAI21X1 U219 ( .A(n584), .B(n498), .C(n228), .Y(n412) );
  NAND2X1 U220 ( .A(N348), .B(n219), .Y(n228) );
  OAI21X1 U221 ( .A(n583), .B(n498), .C(n229), .Y(n413) );
  NAND2X1 U222 ( .A(N347), .B(n219), .Y(n229) );
  OAI21X1 U223 ( .A(n582), .B(n498), .C(n230), .Y(n414) );
  NAND2X1 U224 ( .A(N346), .B(n219), .Y(n230) );
  OAI21X1 U225 ( .A(n581), .B(n498), .C(n231), .Y(n415) );
  NAND2X1 U226 ( .A(N345), .B(n219), .Y(n231) );
  NOR2X1 U227 ( .A(n220), .B(n471), .Y(n219) );
  AOI21X1 U228 ( .A(n232), .B(n233), .C(n472), .Y(n220) );
  OAI22X1 U229 ( .A(n576), .B(n234), .C(n235), .D(n575), .Y(n416) );
  OAI22X1 U230 ( .A(n574), .B(n234), .C(n235), .D(n573), .Y(n417) );
  OAI22X1 U231 ( .A(n572), .B(n234), .C(n235), .D(n571), .Y(n418) );
  OAI22X1 U232 ( .A(n570), .B(n234), .C(n235), .D(n569), .Y(n419) );
  NAND2X1 U233 ( .A(n234), .B(n479), .Y(n235) );
  OAI21X1 U234 ( .A(multiplication_select[1]), .B(n506), .C(n479), .Y(n234) );
  OAI22X1 U235 ( .A(n568), .B(n236), .C(n237), .D(n238), .Y(n420) );
  XOR2X1 U236 ( .A(n239), .B(h_reg[0]), .Y(n237) );
  XOR2X1 U237 ( .A(lfsr_reg[4]), .B(n516), .Y(n239) );
  OAI22X1 U238 ( .A(n566), .B(n236), .C(n240), .D(n238), .Y(n421) );
  XOR2X1 U239 ( .A(n241), .B(h_reg[1]), .Y(n240) );
  XOR2X1 U240 ( .A(lfsr_reg[5]), .B(n515), .Y(n241) );
  OAI22X1 U241 ( .A(n564), .B(n236), .C(n242), .D(n238), .Y(n422) );
  XOR2X1 U242 ( .A(n243), .B(h_reg[2]), .Y(n242) );
  XOR2X1 U243 ( .A(lfsr_reg[6]), .B(n514), .Y(n243) );
  OAI22X1 U244 ( .A(n563), .B(n236), .C(n244), .D(n238), .Y(n423) );
  XOR2X1 U245 ( .A(n519), .B(n245), .Y(n244) );
  XOR2X1 U246 ( .A(spin_reg[3]), .B(lfsr_reg[7]), .Y(n245) );
  OAI22X1 U247 ( .A(n560), .B(n236), .C(n246), .D(n238), .Y(n424) );
  XNOR2X1 U248 ( .A(lfsr_reg[0]), .B(n247), .Y(n246) );
  XOR2X1 U249 ( .A(v_reg[0]), .B(power_reg[0]), .Y(n247) );
  OAI22X1 U250 ( .A(n558), .B(n236), .C(n248), .D(n238), .Y(n425) );
  XNOR2X1 U251 ( .A(lfsr_reg[1]), .B(n249), .Y(n248) );
  XOR2X1 U252 ( .A(v_reg[1]), .B(power_reg[1]), .Y(n249) );
  OAI22X1 U253 ( .A(n556), .B(n236), .C(n250), .D(n238), .Y(n426) );
  XNOR2X1 U254 ( .A(lfsr_reg[2]), .B(n251), .Y(n250) );
  XOR2X1 U255 ( .A(v_reg[2]), .B(power_reg[2]), .Y(n251) );
  OAI22X1 U256 ( .A(n555), .B(n236), .C(n252), .D(n238), .Y(n427) );
  NAND2X1 U257 ( .A(n236), .B(n479), .Y(n238) );
  XNOR2X1 U258 ( .A(lfsr_reg[3]), .B(n253), .Y(n252) );
  XOR2X1 U259 ( .A(v_reg[3]), .B(power_reg[3]), .Y(n253) );
  NAND2X1 U261 ( .A(n500), .B(n254), .Y(n428) );
  AOI22X1 U262 ( .A(n476), .B(mult_shift_b[3]), .C(n203), .D(trig_v[3]), .Y(
        n254) );
  OAI21X1 U263 ( .A(n205), .B(n527), .C(n206), .Y(n255) );
  NAND2X1 U264 ( .A(power_reg[3]), .B(n256), .Y(n206) );
  NAND2X1 U265 ( .A(n257), .B(n258), .Y(n429) );
  AOI21X1 U266 ( .A(trig_v[2]), .B(n203), .C(n259), .Y(n258) );
  OAI21X1 U267 ( .A(n205), .B(n528), .C(n210), .Y(n259) );
  NAND2X1 U268 ( .A(power_reg[2]), .B(n256), .Y(n210) );
  AOI22X1 U269 ( .A(mult_shift_b[3]), .B(n473), .C(mult_shift_b[2]), .D(n476), 
        .Y(n257) );
  NAND2X1 U270 ( .A(n260), .B(n261), .Y(n430) );
  AOI21X1 U271 ( .A(trig_v[1]), .B(n203), .C(n262), .Y(n261) );
  OAI21X1 U272 ( .A(n205), .B(n529), .C(n214), .Y(n262) );
  NAND2X1 U273 ( .A(power_reg[1]), .B(n256), .Y(n214) );
  AOI22X1 U274 ( .A(mult_shift_b[2]), .B(n473), .C(mult_shift_b[1]), .D(n476), 
        .Y(n260) );
  NAND2X1 U275 ( .A(n263), .B(n264), .Y(n431) );
  AOI21X1 U276 ( .A(trig_v[0]), .B(n203), .C(n265), .Y(n264) );
  OAI21X1 U277 ( .A(n205), .B(n530), .C(n217), .Y(n265) );
  NAND2X1 U278 ( .A(power_reg[0]), .B(n256), .Y(n217) );
  NAND2X1 U279 ( .A(n232), .B(n266), .Y(n205) );
  NOR2X1 U280 ( .A(n511), .B(n512), .Y(n232) );
  NOR2X1 U281 ( .A(n267), .B(n472), .Y(n266) );
  AOI22X1 U282 ( .A(mult_shift_b[1]), .B(n473), .C(n476), .D(mult_shift_b[0]), 
        .Y(n263) );
  AOI21X1 U283 ( .A(n268), .B(n269), .C(n472), .Y(n196) );
  OAI21X1 U284 ( .A(n545), .B(n270), .C(n271), .Y(n432) );
  NAND2X1 U285 ( .A(ring_power[0]), .B(n272), .Y(n271) );
  OAI21X1 U286 ( .A(n544), .B(n270), .C(n273), .Y(n433) );
  NAND2X1 U287 ( .A(ring_power[1]), .B(n272), .Y(n273) );
  OAI21X1 U288 ( .A(n543), .B(n270), .C(n274), .Y(n434) );
  NAND2X1 U289 ( .A(ring_power[2]), .B(n272), .Y(n274) );
  OAI21X1 U290 ( .A(n542), .B(n270), .C(n275), .Y(n435) );
  NAND2X1 U291 ( .A(ring_power[3]), .B(n272), .Y(n275) );
  OR2X1 U292 ( .A(n471), .B(strike_store_enable), .Y(n270) );
  OAI21X1 U293 ( .A(n505), .B(n540), .C(n276), .Y(n436) );
  OAI21X1 U294 ( .A(n277), .B(n278), .C(n487), .Y(n276) );
  OAI21X1 U295 ( .A(n279), .B(n535), .C(n280), .Y(n278) );
  OAI21X1 U296 ( .A(n505), .B(n541), .C(n281), .Y(n437) );
  OAI21X1 U297 ( .A(n277), .B(n282), .C(n487), .Y(n281) );
  OAI21X1 U298 ( .A(n536), .B(n283), .C(n284), .Y(n282) );
  NAND2X1 U299 ( .A(v_reg[0]), .B(n535), .Y(n283) );
  OAI21X1 U300 ( .A(n537), .B(n285), .C(n532), .Y(n277) );
  OAI21X1 U301 ( .A(n533), .B(n535), .C(n287), .Y(n286) );
  OAI21X1 U302 ( .A(n505), .B(n538), .C(n288), .Y(n438) );
  OAI21X1 U303 ( .A(n289), .B(n290), .C(n487), .Y(n288) );
  OAI21X1 U304 ( .A(v_reg[3]), .B(n291), .C(n531), .Y(n290) );
  AOI22X1 U305 ( .A(n293), .B(n535), .C(n294), .D(v_reg[1]), .Y(n291) );
  XOR2X1 U306 ( .A(v_reg[1]), .B(v_reg[0]), .Y(n293) );
  OAI21X1 U307 ( .A(n285), .B(n295), .C(n284), .Y(n289) );
  NAND2X1 U308 ( .A(n279), .B(v_reg[2]), .Y(n284) );
  NAND2X1 U309 ( .A(v_reg[1]), .B(v_reg[0]), .Y(n295) );
  OAI21X1 U310 ( .A(n505), .B(n539), .C(n296), .Y(n439) );
  OAI21X1 U311 ( .A(n292), .B(n297), .C(n487), .Y(n296) );
  OAI21X1 U312 ( .A(n536), .B(n298), .C(n287), .Y(n297) );
  NAND3X1 U313 ( .A(v_reg[1]), .B(n537), .C(n534), .Y(n287) );
  OR2X1 U314 ( .A(n294), .B(v_reg[3]), .Y(n298) );
  OAI21X1 U315 ( .A(n299), .B(n533), .C(n280), .Y(n292) );
  NAND2X1 U316 ( .A(n279), .B(n534), .Y(n280) );
  NAND2X1 U317 ( .A(v_reg[3]), .B(n535), .Y(n285) );
  NOR2X1 U318 ( .A(v_reg[1]), .B(v_reg[0]), .Y(n279) );
  AOI21X1 U319 ( .A(v_reg[2]), .B(v_reg[1]), .C(n294), .Y(n299) );
  NOR2X1 U320 ( .A(n535), .B(n537), .Y(n294) );
  OAI21X1 U321 ( .A(n537), .B(n300), .C(n301), .Y(n440) );
  NAND2X1 U322 ( .A(ring_v_angle[0]), .B(n302), .Y(n301) );
  OAI21X1 U323 ( .A(n536), .B(n300), .C(n303), .Y(n441) );
  NAND2X1 U324 ( .A(ring_v_angle[1]), .B(n302), .Y(n303) );
  OAI21X1 U325 ( .A(n535), .B(n300), .C(n304), .Y(n442) );
  NAND2X1 U326 ( .A(ring_v_angle[2]), .B(n302), .Y(n304) );
  OAI21X1 U327 ( .A(n533), .B(n300), .C(n305), .Y(n443) );
  NAND2X1 U328 ( .A(ring_v_angle[3]), .B(n302), .Y(n305) );
  OR2X1 U329 ( .A(n472), .B(v_angle_store_enable), .Y(n300) );
  OAI21X1 U330 ( .A(n515), .B(n306), .C(n307), .Y(n444) );
  NAND2X1 U331 ( .A(spin_adj[0]), .B(n308), .Y(n307) );
  OAI21X1 U332 ( .A(n514), .B(n306), .C(n309), .Y(n445) );
  NAND2X1 U333 ( .A(spin_adj[1]), .B(n308), .Y(n309) );
  OAI21X1 U334 ( .A(n513), .B(n306), .C(n310), .Y(n446) );
  NAND2X1 U335 ( .A(spin_adj[2]), .B(n308), .Y(n310) );
  OAI21X1 U336 ( .A(n505), .B(n530), .C(n311), .Y(n447) );
  OAI21X1 U337 ( .A(n312), .B(n313), .C(n487), .Y(n311) );
  OAI21X1 U338 ( .A(n522), .B(n314), .C(n315), .Y(n313) );
  OR2X1 U339 ( .A(n316), .B(h_reg[3]), .Y(n314) );
  OAI21X1 U340 ( .A(n505), .B(n529), .C(n317), .Y(n448) );
  OAI21X1 U341 ( .A(n318), .B(n319), .C(n487), .Y(n317) );
  OAI21X1 U342 ( .A(h_reg[3]), .B(n320), .C(n518), .Y(n319) );
  OAI21X1 U343 ( .A(n321), .B(n519), .C(n322), .Y(n312) );
  AOI21X1 U344 ( .A(h_reg[2]), .B(h_reg[1]), .C(n316), .Y(n321) );
  AOI22X1 U345 ( .A(n323), .B(n521), .C(n316), .D(h_reg[1]), .Y(n320) );
  NOR2X1 U346 ( .A(n521), .B(n523), .Y(n316) );
  XOR2X1 U347 ( .A(h_reg[1]), .B(h_reg[0]), .Y(n323) );
  OAI21X1 U348 ( .A(n324), .B(n325), .C(n326), .Y(n318) );
  NAND2X1 U349 ( .A(h_reg[1]), .B(h_reg[0]), .Y(n325) );
  OAI21X1 U350 ( .A(n505), .B(n528), .C(n327), .Y(n449) );
  OAI21X1 U351 ( .A(n328), .B(n329), .C(n487), .Y(n327) );
  OAI21X1 U352 ( .A(n522), .B(n330), .C(n326), .Y(n329) );
  NAND2X1 U353 ( .A(n331), .B(h_reg[2]), .Y(n326) );
  NAND2X1 U354 ( .A(h_reg[0]), .B(n521), .Y(n330) );
  OAI21X1 U355 ( .A(n505), .B(n527), .C(n332), .Y(n450) );
  OAI21X1 U356 ( .A(n328), .B(n333), .C(n487), .Y(n332) );
  NAND2X1 U357 ( .A(n505), .B(n479), .Y(n306) );
  OAI21X1 U358 ( .A(n331), .B(n521), .C(n322), .Y(n333) );
  NAND2X1 U359 ( .A(n331), .B(n520), .Y(n322) );
  NOR2X1 U360 ( .A(h_reg[1]), .B(h_reg[0]), .Y(n331) );
  OAI21X1 U361 ( .A(n523), .B(n324), .C(n517), .Y(n328) );
  OAI21X1 U362 ( .A(n519), .B(n521), .C(n315), .Y(n334) );
  NAND3X1 U363 ( .A(h_reg[1]), .B(n523), .C(n520), .Y(n315) );
  NAND2X1 U364 ( .A(h_reg[3]), .B(n521), .Y(n324) );
  OAI21X1 U365 ( .A(n523), .B(n335), .C(n336), .Y(n451) );
  NAND2X1 U366 ( .A(ring_h_angle[0]), .B(n337), .Y(n336) );
  OAI21X1 U367 ( .A(n522), .B(n335), .C(n338), .Y(n452) );
  NAND2X1 U368 ( .A(ring_h_angle[1]), .B(n337), .Y(n338) );
  OAI21X1 U369 ( .A(n521), .B(n335), .C(n339), .Y(n453) );
  NAND2X1 U370 ( .A(ring_h_angle[2]), .B(n337), .Y(n339) );
  OAI21X1 U371 ( .A(n519), .B(n335), .C(n340), .Y(n454) );
  NAND2X1 U372 ( .A(ring_h_angle[3]), .B(n337), .Y(n340) );
  OR2X1 U373 ( .A(h_angle_store_enable), .B(n472), .Y(n335) );
  OAI21X1 U374 ( .A(n516), .B(n341), .C(n342), .Y(n455) );
  NAND2X1 U375 ( .A(ring_spin[0]), .B(n343), .Y(n342) );
  OAI21X1 U376 ( .A(n515), .B(n341), .C(n344), .Y(n456) );
  NAND2X1 U377 ( .A(ring_spin[1]), .B(n343), .Y(n344) );
  OAI21X1 U378 ( .A(n514), .B(n341), .C(n345), .Y(n457) );
  NAND2X1 U379 ( .A(ring_spin[2]), .B(n343), .Y(n345) );
  OAI21X1 U380 ( .A(n513), .B(n341), .C(n346), .Y(n458) );
  NAND2X1 U381 ( .A(ring_spin[3]), .B(n343), .Y(n346) );
  OR2X1 U382 ( .A(n472), .B(spin_store_enable), .Y(n341) );
  NOR2X1 U383 ( .A(n472), .B(n347), .Y(N63) );
  XNOR2X1 U384 ( .A(lfsr_reg[7]), .B(lfsr_reg[0]), .Y(n347) );
  NAND2X1 U385 ( .A(n348), .B(n479), .Y(N62) );
  XNOR2X1 U386 ( .A(lfsr_reg[6]), .B(lfsr_reg[0]), .Y(n348) );
  NOR2X1 U387 ( .A(n471), .B(n349), .Y(N61) );
  XNOR2X1 U388 ( .A(lfsr_reg[5]), .B(lfsr_reg[0]), .Y(n349) );
  OR2X1 U389 ( .A(n471), .B(lfsr_reg[4]), .Y(N60) );
  OR2X1 U390 ( .A(n471), .B(lfsr_reg[2]), .Y(N58) );
  NOR2X1 U391 ( .A(access_trig_enable), .B(n472), .Y(n308) );
  AOI22X1 U392 ( .A(range_debug[7]), .B(n351), .C(N334), .D(n352), .Y(n350) );
  AOI22X1 U393 ( .A(range_debug[6]), .B(n351), .C(N333), .D(n352), .Y(n353) );
  AOI22X1 U394 ( .A(range_debug[5]), .B(n351), .C(N332), .D(n352), .Y(n354) );
  AOI22X1 U395 ( .A(range_debug[4]), .B(n351), .C(N331), .D(n352), .Y(n355) );
  NOR2X1 U396 ( .A(n356), .B(n471), .Y(n352) );
  OAI21X1 U397 ( .A(n359), .B(n580), .C(n360), .Y(n358) );
  AOI22X1 U398 ( .A(n357), .B(range_debug[3]), .C(N330), .D(n507), .Y(n360) );
  OAI21X1 U399 ( .A(n359), .B(n579), .C(n362), .Y(n361) );
  AOI22X1 U400 ( .A(n357), .B(range_debug[2]), .C(N329), .D(n507), .Y(n362) );
  OAI21X1 U401 ( .A(n359), .B(n578), .C(n364), .Y(n363) );
  AOI22X1 U402 ( .A(n357), .B(range_debug[1]), .C(N328), .D(n507), .Y(n364) );
  OAI21X1 U403 ( .A(n359), .B(n577), .C(n366), .Y(n365) );
  AOI22X1 U404 ( .A(n357), .B(range_debug[0]), .C(N327), .D(n507), .Y(n366) );
  NAND2X1 U405 ( .A(range_enable), .B(n508), .Y(n356) );
  NAND2X1 U406 ( .A(n233), .B(n512), .Y(n359) );
  NOR2X1 U407 ( .A(n367), .B(n508), .Y(n233) );
  OAI21X1 U408 ( .A(n369), .B(n140), .C(n370), .Y(n368) );
  AOI22X1 U409 ( .A(n371), .B(mult_product_debug[7]), .C(N312), .D(n475), .Y(
        n370) );
  NAND2X1 U410 ( .A(mult_shift_b[0]), .B(mult_shift_a[7]), .Y(n140) );
  OAI21X1 U411 ( .A(n369), .B(n141), .C(n374), .Y(n373) );
  AOI22X1 U412 ( .A(n371), .B(mult_product_debug[6]), .C(N311), .D(n475), .Y(
        n374) );
  NAND2X1 U413 ( .A(mult_shift_a[6]), .B(mult_shift_b[0]), .Y(n141) );
  OAI21X1 U414 ( .A(n369), .B(n142), .C(n376), .Y(n375) );
  AOI22X1 U415 ( .A(n371), .B(mult_product_debug[5]), .C(N310), .D(n475), .Y(
        n376) );
  NAND2X1 U416 ( .A(mult_shift_a[5]), .B(mult_shift_b[0]), .Y(n142) );
  OAI21X1 U417 ( .A(n369), .B(n143), .C(n378), .Y(n377) );
  AOI22X1 U418 ( .A(n371), .B(mult_product_debug[4]), .C(N309), .D(n475), .Y(
        n378) );
  NAND2X1 U419 ( .A(mult_shift_a[4]), .B(mult_shift_b[0]), .Y(n143) );
  OAI21X1 U420 ( .A(n369), .B(n144), .C(n380), .Y(n379) );
  AOI22X1 U421 ( .A(n371), .B(mult_product_debug[3]), .C(N308), .D(n475), .Y(
        n380) );
  NAND2X1 U422 ( .A(mult_shift_a[3]), .B(mult_shift_b[0]), .Y(n144) );
  OAI21X1 U423 ( .A(n369), .B(n145), .C(n382), .Y(n381) );
  AOI22X1 U424 ( .A(n371), .B(mult_product_debug[2]), .C(N307), .D(n475), .Y(
        n382) );
  NAND2X1 U425 ( .A(mult_shift_a[2]), .B(mult_shift_b[0]), .Y(n145) );
  OAI21X1 U426 ( .A(n369), .B(n146), .C(n384), .Y(n383) );
  AOI22X1 U427 ( .A(n371), .B(mult_product_debug[1]), .C(N306), .D(n475), .Y(
        n384) );
  NAND2X1 U428 ( .A(mult_shift_a[1]), .B(mult_shift_b[0]), .Y(n146) );
  OAI21X1 U429 ( .A(n369), .B(n147), .C(n386), .Y(n385) );
  AOI22X1 U430 ( .A(n371), .B(mult_product_debug[0]), .C(N305), .D(n475), .Y(
        n386) );
  NOR2X1 U431 ( .A(n475), .B(n474), .Y(n371) );
  AOI21X1 U432 ( .A(n526), .B(n525), .C(n387), .Y(n372) );
  NAND2X1 U433 ( .A(mult_shift_a[0]), .B(mult_shift_b[0]), .Y(n147) );
  NAND3X1 U434 ( .A(n526), .B(n525), .C(n388), .Y(n369) );
  NOR2X1 U435 ( .A(n508), .B(n524), .Y(n388) );
  NOR2X1 U436 ( .A(n471), .B(n511), .Y(N291) );
  NOR2X1 U437 ( .A(n472), .B(n512), .Y(N290) );
  OAI21X1 U438 ( .A(n525), .B(n389), .C(n390), .Y(N277) );
  NAND3X1 U439 ( .A(mult_cycle[1]), .B(mult_cycle[0]), .C(n473), .Y(n390) );
  OAI21X1 U440 ( .A(n526), .B(n389), .C(n391), .Y(N276) );
  NAND3X1 U441 ( .A(mult_cycle[0]), .B(n526), .C(n473), .Y(n391) );
  NOR2X1 U442 ( .A(n392), .B(n471), .Y(n197) );
  NAND2X1 U443 ( .A(n393), .B(n479), .Y(n389) );
  OAI21X1 U444 ( .A(mult_cycle[0]), .B(n392), .C(n268), .Y(n393) );
  NOR2X1 U445 ( .A(n472), .B(n394), .Y(N275) );
  AOI21X1 U446 ( .A(n509), .B(n524), .C(n395), .Y(n394) );
  OAI21X1 U447 ( .A(n524), .B(n268), .C(n267), .Y(n395) );
  NAND3X1 U448 ( .A(n387), .B(n267), .C(n269), .Y(n268) );
  NAND2X1 U449 ( .A(n510), .B(n267), .Y(n392) );
  OAI21X1 U450 ( .A(n396), .B(n397), .C(n269), .Y(n267) );
  XOR2X1 U451 ( .A(prev_mult_select[1]), .B(multiplication_select[1]), .Y(n397) );
  XOR2X1 U452 ( .A(prev_mult_select[0]), .B(multiplication_select[0]), .Y(n396) );
  OAI21X1 U453 ( .A(n525), .B(n526), .C(n398), .Y(n387) );
  NAND3X1 U454 ( .A(mult_cycle[0]), .B(n526), .C(mult_cycle[2]), .Y(n367) );
  NAND2X1 U455 ( .A(n511), .B(n512), .Y(n269) );
  FAX1 \add_235/U1_1  ( .A(mult_product_debug[1]), .B(spin_adj[1]), .C(n461), 
        .YC(\add_235/carry [2]), .YS(N346) );
  FAX1 \add_235/U1_2  ( .A(mult_product_debug[2]), .B(spin_adj[2]), .C(
        \add_235/carry [2]), .YC(\add_235/carry [3]), .YS(N347) );
  FAX1 \add_230/U1_1  ( .A(range_debug[1]), .B(spin_adj[1]), .C(n460), .YC(
        \add_230/carry [2]), .YS(N328) );
  FAX1 \add_230/U1_2  ( .A(range_debug[2]), .B(spin_adj[2]), .C(
        \add_230/carry [2]), .YC(\add_230/carry [3]), .YS(N329) );
  FAX1 \add_218/U1_1  ( .A(mult_product_debug[1]), .B(n552), .C(n462), .YC(
        \add_218/carry [2]), .YS(N306) );
  FAX1 \add_218/U1_2  ( .A(mult_product_debug[2]), .B(n551), .C(
        \add_218/carry [2]), .YC(\add_218/carry [3]), .YS(N307) );
  FAX1 \add_218/U1_3  ( .A(mult_product_debug[3]), .B(n550), .C(
        \add_218/carry [3]), .YC(\add_218/carry [4]), .YS(N308) );
  FAX1 \add_218/U1_4  ( .A(mult_product_debug[4]), .B(n549), .C(
        \add_218/carry [4]), .YC(\add_218/carry [5]), .YS(N309) );
  FAX1 \add_218/U1_5  ( .A(mult_product_debug[5]), .B(n548), .C(
        \add_218/carry [5]), .YC(\add_218/carry [6]), .YS(N310) );
  FAX1 \add_218/U1_6  ( .A(mult_product_debug[6]), .B(n547), .C(
        \add_218/carry [6]), .YC(\add_218/carry [7]), .YS(N311) );
  FAX1 \add_218/U1_7  ( .A(mult_product_debug[7]), .B(n546), .C(
        \add_218/carry [7]), .YC(), .YS(N312) );
  AND2X2 U456 ( .A(n493), .B(n479), .Y(n459) );
  AND2X2 U457 ( .A(spin_adj[0]), .B(range_debug[0]), .Y(n460) );
  AND2X2 U458 ( .A(spin_adj[0]), .B(mult_product_debug[0]), .Y(n461) );
  AND2X2 U459 ( .A(n553), .B(mult_product_debug[0]), .Y(n462) );
  AND2X2 U460 ( .A(\add_235/carry [3]), .B(mult_product_debug[3]), .Y(n463) );
  AND2X2 U461 ( .A(n463), .B(mult_product_debug[4]), .Y(n464) );
  AND2X2 U462 ( .A(n464), .B(mult_product_debug[5]), .Y(n465) );
  AND2X2 U463 ( .A(\add_230/carry [3]), .B(range_debug[3]), .Y(n466) );
  AND2X2 U464 ( .A(n466), .B(range_debug[4]), .Y(n467) );
  AND2X2 U465 ( .A(n467), .B(range_debug[5]), .Y(n468) );
  AND2X2 U466 ( .A(n465), .B(mult_product_debug[6]), .Y(n469) );
  AND2X2 U467 ( .A(n468), .B(range_debug[6]), .Y(n470) );
  INVX2 U468 ( .A(n485), .Y(n481) );
  INVX2 U469 ( .A(n485), .Y(n482) );
  INVX2 U470 ( .A(n484), .Y(n483) );
  INVX2 U471 ( .A(n459), .Y(n478) );
  BUFX2 U472 ( .A(n197), .Y(n473) );
  BUFX2 U473 ( .A(n196), .Y(n476) );
  INVX2 U474 ( .A(n308), .Y(n505) );
  BUFX2 U475 ( .A(n492), .Y(n479) );
  BUFX2 U476 ( .A(n492), .Y(n480) );
  BUFX2 U477 ( .A(n372), .Y(n475) );
  BUFX2 U478 ( .A(n486), .Y(n485) );
  BUFX2 U479 ( .A(n486), .Y(n484) );
  INVX2 U480 ( .A(n369), .Y(n474) );
  BUFX2 U481 ( .A(restart), .Y(n472) );
  BUFX2 U482 ( .A(restart), .Y(n471) );
  BUFX2 U483 ( .A(n191), .Y(n477) );
  INVX2 U484 ( .A(clkb), .Y(n486) );
  XOR2X1 U485 ( .A(spin_adj[0]), .B(mult_product_debug[0]), .Y(N345) );
  XOR2X1 U486 ( .A(\add_235/carry [3]), .B(mult_product_debug[3]), .Y(N348) );
  XOR2X1 U487 ( .A(n463), .B(mult_product_debug[4]), .Y(N349) );
  XOR2X1 U488 ( .A(n464), .B(mult_product_debug[5]), .Y(N350) );
  XOR2X1 U489 ( .A(n465), .B(mult_product_debug[6]), .Y(N351) );
  XOR2X1 U490 ( .A(mult_product_debug[7]), .B(n469), .Y(N352) );
  XOR2X1 U491 ( .A(spin_adj[0]), .B(range_debug[0]), .Y(N327) );
  XOR2X1 U492 ( .A(\add_230/carry [3]), .B(range_debug[3]), .Y(N330) );
  XOR2X1 U493 ( .A(n466), .B(range_debug[4]), .Y(N331) );
  XOR2X1 U494 ( .A(n467), .B(range_debug[5]), .Y(N332) );
  XOR2X1 U495 ( .A(n468), .B(range_debug[6]), .Y(N333) );
  XOR2X1 U496 ( .A(range_debug[7]), .B(n470), .Y(N334) );
  XOR2X1 U497 ( .A(n553), .B(mult_product_debug[0]), .Y(N305) );
  OR2X2 U498 ( .A(n471), .B(sample_keeper_enable), .Y(n236) );
  INVX2 U499 ( .A(n306), .Y(n487) );
  INVX2 U500 ( .A(n355), .Y(n488) );
  INVX2 U501 ( .A(n354), .Y(n489) );
  INVX2 U502 ( .A(n353), .Y(n490) );
  INVX2 U503 ( .A(n350), .Y(n491) );
  INVX2 U504 ( .A(restart), .Y(n492) );
  INVX2 U505 ( .A(n477), .Y(n493) );
  INVX2 U506 ( .A(n223), .Y(n494) );
  INVX2 U507 ( .A(n222), .Y(n495) );
  INVX2 U508 ( .A(n221), .Y(n496) );
  INVX2 U509 ( .A(n218), .Y(n497) );
  INVX2 U510 ( .A(n220), .Y(n498) );
  INVX2 U511 ( .A(n216), .Y(n499) );
  INVX2 U512 ( .A(n255), .Y(n500) );
  INVX2 U513 ( .A(n200), .Y(n501) );
  INVX2 U514 ( .A(n199), .Y(n502) );
  INVX2 U515 ( .A(n198), .Y(n503) );
  INVX2 U516 ( .A(n195), .Y(n504) );
  INVX2 U517 ( .A(n233), .Y(n506) );
  INVX2 U518 ( .A(n356), .Y(n507) );
  INVX2 U519 ( .A(n269), .Y(n508) );
  INVX2 U520 ( .A(n392), .Y(n509) );
  INVX2 U521 ( .A(n387), .Y(n510) );
  INVX2 U522 ( .A(multiplication_select[1]), .Y(n511) );
  INVX2 U523 ( .A(multiplication_select[0]), .Y(n512) );
  INVX2 U524 ( .A(spin_reg[3]), .Y(n513) );
  INVX2 U525 ( .A(spin_reg[2]), .Y(n514) );
  INVX2 U526 ( .A(spin_reg[1]), .Y(n515) );
  INVX2 U527 ( .A(spin_reg[0]), .Y(n516) );
  INVX2 U528 ( .A(n334), .Y(n517) );
  INVX2 U529 ( .A(n312), .Y(n518) );
  INVX2 U530 ( .A(h_reg[3]), .Y(n519) );
  INVX2 U531 ( .A(n324), .Y(n520) );
  INVX2 U532 ( .A(h_reg[2]), .Y(n521) );
  INVX2 U533 ( .A(h_reg[1]), .Y(n522) );
  INVX2 U534 ( .A(h_reg[0]), .Y(n523) );
  INVX2 U535 ( .A(mult_cycle[0]), .Y(n524) );
  INVX2 U536 ( .A(mult_cycle[2]), .Y(n525) );
  INVX2 U537 ( .A(mult_cycle[1]), .Y(n526) );
  INVX2 U538 ( .A(trig_h[3]), .Y(n527) );
  INVX2 U539 ( .A(trig_h[2]), .Y(n528) );
  INVX2 U540 ( .A(trig_h[1]), .Y(n529) );
  INVX2 U541 ( .A(trig_h[0]), .Y(n530) );
  INVX2 U542 ( .A(n292), .Y(n531) );
  INVX2 U543 ( .A(n286), .Y(n532) );
  INVX2 U544 ( .A(v_reg[3]), .Y(n533) );
  INVX2 U545 ( .A(n285), .Y(n534) );
  INVX2 U546 ( .A(v_reg[2]), .Y(n535) );
  INVX2 U547 ( .A(v_reg[1]), .Y(n536) );
  INVX2 U548 ( .A(v_reg[0]), .Y(n537) );
  INVX2 U549 ( .A(trig_v[1]), .Y(n538) );
  INVX2 U550 ( .A(trig_v[0]), .Y(n539) );
  INVX2 U551 ( .A(trig_v[3]), .Y(n540) );
  INVX2 U552 ( .A(trig_v[2]), .Y(n541) );
  INVX2 U553 ( .A(power_reg[3]), .Y(n542) );
  INVX2 U554 ( .A(power_reg[2]), .Y(n543) );
  INVX2 U555 ( .A(power_reg[1]), .Y(n544) );
  INVX2 U556 ( .A(power_reg[0]), .Y(n545) );
  INVX2 U557 ( .A(n140), .Y(n546) );
  INVX2 U558 ( .A(n141), .Y(n547) );
  INVX2 U559 ( .A(n142), .Y(n548) );
  INVX2 U560 ( .A(n143), .Y(n549) );
  INVX2 U561 ( .A(n144), .Y(n550) );
  INVX2 U562 ( .A(n145), .Y(n551) );
  INVX2 U563 ( .A(n146), .Y(n552) );
  INVX2 U564 ( .A(n147), .Y(n553) );
  INVX2 U565 ( .A(n162), .Y(n554) );
  INVX2 U566 ( .A(keeper_x[3]), .Y(n555) );
  INVX2 U567 ( .A(keeper_x[2]), .Y(n556) );
  INVX2 U568 ( .A(n180), .Y(n557) );
  INVX2 U569 ( .A(keeper_x[1]), .Y(n558) );
  INVX2 U570 ( .A(n181), .Y(n559) );
  INVX2 U571 ( .A(keeper_x[0]), .Y(n560) );
  INVX2 U572 ( .A(n169), .Y(n561) );
  INVX2 U573 ( .A(n157), .Y(n562) );
  INVX2 U574 ( .A(keeper_y[3]), .Y(n563) );
  INVX2 U575 ( .A(keeper_y[2]), .Y(n564) );
  INVX2 U576 ( .A(n187), .Y(n565) );
  INVX2 U577 ( .A(keeper_y[1]), .Y(n566) );
  INVX2 U578 ( .A(n188), .Y(n567) );
  INVX2 U579 ( .A(keeper_y[0]), .Y(n568) );
  INVX2 U580 ( .A(mult_product_debug[0]), .Y(n569) );
  INVX2 U581 ( .A(v_sq_reg[0]), .Y(n570) );
  INVX2 U582 ( .A(mult_product_debug[1]), .Y(n571) );
  INVX2 U583 ( .A(v_sq_reg[1]), .Y(n572) );
  INVX2 U584 ( .A(mult_product_debug[2]), .Y(n573) );
  INVX2 U585 ( .A(v_sq_reg[2]), .Y(n574) );
  INVX2 U586 ( .A(mult_product_debug[3]), .Y(n575) );
  INVX2 U587 ( .A(v_sq_reg[3]), .Y(n576) );
  INVX2 U588 ( .A(mult_product_debug[4]), .Y(n577) );
  INVX2 U589 ( .A(mult_product_debug[5]), .Y(n578) );
  INVX2 U590 ( .A(mult_product_debug[6]), .Y(n579) );
  INVX2 U591 ( .A(mult_product_debug[7]), .Y(n580) );
  INVX2 U592 ( .A(lateral_debug[0]), .Y(n581) );
  INVX2 U593 ( .A(lateral_debug[1]), .Y(n582) );
  INVX2 U594 ( .A(lateral_debug[2]), .Y(n583) );
  INVX2 U595 ( .A(lateral_debug[3]), .Y(n584) );
  INVX2 U596 ( .A(range_debug[3]), .Y(n585) );
  INVX2 U597 ( .A(range_debug[0]), .Y(n586) );
  INVX2 U598 ( .A(range_debug[1]), .Y(n587) );
  INVX2 U599 ( .A(range_debug[2]), .Y(n588) );
  INVX2 U600 ( .A(goal_flag), .Y(n589) );
endmodule

