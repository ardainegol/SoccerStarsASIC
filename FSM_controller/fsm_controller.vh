/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Mon May  4 18:29:37 2026
/////////////////////////////////////////////////////////////


module fsm_controller ( clka, clkb, restart, enable, strike_power_ctrl, 
        spin_ctrl, v_angle_ctrl, h_angle_ctrl, strike_store_enable, 
        spin_store_enable, v_angle_store_enable, h_angle_store_enable, 
        access_trig_enable, multiplication_select, sample_keeper_enable, 
        range_enable, lateral_enable, collision_check_enable, display_enable, 
        state_debug );
  output [1:0] multiplication_select;
  output [3:0] state_debug;
  input clka, clkb, restart, enable, strike_power_ctrl, spin_ctrl,
         v_angle_ctrl, h_angle_ctrl;
  output strike_store_enable, spin_store_enable, v_angle_store_enable,
         h_angle_store_enable, access_trig_enable, sample_keeper_enable,
         range_enable, lateral_enable, collision_check_enable, display_enable;
  wire   N134, N137, N228, N229, N230, N231, N232, N233, N234, N235, N236,
         N237, N238, N239, N240, N242, N243, n1, n2, n3, n4, n5, n6, n7, n8,
         n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150;
  wire   [2:0] calc_v_sq_counter;
  wire   [2:0] calc_range_counter;
  wire   [2:0] calc_lateral_counter;
  wire   [3:0] current_state;
  wire   [3:0] next_state;

  DFFNEGX1 \current_state_reg[0]  ( .D(N228), .CLK(n149), .Q(current_state[0])
         );
  DFFNEGX1 \next_state_reg[1]  ( .D(n2), .CLK(clka), .Q(next_state[1]) );
  DFFNEGX1 \current_state_reg[1]  ( .D(N229), .CLK(n149), .Q(current_state[1])
         );
  DFFNEGX1 \calc_range_counter_reg[1]  ( .D(n147), .CLK(clka), .Q(
        calc_range_counter[1]) );
  DFFNEGX1 \calc_range_counter_reg[2]  ( .D(n145), .CLK(clka), .Q(
        calc_range_counter[2]) );
  DFFNEGX1 \calc_range_counter_reg[0]  ( .D(n146), .CLK(clka), .Q(
        calc_range_counter[0]) );
  DFFNEGX1 \next_state_reg[2]  ( .D(n18), .CLK(clka), .Q(next_state[2]) );
  DFFNEGX1 \current_state_reg[2]  ( .D(N230), .CLK(n149), .Q(current_state[2])
         );
  DFFNEGX1 \next_state_reg[3]  ( .D(N137), .CLK(clka), .Q(next_state[3]) );
  DFFNEGX1 \current_state_reg[3]  ( .D(N231), .CLK(n149), .Q(current_state[3])
         );
  DFFNEGX1 \calc_lateral_counter_reg[1]  ( .D(n144), .CLK(clka), .Q(
        calc_lateral_counter[1]) );
  DFFNEGX1 \calc_lateral_counter_reg[2]  ( .D(n142), .CLK(clka), .Q(
        calc_lateral_counter[2]) );
  DFFNEGX1 \calc_lateral_counter_reg[0]  ( .D(n143), .CLK(clka), .Q(
        calc_lateral_counter[0]) );
  DFFNEGX1 \calc_v_sq_counter_reg[1]  ( .D(n141), .CLK(clka), .Q(
        calc_v_sq_counter[1]) );
  DFFNEGX1 \calc_v_sq_counter_reg[2]  ( .D(n139), .CLK(clka), .Q(
        calc_v_sq_counter[2]) );
  DFFNEGX1 \calc_v_sq_counter_reg[0]  ( .D(n140), .CLK(clka), .Q(
        calc_v_sq_counter[0]) );
  DFFNEGX1 \next_state_reg[0]  ( .D(N134), .CLK(clka), .Q(next_state[0]) );
  DFFNEGX1 \multiplication_select_reg[1]  ( .D(N238), .CLK(n149), .Q(
        multiplication_select[1]) );
  DFFNEGX1 \multiplication_select_reg[0]  ( .D(N237), .CLK(n149), .Q(
        multiplication_select[0]) );
  DFFNEGX1 sample_keeper_enable_reg ( .D(N239), .CLK(n149), .Q(
        sample_keeper_enable) );
  DFFNEGX1 collision_check_enable_reg ( .D(N242), .CLK(n149), .Q(
        collision_check_enable) );
  DFFNEGX1 lateral_enable_reg ( .D(n12), .CLK(n149), .Q(lateral_enable) );
  DFFNEGX1 range_enable_reg ( .D(N240), .CLK(n149), .Q(range_enable) );
  DFFNEGX1 display_enable_reg ( .D(N243), .CLK(n149), .Q(display_enable) );
  DFFNEGX1 \state_debug_reg[3]  ( .D(N231), .CLK(n149), .Q(state_debug[3]) );
  DFFNEGX1 \state_debug_reg[2]  ( .D(N230), .CLK(n149), .Q(state_debug[2]) );
  DFFNEGX1 \state_debug_reg[1]  ( .D(N229), .CLK(n149), .Q(state_debug[1]) );
  DFFNEGX1 \state_debug_reg[0]  ( .D(N228), .CLK(n149), .Q(state_debug[0]) );
  DFFNEGX1 strike_store_enable_reg ( .D(N232), .CLK(n149), .Q(
        strike_store_enable) );
  DFFNEGX1 spin_store_enable_reg ( .D(N233), .CLK(n149), .Q(spin_store_enable)
         );
  DFFNEGX1 v_angle_store_enable_reg ( .D(N234), .CLK(n149), .Q(
        v_angle_store_enable) );
  DFFNEGX1 h_angle_store_enable_reg ( .D(N235), .CLK(n149), .Q(
        h_angle_store_enable) );
  DFFNEGX1 access_trig_enable_reg ( .D(N236), .CLK(n149), .Q(
        access_trig_enable) );
  AND2X2 U3 ( .A(n82), .B(n76), .Y(n130) );
  AND2X2 U4 ( .A(n87), .B(n86), .Y(n136) );
  AND2X2 U5 ( .A(current_state[3]), .B(n32), .Y(n127) );
  AND2X2 U6 ( .A(current_state[1]), .B(n31), .Y(n120) );
  INVX2 U7 ( .A(calc_lateral_counter[2]), .Y(n1) );
  INVX2 U8 ( .A(n121), .Y(n2) );
  INVX2 U9 ( .A(n52), .Y(n3) );
  INVX2 U10 ( .A(calc_lateral_counter[1]), .Y(n4) );
  INVX2 U11 ( .A(n53), .Y(n5) );
  INVX2 U12 ( .A(calc_lateral_counter[0]), .Y(n6) );
  INVX2 U13 ( .A(calc_v_sq_counter[2]), .Y(n7) );
  INVX2 U14 ( .A(n40), .Y(n8) );
  INVX2 U15 ( .A(calc_v_sq_counter[1]), .Y(n9) );
  INVX2 U16 ( .A(n41), .Y(n10) );
  INVX2 U17 ( .A(calc_v_sq_counter[0]), .Y(n11) );
  INVX2 U18 ( .A(n94), .Y(n12) );
  INVX2 U19 ( .A(next_state[3]), .Y(n13) );
  INVX2 U20 ( .A(next_state[2]), .Y(n14) );
  INVX2 U21 ( .A(next_state[1]), .Y(n15) );
  INVX2 U22 ( .A(next_state[0]), .Y(n16) );
  INVX2 U23 ( .A(calc_range_counter[2]), .Y(n17) );
  INVX2 U24 ( .A(n116), .Y(n18) );
  INVX2 U25 ( .A(n66), .Y(n19) );
  INVX2 U26 ( .A(n62), .Y(n20) );
  INVX2 U27 ( .A(calc_range_counter[1]), .Y(n21) );
  INVX2 U28 ( .A(n63), .Y(n22) );
  INVX2 U29 ( .A(calc_range_counter[0]), .Y(n23) );
  INVX2 U30 ( .A(n47), .Y(n24) );
  INVX2 U31 ( .A(n73), .Y(n25) );
  INVX2 U32 ( .A(n83), .Y(n26) );
  INVX2 U33 ( .A(n114), .Y(n27) );
  INVX2 U34 ( .A(n81), .Y(n28) );
  INVX2 U35 ( .A(n85), .Y(n29) );
  INVX2 U36 ( .A(n84), .Y(n30) );
  INVX2 U37 ( .A(current_state[2]), .Y(n31) );
  INVX2 U38 ( .A(current_state[0]), .Y(n32) );
  INVX2 U40 ( .A(spin_ctrl), .Y(n34) );
  INVX2 U41 ( .A(v_angle_ctrl), .Y(n35) );
  INVX2 U42 ( .A(h_angle_ctrl), .Y(n36) );
  OAI21X1 U43 ( .A(n37), .B(n7), .C(n38), .Y(n139) );
  NAND3X1 U44 ( .A(calc_v_sq_counter[1]), .B(calc_v_sq_counter[0]), .C(n39), 
        .Y(n38) );
  NOR2X1 U45 ( .A(calc_v_sq_counter[2]), .B(n40), .Y(n39) );
  AOI21X1 U46 ( .A(n9), .B(n150), .C(n41), .Y(n37) );
  OAI22X1 U47 ( .A(n11), .B(n42), .C(calc_v_sq_counter[0]), .D(n40), .Y(n140)
         );
  OAI21X1 U48 ( .A(n10), .B(n9), .C(n43), .Y(n141) );
  NAND3X1 U49 ( .A(n8), .B(n9), .C(calc_v_sq_counter[0]), .Y(n43) );
  NAND3X1 U50 ( .A(n44), .B(n150), .C(n42), .Y(n40) );
  OAI21X1 U51 ( .A(restart), .B(calc_v_sq_counter[0]), .C(n42), .Y(n41) );
  OAI21X1 U52 ( .A(n45), .B(n46), .C(n150), .Y(n42) );
  NAND2X1 U53 ( .A(n47), .B(n48), .Y(n46) );
  OAI21X1 U54 ( .A(n49), .B(n1), .C(n50), .Y(n142) );
  NAND3X1 U55 ( .A(calc_lateral_counter[1]), .B(calc_lateral_counter[0]), .C(
        n51), .Y(n50) );
  NOR2X1 U56 ( .A(calc_lateral_counter[2]), .B(n52), .Y(n51) );
  AOI21X1 U57 ( .A(n4), .B(n150), .C(n53), .Y(n49) );
  OAI22X1 U58 ( .A(n6), .B(n54), .C(calc_lateral_counter[0]), .D(n52), .Y(n143) );
  OAI21X1 U59 ( .A(n5), .B(n4), .C(n55), .Y(n144) );
  NAND3X1 U60 ( .A(n3), .B(n4), .C(calc_lateral_counter[0]), .Y(n55) );
  NAND3X1 U61 ( .A(n56), .B(n150), .C(n54), .Y(n52) );
  OAI21X1 U62 ( .A(restart), .B(calc_lateral_counter[0]), .C(n54), .Y(n53) );
  OAI21X1 U63 ( .A(n45), .B(n57), .C(n150), .Y(n54) );
  NAND2X1 U64 ( .A(n58), .B(n48), .Y(n57) );
  OAI21X1 U65 ( .A(n59), .B(n17), .C(n60), .Y(n145) );
  NAND3X1 U66 ( .A(calc_range_counter[1]), .B(calc_range_counter[0]), .C(n61), 
        .Y(n60) );
  NOR2X1 U67 ( .A(calc_range_counter[2]), .B(n62), .Y(n61) );
  AOI21X1 U68 ( .A(n21), .B(n150), .C(n63), .Y(n59) );
  OAI22X1 U69 ( .A(n23), .B(n64), .C(calc_range_counter[0]), .D(n62), .Y(n146)
         );
  OAI21X1 U70 ( .A(n22), .B(n21), .C(n65), .Y(n147) );
  NAND3X1 U71 ( .A(n20), .B(n21), .C(calc_range_counter[0]), .Y(n65) );
  NAND3X1 U72 ( .A(n66), .B(n150), .C(n64), .Y(n62) );
  OAI21X1 U73 ( .A(restart), .B(calc_range_counter[0]), .C(n64), .Y(n63) );
  OAI21X1 U74 ( .A(n45), .B(n67), .C(n150), .Y(n64) );
  NAND2X1 U75 ( .A(n58), .B(n47), .Y(n67) );
  NAND3X1 U76 ( .A(n68), .B(n69), .C(n70), .Y(n45) );
  NOR2X1 U77 ( .A(n71), .B(n72), .Y(n70) );
  NAND3X1 U78 ( .A(n73), .B(n74), .C(n75), .Y(n72) );
  NAND3X1 U79 ( .A(n76), .B(n77), .C(n78), .Y(n71) );
  NOR2X1 U80 ( .A(n79), .B(n80), .Y(n69) );
  NAND2X1 U81 ( .A(n81), .B(n82), .Y(n80) );
  OAI21X1 U82 ( .A(n83), .B(n84), .C(n85), .Y(n79) );
  AOI21X1 U83 ( .A(n86), .B(n87), .C(n88), .Y(n68) );
  NAND2X1 U84 ( .A(n89), .B(n90), .Y(n88) );
  NOR2X1 U85 ( .A(n14), .B(n91), .Y(N243) );
  NAND2X1 U86 ( .A(N231), .B(n92), .Y(n91) );
  NOR2X1 U87 ( .A(n92), .B(n93), .Y(N242) );
  NAND2X1 U88 ( .A(N231), .B(n14), .Y(n93) );
  OAI21X1 U89 ( .A(next_state[1]), .B(n95), .C(n96), .Y(N240) );
  NOR2X1 U90 ( .A(n15), .B(n95), .Y(N239) );
  NAND3X1 U91 ( .A(n16), .B(n14), .C(N231), .Y(n95) );
  NAND2X1 U92 ( .A(n94), .B(n96), .Y(N238) );
  OR2X1 U93 ( .A(n97), .B(n92), .Y(n96) );
  NAND2X1 U94 ( .A(next_state[1]), .B(next_state[0]), .Y(n92) );
  OAI21X1 U95 ( .A(n97), .B(n98), .C(n94), .Y(N237) );
  NAND3X1 U96 ( .A(n99), .B(n15), .C(n100), .Y(n94) );
  NOR2X1 U97 ( .A(n13), .B(n16), .Y(n100) );
  NOR2X1 U98 ( .A(restart), .B(next_state[2]), .Y(n99) );
  NAND2X1 U99 ( .A(next_state[1]), .B(n16), .Y(n98) );
  NOR2X1 U100 ( .A(n97), .B(n101), .Y(N236) );
  NAND2X1 U101 ( .A(next_state[0]), .B(n15), .Y(n101) );
  NOR2X1 U102 ( .A(n102), .B(n103), .Y(N235) );
  OR2X1 U103 ( .A(n36), .B(n97), .Y(n103) );
  NAND2X1 U104 ( .A(N230), .B(n13), .Y(n97) );
  NAND2X1 U105 ( .A(n16), .B(n15), .Y(n102) );
  NOR2X1 U106 ( .A(n104), .B(n105), .Y(N234) );
  NAND2X1 U107 ( .A(v_angle_ctrl), .B(N229), .Y(n105) );
  NAND2X1 U108 ( .A(n106), .B(next_state[0]), .Y(n104) );
  NOR2X1 U109 ( .A(n107), .B(n108), .Y(N233) );
  NAND2X1 U110 ( .A(spin_ctrl), .B(N229), .Y(n108) );
  NAND2X1 U111 ( .A(n106), .B(n16), .Y(n107) );
  NOR2X1 U112 ( .A(n109), .B(n110), .Y(N232) );
  NAND2X1 U113 ( .A(strike_power_ctrl), .B(N228), .Y(n110) );
  NAND2X1 U114 ( .A(n106), .B(n15), .Y(n109) );
  NOR2X1 U115 ( .A(next_state[2]), .B(next_state[3]), .Y(n106) );
  NOR2X1 U116 ( .A(n13), .B(restart), .Y(N231) );
  NOR2X1 U117 ( .A(n14), .B(restart), .Y(N230) );
  NOR2X1 U118 ( .A(n15), .B(restart), .Y(N229) );
  NOR2X1 U119 ( .A(n16), .B(restart), .Y(N228) );
  AOI21X1 U120 ( .A(n111), .B(n112), .C(restart), .Y(N137) );
  NOR2X1 U121 ( .A(n25), .B(n113), .Y(n112) );
  NAND2X1 U122 ( .A(n78), .B(n47), .Y(n113) );
  NOR2X1 U123 ( .A(n114), .B(n115), .Y(n111) );
  OAI21X1 U124 ( .A(n66), .B(n48), .C(n75), .Y(n115) );
  OAI21X1 U125 ( .A(n117), .B(n118), .C(n150), .Y(n116) );
  OAI21X1 U126 ( .A(n35), .B(n81), .C(n119), .Y(n118) );
  NAND3X1 U127 ( .A(n78), .B(n90), .C(n74), .Y(n117) );
  NAND2X1 U128 ( .A(n120), .B(n26), .Y(n78) );
  OAI21X1 U129 ( .A(n122), .B(n123), .C(n150), .Y(n121) );
  NAND2X1 U130 ( .A(n124), .B(n119), .Y(n123) );
  NOR2X1 U131 ( .A(n125), .B(n126), .Y(n119) );
  OAI21X1 U132 ( .A(n19), .B(n48), .C(n58), .Y(n126) );
  NAND3X1 U133 ( .A(n73), .B(n89), .C(n75), .Y(n125) );
  NAND2X1 U134 ( .A(n127), .B(n30), .Y(n75) );
  NAND2X1 U135 ( .A(n128), .B(n129), .Y(n89) );
  NAND2X1 U136 ( .A(n128), .B(n26), .Y(n73) );
  AOI22X1 U137 ( .A(n28), .B(n35), .C(n29), .D(strike_power_ctrl), .Y(n124) );
  OAI21X1 U138 ( .A(n56), .B(n47), .C(n130), .Y(n122) );
  AOI21X1 U139 ( .A(n131), .B(n132), .C(restart), .Y(N134) );
  NOR2X1 U140 ( .A(n133), .B(n134), .Y(n132) );
  OAI22X1 U141 ( .A(n36), .B(n90), .C(n58), .D(n44), .Y(n134) );
  NAND3X1 U142 ( .A(n11), .B(n9), .C(calc_v_sq_counter[2]), .Y(n44) );
  NAND2X1 U143 ( .A(n86), .B(n30), .Y(n58) );
  NAND2X1 U144 ( .A(n128), .B(n86), .Y(n90) );
  OAI21X1 U145 ( .A(n19), .B(n48), .C(n135), .Y(n133) );
  AOI22X1 U146 ( .A(n136), .B(enable), .C(n24), .D(n56), .Y(n135) );
  NAND3X1 U147 ( .A(n6), .B(n4), .C(calc_lateral_counter[2]), .Y(n56) );
  NAND2X1 U148 ( .A(n87), .B(n26), .Y(n47) );
  NAND2X1 U149 ( .A(current_state[3]), .B(current_state[0]), .Y(n83) );
  NAND2X1 U150 ( .A(n129), .B(n30), .Y(n48) );
  NAND2X1 U151 ( .A(current_state[2]), .B(current_state[1]), .Y(n84) );
  NAND3X1 U152 ( .A(n23), .B(n21), .C(calc_range_counter[2]), .Y(n66) );
  NOR2X1 U153 ( .A(n137), .B(n138), .Y(n131) );
  OAI21X1 U154 ( .A(strike_power_ctrl), .B(n85), .C(n27), .Y(n138) );
  NAND3X1 U155 ( .A(n76), .B(n77), .C(n74), .Y(n114) );
  NAND2X1 U156 ( .A(n127), .B(n128), .Y(n74) );
  NOR2X1 U157 ( .A(n31), .B(current_state[1]), .Y(n128) );
  NAND2X1 U158 ( .A(n127), .B(n87), .Y(n77) );
  NAND2X1 U159 ( .A(n127), .B(n120), .Y(n76) );
  NAND2X1 U160 ( .A(n129), .B(n87), .Y(n85) );
  NOR2X1 U161 ( .A(current_state[2]), .B(current_state[1]), .Y(n87) );
  OAI22X1 U162 ( .A(n34), .B(n82), .C(v_angle_ctrl), .D(n81), .Y(n137) );
  NAND2X1 U163 ( .A(n120), .B(n129), .Y(n81) );
  NOR2X1 U164 ( .A(n32), .B(current_state[3]), .Y(n129) );
  NAND2X1 U165 ( .A(n120), .B(n86), .Y(n82) );
  NOR2X1 U166 ( .A(current_state[3]), .B(current_state[0]), .Y(n86) );
  INVX1 U167 ( .A(clkb), .Y(n148) );
  INVX4 U168 ( .A(n148), .Y(n149) );
  INVX2 U169 ( .A(restart), .Y(n150) );
endmodule

