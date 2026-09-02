/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : U-2022.12-SP7
// Date      : Wed Apr 15 17:25:01 2026
/////////////////////////////////////////////////////////////


module soccer_stars_top ( clka, clkb, restart, enable, strike_power_ctrl, 
        spin_ctrl, v_angle_ctrl, h_angle_ctrl, ball_x, ball_y, keeper_x, 
        keeper_y, win_loss, valid, state_debug, mult_product_debug, 
        range_debug, lateral_debug );
  output [3:0] ball_x;
  output [3:0] ball_y;
  output [3:0] keeper_x;
  output [3:0] keeper_y;
  output [3:0] state_debug;
  output [7:0] mult_product_debug;
  output [7:0] range_debug;
  output [7:0] lateral_debug;
  input clka, clkb, restart, enable, strike_power_ctrl, spin_ctrl,
         v_angle_ctrl, h_angle_ctrl;
  output win_loss, valid;
  wire   N21, N22, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35,
         N36, w_strike_store_enable, w_spin_store_enable,
         w_v_angle_store_enable, w_h_angle_store_enable, w_access_trig_enable,
         w_sample_keeper_enable, w_range_enable, w_collision_check_enable,
         w_display_enable, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31,
         n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         \u_fsm/n147 , \u_fsm/n146 , \u_fsm/n145 , \u_fsm/n144 , \u_fsm/n143 ,
         \u_fsm/n142 , \u_fsm/n141 , \u_fsm/n140 , \u_fsm/n139 , \u_fsm/n138 ,
         \u_fsm/n137 , \u_fsm/n136 , \u_fsm/n135 , \u_fsm/n134 , \u_fsm/n133 ,
         \u_fsm/n132 , \u_fsm/n131 , \u_fsm/n130 , \u_fsm/n129 , \u_fsm/n128 ,
         \u_fsm/n127 , \u_fsm/n126 , \u_fsm/n125 , \u_fsm/n124 , \u_fsm/n123 ,
         \u_fsm/n122 , \u_fsm/n121 , \u_fsm/n120 , \u_fsm/n119 , \u_fsm/n118 ,
         \u_fsm/n117 , \u_fsm/n116 , \u_fsm/n115 , \u_fsm/n114 , \u_fsm/n113 ,
         \u_fsm/n112 , \u_fsm/n111 , \u_fsm/n110 , \u_fsm/n109 , \u_fsm/n108 ,
         \u_fsm/n107 , \u_fsm/n106 , \u_fsm/n105 , \u_fsm/n104 , \u_fsm/n103 ,
         \u_fsm/n102 , \u_fsm/n101 , \u_fsm/n100 , \u_fsm/n99 , \u_fsm/n98 ,
         \u_fsm/n97 , \u_fsm/n96 , \u_fsm/n95 , \u_fsm/n94 , \u_fsm/n93 ,
         \u_fsm/n92 , \u_fsm/n91 , \u_fsm/n90 , \u_fsm/n89 , \u_fsm/n88 ,
         \u_fsm/n87 , \u_fsm/n86 , \u_fsm/n85 , \u_fsm/n84 , \u_fsm/n83 ,
         \u_fsm/n82 , \u_fsm/n81 , \u_fsm/n80 , \u_fsm/n79 , \u_fsm/n78 ,
         \u_fsm/n77 , \u_fsm/n76 , \u_fsm/n75 , \u_fsm/n74 , \u_fsm/n73 ,
         \u_fsm/n72 , \u_fsm/n71 , \u_fsm/n70 , \u_fsm/n69 , \u_fsm/n68 ,
         \u_fsm/n67 , \u_fsm/n66 , \u_fsm/n65 , \u_fsm/n64 , \u_fsm/n63 ,
         \u_fsm/n62 , \u_fsm/n61 , \u_fsm/n60 , \u_fsm/n59 , \u_fsm/n58 ,
         \u_fsm/n57 , \u_fsm/n56 , \u_fsm/n55 , \u_fsm/n54 , \u_fsm/n53 ,
         \u_fsm/n52 , \u_fsm/n51 , \u_fsm/n50 , \u_fsm/n49 , \u_fsm/n48 ,
         \u_fsm/n47 , \u_fsm/n46 , \u_fsm/n45 , \u_fsm/n44 , \u_fsm/n43 ,
         \u_fsm/n42 , \u_fsm/n41 , \u_fsm/n40 , \u_fsm/n39 , \u_fsm/n38 ,
         \u_fsm/n37 , \u_fsm/N243 , \u_fsm/N242 , \u_fsm/N240 , \u_fsm/N239 ,
         \u_fsm/N238 , \u_fsm/N237 , \u_fsm/N236 , \u_fsm/N235 , \u_fsm/N234 ,
         \u_fsm/N233 , \u_fsm/N232 , \u_fsm/N231 , \u_fsm/N230 , \u_fsm/N229 ,
         \u_fsm/N228 , \u_fsm/N137 , \u_fsm/N134 , \u_datapath/n458 ,
         \u_datapath/n457 , \u_datapath/n456 , \u_datapath/n455 ,
         \u_datapath/n454 , \u_datapath/n453 , \u_datapath/n452 ,
         \u_datapath/n451 , \u_datapath/n450 , \u_datapath/n449 ,
         \u_datapath/n448 , \u_datapath/n447 , \u_datapath/n446 ,
         \u_datapath/n445 , \u_datapath/n444 , \u_datapath/n443 ,
         \u_datapath/n442 , \u_datapath/n441 , \u_datapath/n440 ,
         \u_datapath/n439 , \u_datapath/n438 , \u_datapath/n437 ,
         \u_datapath/n436 , \u_datapath/n435 , \u_datapath/n434 ,
         \u_datapath/n433 , \u_datapath/n432 , \u_datapath/n431 ,
         \u_datapath/n430 , \u_datapath/n429 , \u_datapath/n428 ,
         \u_datapath/n427 , \u_datapath/n426 , \u_datapath/n425 ,
         \u_datapath/n424 , \u_datapath/n423 , \u_datapath/n422 ,
         \u_datapath/n421 , \u_datapath/n420 , \u_datapath/n419 ,
         \u_datapath/n418 , \u_datapath/n417 , \u_datapath/n416 ,
         \u_datapath/n415 , \u_datapath/n414 , \u_datapath/n413 ,
         \u_datapath/n412 , \u_datapath/n411 , \u_datapath/n410 ,
         \u_datapath/n409 , \u_datapath/n408 , \u_datapath/n407 ,
         \u_datapath/n406 , \u_datapath/n405 , \u_datapath/n404 ,
         \u_datapath/n403 , \u_datapath/n402 , \u_datapath/n401 ,
         \u_datapath/n400 , \u_datapath/n399 , \u_datapath/n398 ,
         \u_datapath/n397 , \u_datapath/n396 , \u_datapath/n395 ,
         \u_datapath/n394 , \u_datapath/n393 , \u_datapath/n392 ,
         \u_datapath/n391 , \u_datapath/n390 , \u_datapath/n389 ,
         \u_datapath/n388 , \u_datapath/n387 , \u_datapath/n386 ,
         \u_datapath/n385 , \u_datapath/n384 , \u_datapath/n383 ,
         \u_datapath/n382 , \u_datapath/n381 , \u_datapath/n380 ,
         \u_datapath/n379 , \u_datapath/n378 , \u_datapath/n377 ,
         \u_datapath/n376 , \u_datapath/n375 , \u_datapath/n374 ,
         \u_datapath/n373 , \u_datapath/n372 , \u_datapath/n371 ,
         \u_datapath/n370 , \u_datapath/n369 , \u_datapath/n368 ,
         \u_datapath/n367 , \u_datapath/n366 , \u_datapath/n365 ,
         \u_datapath/n364 , \u_datapath/n363 , \u_datapath/n362 ,
         \u_datapath/n361 , \u_datapath/n360 , \u_datapath/n359 ,
         \u_datapath/n358 , \u_datapath/n357 , \u_datapath/n356 ,
         \u_datapath/n355 , \u_datapath/n354 , \u_datapath/n353 ,
         \u_datapath/n352 , \u_datapath/n351 , \u_datapath/n350 ,
         \u_datapath/n349 , \u_datapath/n348 , \u_datapath/n347 ,
         \u_datapath/n346 , \u_datapath/n345 , \u_datapath/n344 ,
         \u_datapath/n343 , \u_datapath/n342 , \u_datapath/n341 ,
         \u_datapath/n340 , \u_datapath/n339 , \u_datapath/n338 ,
         \u_datapath/n337 , \u_datapath/n336 , \u_datapath/n335 ,
         \u_datapath/n334 , \u_datapath/n333 , \u_datapath/n332 ,
         \u_datapath/n331 , \u_datapath/n330 , \u_datapath/n329 ,
         \u_datapath/n328 , \u_datapath/n327 , \u_datapath/n326 ,
         \u_datapath/n325 , \u_datapath/n324 , \u_datapath/n323 ,
         \u_datapath/n322 , \u_datapath/n321 , \u_datapath/n320 ,
         \u_datapath/n319 , \u_datapath/n318 , \u_datapath/n317 ,
         \u_datapath/n316 , \u_datapath/n315 , \u_datapath/n314 ,
         \u_datapath/n313 , \u_datapath/n312 , \u_datapath/n311 ,
         \u_datapath/n310 , \u_datapath/n309 , \u_datapath/n308 ,
         \u_datapath/n307 , \u_datapath/n306 , \u_datapath/n305 ,
         \u_datapath/n304 , \u_datapath/n303 , \u_datapath/n302 ,
         \u_datapath/n301 , \u_datapath/n300 , \u_datapath/n299 ,
         \u_datapath/n298 , \u_datapath/n297 , \u_datapath/n296 ,
         \u_datapath/n295 , \u_datapath/n294 , \u_datapath/n293 ,
         \u_datapath/n292 , \u_datapath/n291 , \u_datapath/n290 ,
         \u_datapath/n289 , \u_datapath/n288 , \u_datapath/n287 ,
         \u_datapath/n286 , \u_datapath/n285 , \u_datapath/n284 ,
         \u_datapath/n283 , \u_datapath/n282 , \u_datapath/n281 ,
         \u_datapath/n280 , \u_datapath/n279 , \u_datapath/n278 ,
         \u_datapath/n277 , \u_datapath/n276 , \u_datapath/n275 ,
         \u_datapath/n274 , \u_datapath/n273 , \u_datapath/n272 ,
         \u_datapath/n271 , \u_datapath/n270 , \u_datapath/n269 ,
         \u_datapath/n268 , \u_datapath/n267 , \u_datapath/n266 ,
         \u_datapath/n265 , \u_datapath/n264 , \u_datapath/n263 ,
         \u_datapath/n262 , \u_datapath/n261 , \u_datapath/n260 ,
         \u_datapath/n259 , \u_datapath/n258 , \u_datapath/n257 ,
         \u_datapath/n256 , \u_datapath/n255 , \u_datapath/n254 ,
         \u_datapath/n253 , \u_datapath/n252 , \u_datapath/n251 ,
         \u_datapath/n250 , \u_datapath/n249 , \u_datapath/n248 ,
         \u_datapath/n247 , \u_datapath/n246 , \u_datapath/n245 ,
         \u_datapath/n244 , \u_datapath/n243 , \u_datapath/n242 ,
         \u_datapath/n241 , \u_datapath/n240 , \u_datapath/n239 ,
         \u_datapath/n238 , \u_datapath/n237 , \u_datapath/n236 ,
         \u_datapath/n235 , \u_datapath/n234 , \u_datapath/n233 ,
         \u_datapath/n232 , \u_datapath/n231 , \u_datapath/n230 ,
         \u_datapath/n229 , \u_datapath/n228 , \u_datapath/n227 ,
         \u_datapath/n226 , \u_datapath/n225 , \u_datapath/n224 ,
         \u_datapath/n223 , \u_datapath/n222 , \u_datapath/n221 ,
         \u_datapath/n220 , \u_datapath/n219 , \u_datapath/n218 ,
         \u_datapath/n217 , \u_datapath/n216 , \u_datapath/n215 ,
         \u_datapath/n214 , \u_datapath/n213 , \u_datapath/n212 ,
         \u_datapath/n211 , \u_datapath/n210 , \u_datapath/n209 ,
         \u_datapath/n208 , \u_datapath/n207 , \u_datapath/n206 ,
         \u_datapath/n205 , \u_datapath/n204 , \u_datapath/n203 ,
         \u_datapath/n202 , \u_datapath/n201 , \u_datapath/n200 ,
         \u_datapath/n199 , \u_datapath/n198 , \u_datapath/n196 ,
         \u_datapath/n195 , \u_datapath/n194 , \u_datapath/n193 ,
         \u_datapath/n192 , \u_datapath/n191 , \u_datapath/n190 ,
         \u_datapath/n189 , \u_datapath/n188 , \u_datapath/n187 ,
         \u_datapath/n186 , \u_datapath/n185 , \u_datapath/n184 ,
         \u_datapath/n183 , \u_datapath/n182 , \u_datapath/n181 ,
         \u_datapath/n180 , \u_datapath/n179 , \u_datapath/n178 ,
         \u_datapath/n177 , \u_datapath/n176 , \u_datapath/n175 ,
         \u_datapath/n174 , \u_datapath/n173 , \u_datapath/n172 ,
         \u_datapath/n171 , \u_datapath/n170 , \u_datapath/n169 ,
         \u_datapath/n168 , \u_datapath/n167 , \u_datapath/n166 ,
         \u_datapath/n165 , \u_datapath/n164 , \u_datapath/n163 ,
         \u_datapath/n162 , \u_datapath/n161 , \u_datapath/n160 ,
         \u_datapath/n159 , \u_datapath/n158 , \u_datapath/n157 ,
         \u_datapath/n156 , \u_datapath/n155 , \u_datapath/n154 ,
         \u_datapath/n153 , \u_datapath/n152 , \u_datapath/n150 ,
         \u_datapath/n149 , \u_datapath/n148 , \u_datapath/n147 ,
         \u_datapath/n146 , \u_datapath/n145 , \u_datapath/n144 ,
         \u_datapath/n143 , \u_datapath/n142 , \u_datapath/n141 ,
         \u_datapath/n140 , \u_datapath/N442 , \u_datapath/N412 ,
         \u_datapath/N411 , \u_datapath/N410 , \u_datapath/N409 ,
         \u_datapath/N404 , \u_datapath/N403 , \u_datapath/N402 ,
         \u_datapath/N401 , \u_datapath/N400 , \u_datapath/N399 ,
         \u_datapath/N398 , \u_datapath/N397 , \u_datapath/N352 ,
         \u_datapath/N351 , \u_datapath/N350 , \u_datapath/N349 ,
         \u_datapath/N348 , \u_datapath/N347 , \u_datapath/N346 ,
         \u_datapath/N345 , \u_datapath/N334 , \u_datapath/N333 ,
         \u_datapath/N332 , \u_datapath/N331 , \u_datapath/N330 ,
         \u_datapath/N329 , \u_datapath/N328 , \u_datapath/N327 ,
         \u_datapath/N312 , \u_datapath/N311 , \u_datapath/N310 ,
         \u_datapath/N309 , \u_datapath/N308 , \u_datapath/N307 ,
         \u_datapath/N306 , \u_datapath/N305 , \u_datapath/N291 ,
         \u_datapath/N290 , \u_datapath/N277 , \u_datapath/N276 ,
         \u_datapath/N275 , \u_datapath/N63 , \u_datapath/N62 ,
         \u_datapath/N61 , \u_datapath/N60 , \u_datapath/N59 ,
         \u_datapath/N58 , \u_datapath/N57 , n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93,
         n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105,
         n106, n107, n108, n109, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225;
  wire   [3:0] ring_power_cnt;
  wire   [3:0] ring_spin_cnt;
  wire   [3:0] ring_v_angle_cnt;
  wire   [3:0] ring_h_angle_cnt;
  wire   [1:0] w_multiplication_select;
  wire   [3:0] \u_fsm/next_state ;
  wire   [3:0] \u_fsm/current_state ;
  wire   [2:0] \u_fsm/calc_lateral_counter ;
  wire   [2:0] \u_fsm/calc_range_counter ;
  wire   [2:0] \u_fsm/calc_v_sq_counter ;
  wire   [3:0] \u_datapath/v_sq_reg ;
  wire   [1:0] \u_datapath/prev_mult_select ;
  wire   [3:0] \u_datapath/spin_adj ;
  wire   [2:0] \u_datapath/mult_cycle ;
  wire   [3:0] \u_datapath/mult_shift_b ;
  wire   [7:0] \u_datapath/mult_shift_a ;
  wire   [3:0] \u_datapath/trig_h ;
  wire   [3:0] \u_datapath/trig_v ;
  wire   [3:0] \u_datapath/h_reg ;
  wire   [3:0] \u_datapath/v_reg ;
  wire   [3:0] \u_datapath/spin_reg ;
  wire   [3:0] \u_datapath/power_reg ;
  wire   [7:0] \u_datapath/lfsr_reg ;
  wire   [7:1] \u_datapath/add_218/carry ;
  wire   [7:1] \u_datapath/add_230/carry ;
  wire   [7:1] \u_datapath/add_235/carry ;

  DFFNEGX1 \ring_v_angle_cnt_reg[0]  ( .D(N29), .CLK(clka), .Q(
        ring_v_angle_cnt[0]) );
  DFFNEGX1 \ring_v_angle_cnt_reg[1]  ( .D(N30), .CLK(clka), .Q(
        ring_v_angle_cnt[1]) );
  DFFNEGX1 \ring_v_angle_cnt_reg[3]  ( .D(N32), .CLK(clka), .Q(
        ring_v_angle_cnt[3]) );
  DFFNEGX1 \ring_v_angle_cnt_reg[2]  ( .D(N31), .CLK(clka), .Q(
        ring_v_angle_cnt[2]) );
  DFFNEGX1 \ring_h_angle_cnt_reg[0]  ( .D(N33), .CLK(clka), .Q(
        ring_h_angle_cnt[0]) );
  DFFNEGX1 \ring_h_angle_cnt_reg[1]  ( .D(N34), .CLK(clka), .Q(
        ring_h_angle_cnt[1]) );
  DFFNEGX1 \ring_h_angle_cnt_reg[2]  ( .D(N35), .CLK(clka), .Q(
        ring_h_angle_cnt[2]) );
  DFFNEGX1 \ring_h_angle_cnt_reg[3]  ( .D(N36), .CLK(clka), .Q(
        ring_h_angle_cnt[3]) );
  DFFNEGX1 \ring_power_cnt_reg[0]  ( .D(N21), .CLK(clka), .Q(ring_power_cnt[0]) );
  DFFNEGX1 \ring_power_cnt_reg[1]  ( .D(N22), .CLK(clka), .Q(ring_power_cnt[1]) );
  DFFNEGX1 \ring_power_cnt_reg[2]  ( .D(n89), .CLK(clka), .Q(ring_power_cnt[2]) );
  DFFNEGX1 \ring_power_cnt_reg[3]  ( .D(N24), .CLK(clka), .Q(ring_power_cnt[3]) );
  DFFNEGX1 \ring_spin_cnt_reg[0]  ( .D(N25), .CLK(clka), .Q(ring_spin_cnt[0])
         );
  DFFNEGX1 \ring_spin_cnt_reg[1]  ( .D(N26), .CLK(clka), .Q(ring_spin_cnt[1])
         );
  DFFNEGX1 \ring_spin_cnt_reg[2]  ( .D(N27), .CLK(clka), .Q(ring_spin_cnt[2])
         );
  DFFNEGX1 \ring_spin_cnt_reg[3]  ( .D(N28), .CLK(clka), .Q(ring_spin_cnt[3])
         );
  AND2X2 U3 ( .A(n29), .B(n69), .Y(N31) );
  AND2X2 U4 ( .A(n38), .B(n69), .Y(N26) );
  NOR2X1 U20 ( .A(n63), .B(n22), .Y(N36) );
  XNOR2X1 U21 ( .A(ring_h_angle_cnt[3]), .B(n23), .Y(n22) );
  NAND3X1 U22 ( .A(n110), .B(n112), .C(n109), .Y(n23) );
  OAI21X1 U23 ( .A(n112), .B(n25), .C(n26), .Y(N35) );
  NAND3X1 U24 ( .A(n111), .B(n112), .C(N33), .Y(n26) );
  OAI21X1 U25 ( .A(ring_h_angle_cnt[0]), .B(ring_h_angle_cnt[1]), .C(n67), .Y(
        n25) );
  NOR2X1 U26 ( .A(n63), .B(n24), .Y(N34) );
  XNOR2X1 U27 ( .A(ring_h_angle_cnt[1]), .B(n110), .Y(n24) );
  NOR2X1 U28 ( .A(restart), .B(ring_h_angle_cnt[0]), .Y(N33) );
  NOR2X1 U29 ( .A(n63), .B(n27), .Y(N32) );
  XNOR2X1 U30 ( .A(ring_v_angle_cnt[3]), .B(n28), .Y(n27) );
  OAI21X1 U31 ( .A(n30), .B(n108), .C(n28), .Y(n29) );
  NAND2X1 U32 ( .A(n108), .B(n30), .Y(n28) );
  NAND2X1 U33 ( .A(ring_v_angle_cnt[1]), .B(ring_v_angle_cnt[0]), .Y(n30) );
  NOR2X1 U34 ( .A(n63), .B(n31), .Y(N30) );
  XNOR2X1 U35 ( .A(ring_v_angle_cnt[0]), .B(ring_v_angle_cnt[1]), .Y(n31) );
  NOR2X1 U36 ( .A(ring_v_angle_cnt[0]), .B(n63), .Y(N29) );
  OAI21X1 U37 ( .A(n32), .B(n118), .C(n33), .Y(N28) );
  NAND3X1 U38 ( .A(ring_spin_cnt[2]), .B(n34), .C(n35), .Y(n33) );
  NOR2X1 U39 ( .A(ring_spin_cnt[3]), .B(restart), .Y(n35) );
  AOI22X1 U40 ( .A(N26), .B(n116), .C(n64), .D(n117), .Y(n32) );
  OAI21X1 U41 ( .A(n115), .B(n36), .C(n37), .Y(N27) );
  NAND3X1 U42 ( .A(ring_spin_cnt[2]), .B(n116), .C(N26), .Y(n37) );
  NAND2X1 U43 ( .A(n68), .B(n117), .Y(n36) );
  NAND2X1 U44 ( .A(n38), .B(n116), .Y(n34) );
  XNOR2X1 U45 ( .A(ring_spin_cnt[0]), .B(ring_spin_cnt[1]), .Y(n38) );
  NOR2X1 U46 ( .A(ring_spin_cnt[0]), .B(n63), .Y(N25) );
  OAI21X1 U47 ( .A(n39), .B(n114), .C(n40), .Y(N24) );
  NAND3X1 U48 ( .A(n90), .B(n114), .C(ring_power_cnt[2]), .Y(n40) );
  AOI21X1 U49 ( .A(n65), .B(n113), .C(n41), .Y(n39) );
  AOI22X1 U50 ( .A(n41), .B(ring_power_cnt[2]), .C(n113), .D(n90), .Y(n42) );
  NAND3X1 U51 ( .A(ring_power_cnt[0]), .B(n65), .C(ring_power_cnt[1]), .Y(n43)
         );
  OAI21X1 U52 ( .A(ring_power_cnt[1]), .B(restart), .C(n104), .Y(n41) );
  NOR2X1 U53 ( .A(restart), .B(n44), .Y(N22) );
  XNOR2X1 U54 ( .A(ring_power_cnt[0]), .B(ring_power_cnt[1]), .Y(n44) );
  NOR2X1 U55 ( .A(restart), .B(ring_power_cnt[0]), .Y(N21) );
  NOR2X1 \u_fsm/U166  ( .A(\u_fsm/current_state [3]), .B(
        \u_fsm/current_state [0]), .Y(\u_fsm/n86 ) );
  NAND2X1 \u_fsm/U165  ( .A(\u_fsm/n120 ), .B(\u_fsm/n86 ), .Y(\u_fsm/n82 ) );
  NOR2X1 \u_fsm/U164  ( .A(n148), .B(\u_fsm/current_state [3]), .Y(
        \u_fsm/n129 ) );
  NAND2X1 \u_fsm/U163  ( .A(\u_fsm/n120 ), .B(\u_fsm/n129 ), .Y(\u_fsm/n81 )
         );
  OAI22X1 \u_fsm/U162  ( .A(n105), .B(\u_fsm/n82 ), .C(v_angle_ctrl), .D(
        \u_fsm/n81 ), .Y(\u_fsm/n137 ) );
  NOR2X1 \u_fsm/U161  ( .A(\u_fsm/current_state [2]), .B(
        \u_fsm/current_state [1]), .Y(\u_fsm/n87 ) );
  NAND2X1 \u_fsm/U160  ( .A(\u_fsm/n129 ), .B(\u_fsm/n87 ), .Y(\u_fsm/n85 ) );
  NAND2X1 \u_fsm/U159  ( .A(\u_fsm/n127 ), .B(\u_fsm/n120 ), .Y(\u_fsm/n76 )
         );
  NAND2X1 \u_fsm/U158  ( .A(\u_fsm/n127 ), .B(\u_fsm/n87 ), .Y(\u_fsm/n77 ) );
  NOR2X1 \u_fsm/U157  ( .A(n140), .B(\u_fsm/current_state [1]), .Y(
        \u_fsm/n128 ) );
  NAND2X1 \u_fsm/U156  ( .A(\u_fsm/n127 ), .B(\u_fsm/n128 ), .Y(\u_fsm/n74 )
         );
  NAND3X1 \u_fsm/U155  ( .A(\u_fsm/n76 ), .B(\u_fsm/n77 ), .C(\u_fsm/n74 ), 
        .Y(\u_fsm/n114 ) );
  OAI21X1 \u_fsm/U154  ( .A(strike_power_ctrl), .B(\u_fsm/n85 ), .C(n133), .Y(
        \u_fsm/n138 ) );
  NOR2X1 \u_fsm/U153  ( .A(\u_fsm/n137 ), .B(\u_fsm/n138 ), .Y(\u_fsm/n131 )
         );
  NAND3X1 \u_fsm/U152  ( .A(n144), .B(n146), .C(\u_fsm/calc_range_counter [2]), 
        .Y(\u_fsm/n66 ) );
  NAND2X1 \u_fsm/U151  ( .A(\u_fsm/current_state [2]), .B(
        \u_fsm/current_state [1]), .Y(\u_fsm/n84 ) );
  NAND2X1 \u_fsm/U150  ( .A(\u_fsm/n129 ), .B(n141), .Y(\u_fsm/n48 ) );
  NAND2X1 \u_fsm/U149  ( .A(\u_fsm/current_state [3]), .B(
        \u_fsm/current_state [0]), .Y(\u_fsm/n83 ) );
  NAND2X1 \u_fsm/U148  ( .A(\u_fsm/n87 ), .B(n136), .Y(\u_fsm/n47 ) );
  NAND3X1 \u_fsm/U147  ( .A(n130), .B(n132), .C(
        \u_fsm/calc_lateral_counter [2]), .Y(\u_fsm/n56 ) );
  AOI22X1 \u_fsm/U146  ( .A(\u_fsm/n136 ), .B(enable), .C(n134), .D(
        \u_fsm/n56 ), .Y(\u_fsm/n135 ) );
  OAI21X1 \u_fsm/U145  ( .A(n143), .B(\u_fsm/n48 ), .C(\u_fsm/n135 ), .Y(
        \u_fsm/n133 ) );
  NAND2X1 \u_fsm/U144  ( .A(\u_fsm/n128 ), .B(\u_fsm/n86 ), .Y(\u_fsm/n90 ) );
  NAND2X1 \u_fsm/U143  ( .A(\u_fsm/n86 ), .B(n141), .Y(\u_fsm/n58 ) );
  NAND3X1 \u_fsm/U142  ( .A(n127), .B(n129), .C(\u_fsm/calc_v_sq_counter [2]), 
        .Y(\u_fsm/n44 ) );
  OAI22X1 \u_fsm/U141  ( .A(n107), .B(\u_fsm/n90 ), .C(\u_fsm/n58 ), .D(
        \u_fsm/n44 ), .Y(\u_fsm/n134 ) );
  NOR2X1 \u_fsm/U140  ( .A(\u_fsm/n133 ), .B(\u_fsm/n134 ), .Y(\u_fsm/n132 )
         );
  AOI21X1 \u_fsm/U139  ( .A(\u_fsm/n131 ), .B(\u_fsm/n132 ), .C(n63), .Y(
        \u_fsm/N134 ) );
  OAI21X1 \u_fsm/U138  ( .A(\u_fsm/n56 ), .B(\u_fsm/n47 ), .C(\u_fsm/n130 ), 
        .Y(\u_fsm/n122 ) );
  AOI22X1 \u_fsm/U137  ( .A(n137), .B(n106), .C(n138), .D(strike_power_ctrl), 
        .Y(\u_fsm/n124 ) );
  NAND2X1 \u_fsm/U136  ( .A(\u_fsm/n128 ), .B(n136), .Y(\u_fsm/n73 ) );
  NAND2X1 \u_fsm/U135  ( .A(\u_fsm/n128 ), .B(\u_fsm/n129 ), .Y(\u_fsm/n89 )
         );
  NAND2X1 \u_fsm/U134  ( .A(\u_fsm/n127 ), .B(n141), .Y(\u_fsm/n75 ) );
  NAND3X1 \u_fsm/U133  ( .A(\u_fsm/n73 ), .B(\u_fsm/n89 ), .C(\u_fsm/n75 ), 
        .Y(\u_fsm/n125 ) );
  OAI21X1 \u_fsm/U132  ( .A(n143), .B(\u_fsm/n48 ), .C(\u_fsm/n58 ), .Y(
        \u_fsm/n126 ) );
  NOR2X1 \u_fsm/U131  ( .A(\u_fsm/n125 ), .B(\u_fsm/n126 ), .Y(\u_fsm/n119 )
         );
  NAND2X1 \u_fsm/U130  ( .A(\u_fsm/n124 ), .B(\u_fsm/n119 ), .Y(\u_fsm/n123 )
         );
  OAI21X1 \u_fsm/U129  ( .A(\u_fsm/n122 ), .B(\u_fsm/n123 ), .C(n67), .Y(
        \u_fsm/n121 ) );
  NAND2X1 \u_fsm/U128  ( .A(\u_fsm/n120 ), .B(n136), .Y(\u_fsm/n78 ) );
  NAND3X1 \u_fsm/U127  ( .A(\u_fsm/n78 ), .B(\u_fsm/n90 ), .C(\u_fsm/n74 ), 
        .Y(\u_fsm/n117 ) );
  OAI21X1 \u_fsm/U126  ( .A(n106), .B(\u_fsm/n81 ), .C(\u_fsm/n119 ), .Y(
        \u_fsm/n118 ) );
  OAI21X1 \u_fsm/U125  ( .A(\u_fsm/n117 ), .B(\u_fsm/n118 ), .C(n67), .Y(
        \u_fsm/n116 ) );
  OAI21X1 \u_fsm/U124  ( .A(\u_fsm/n66 ), .B(\u_fsm/n48 ), .C(\u_fsm/n75 ), 
        .Y(\u_fsm/n115 ) );
  NOR2X1 \u_fsm/U123  ( .A(\u_fsm/n114 ), .B(\u_fsm/n115 ), .Y(\u_fsm/n111 )
         );
  NAND2X1 \u_fsm/U122  ( .A(\u_fsm/n78 ), .B(\u_fsm/n47 ), .Y(\u_fsm/n113 ) );
  NOR2X1 \u_fsm/U121  ( .A(n135), .B(\u_fsm/n113 ), .Y(\u_fsm/n112 ) );
  AOI21X1 \u_fsm/U120  ( .A(\u_fsm/n111 ), .B(\u_fsm/n112 ), .C(n63), .Y(
        \u_fsm/N137 ) );
  NOR2X1 \u_fsm/U119  ( .A(n126), .B(n63), .Y(\u_fsm/N228 ) );
  NOR2X1 \u_fsm/U118  ( .A(n147), .B(n63), .Y(\u_fsm/N229 ) );
  NOR2X1 \u_fsm/U117  ( .A(n142), .B(n63), .Y(\u_fsm/N230 ) );
  NOR2X1 \u_fsm/U116  ( .A(n139), .B(n63), .Y(\u_fsm/N231 ) );
  NOR2X1 \u_fsm/U115  ( .A(\u_fsm/next_state [2]), .B(\u_fsm/next_state [3]), 
        .Y(\u_fsm/n106 ) );
  NAND2X1 \u_fsm/U114  ( .A(\u_fsm/n106 ), .B(n147), .Y(\u_fsm/n109 ) );
  NAND2X1 \u_fsm/U113  ( .A(strike_power_ctrl), .B(\u_fsm/N228 ), .Y(
        \u_fsm/n110 ) );
  NOR2X1 \u_fsm/U112  ( .A(\u_fsm/n109 ), .B(\u_fsm/n110 ), .Y(\u_fsm/N232 )
         );
  NAND2X1 \u_fsm/U111  ( .A(\u_fsm/n106 ), .B(n126), .Y(\u_fsm/n107 ) );
  NAND2X1 \u_fsm/U110  ( .A(spin_ctrl), .B(\u_fsm/N229 ), .Y(\u_fsm/n108 ) );
  NOR2X1 \u_fsm/U109  ( .A(\u_fsm/n107 ), .B(\u_fsm/n108 ), .Y(\u_fsm/N233 )
         );
  NAND2X1 \u_fsm/U108  ( .A(\u_fsm/n106 ), .B(\u_fsm/next_state [0]), .Y(
        \u_fsm/n104 ) );
  NAND2X1 \u_fsm/U107  ( .A(v_angle_ctrl), .B(\u_fsm/N229 ), .Y(\u_fsm/n105 )
         );
  NOR2X1 \u_fsm/U106  ( .A(\u_fsm/n104 ), .B(\u_fsm/n105 ), .Y(\u_fsm/N234 )
         );
  NAND2X1 \u_fsm/U105  ( .A(n126), .B(n147), .Y(\u_fsm/n102 ) );
  NAND2X1 \u_fsm/U104  ( .A(\u_fsm/N230 ), .B(n139), .Y(\u_fsm/n97 ) );
  OR2X1 \u_fsm/U103  ( .A(n107), .B(\u_fsm/n97 ), .Y(\u_fsm/n103 ) );
  NOR2X1 \u_fsm/U102  ( .A(\u_fsm/n102 ), .B(\u_fsm/n103 ), .Y(\u_fsm/N235 )
         );
  NAND2X1 \u_fsm/U101  ( .A(\u_fsm/next_state [0]), .B(n147), .Y(\u_fsm/n101 )
         );
  NOR2X1 \u_fsm/U100  ( .A(\u_fsm/n97 ), .B(\u_fsm/n101 ), .Y(\u_fsm/N236 ) );
  NAND2X1 \u_fsm/U99  ( .A(\u_fsm/next_state [1]), .B(n126), .Y(\u_fsm/n98 )
         );
  NOR2X1 \u_fsm/U98  ( .A(n63), .B(\u_fsm/next_state [2]), .Y(\u_fsm/n99 ) );
  NOR2X1 \u_fsm/U97  ( .A(n139), .B(n126), .Y(\u_fsm/n100 ) );
  NAND3X1 \u_fsm/U96  ( .A(\u_fsm/n99 ), .B(n147), .C(\u_fsm/n100 ), .Y(
        \u_fsm/n94 ) );
  OAI21X1 \u_fsm/U95  ( .A(\u_fsm/n97 ), .B(\u_fsm/n98 ), .C(\u_fsm/n94 ), .Y(
        \u_fsm/N237 ) );
  NAND2X1 \u_fsm/U94  ( .A(\u_fsm/next_state [1]), .B(\u_fsm/next_state [0]), 
        .Y(\u_fsm/n92 ) );
  OR2X1 \u_fsm/U93  ( .A(\u_fsm/n97 ), .B(\u_fsm/n92 ), .Y(\u_fsm/n96 ) );
  NAND2X1 \u_fsm/U92  ( .A(\u_fsm/n94 ), .B(\u_fsm/n96 ), .Y(\u_fsm/N238 ) );
  NAND3X1 \u_fsm/U91  ( .A(n126), .B(n142), .C(\u_fsm/N231 ), .Y(\u_fsm/n95 )
         );
  NOR2X1 \u_fsm/U90  ( .A(n147), .B(\u_fsm/n95 ), .Y(\u_fsm/N239 ) );
  OAI21X1 \u_fsm/U89  ( .A(\u_fsm/next_state [1]), .B(\u_fsm/n95 ), .C(
        \u_fsm/n96 ), .Y(\u_fsm/N240 ) );
  NAND2X1 \u_fsm/U88  ( .A(\u_fsm/N231 ), .B(n142), .Y(\u_fsm/n93 ) );
  NOR2X1 \u_fsm/U87  ( .A(\u_fsm/n92 ), .B(\u_fsm/n93 ), .Y(\u_fsm/N242 ) );
  NAND2X1 \u_fsm/U86  ( .A(\u_fsm/N231 ), .B(\u_fsm/n92 ), .Y(\u_fsm/n91 ) );
  NOR2X1 \u_fsm/U85  ( .A(n142), .B(\u_fsm/n91 ), .Y(\u_fsm/N243 ) );
  NAND2X1 \u_fsm/U84  ( .A(\u_fsm/n89 ), .B(\u_fsm/n90 ), .Y(\u_fsm/n88 ) );
  AOI21X1 \u_fsm/U83  ( .A(\u_fsm/n86 ), .B(\u_fsm/n87 ), .C(\u_fsm/n88 ), .Y(
        \u_fsm/n68 ) );
  OAI21X1 \u_fsm/U82  ( .A(\u_fsm/n83 ), .B(\u_fsm/n84 ), .C(\u_fsm/n85 ), .Y(
        \u_fsm/n79 ) );
  NAND2X1 \u_fsm/U81  ( .A(\u_fsm/n81 ), .B(\u_fsm/n82 ), .Y(\u_fsm/n80 ) );
  NOR2X1 \u_fsm/U80  ( .A(\u_fsm/n79 ), .B(\u_fsm/n80 ), .Y(\u_fsm/n69 ) );
  NAND3X1 \u_fsm/U79  ( .A(\u_fsm/n76 ), .B(\u_fsm/n77 ), .C(\u_fsm/n78 ), .Y(
        \u_fsm/n71 ) );
  NAND3X1 \u_fsm/U78  ( .A(\u_fsm/n73 ), .B(\u_fsm/n74 ), .C(\u_fsm/n75 ), .Y(
        \u_fsm/n72 ) );
  NOR2X1 \u_fsm/U77  ( .A(\u_fsm/n71 ), .B(\u_fsm/n72 ), .Y(\u_fsm/n70 ) );
  NAND3X1 \u_fsm/U76  ( .A(\u_fsm/n68 ), .B(\u_fsm/n69 ), .C(\u_fsm/n70 ), .Y(
        \u_fsm/n45 ) );
  NAND2X1 \u_fsm/U75  ( .A(\u_fsm/n58 ), .B(\u_fsm/n47 ), .Y(\u_fsm/n67 ) );
  OAI21X1 \u_fsm/U74  ( .A(\u_fsm/n45 ), .B(\u_fsm/n67 ), .C(n67), .Y(
        \u_fsm/n64 ) );
  OAI21X1 \u_fsm/U73  ( .A(restart), .B(\u_fsm/calc_range_counter [0]), .C(
        \u_fsm/n64 ), .Y(\u_fsm/n63 ) );
  NAND3X1 \u_fsm/U72  ( .A(\u_fsm/n66 ), .B(n66), .C(\u_fsm/n64 ), .Y(
        \u_fsm/n62 ) );
  NAND3X1 \u_fsm/U71  ( .A(n84), .B(n146), .C(\u_fsm/calc_range_counter [0]), 
        .Y(\u_fsm/n65 ) );
  OAI21X1 \u_fsm/U70  ( .A(n83), .B(n146), .C(\u_fsm/n65 ), .Y(\u_fsm/n147 )
         );
  OAI22X1 \u_fsm/U69  ( .A(n144), .B(\u_fsm/n64 ), .C(
        \u_fsm/calc_range_counter [0]), .D(\u_fsm/n62 ), .Y(\u_fsm/n146 ) );
  AOI21X1 \u_fsm/U68  ( .A(n146), .B(n65), .C(\u_fsm/n63 ), .Y(\u_fsm/n59 ) );
  NOR2X1 \u_fsm/U67  ( .A(\u_fsm/calc_range_counter [2]), .B(\u_fsm/n62 ), .Y(
        \u_fsm/n61 ) );
  NAND3X1 \u_fsm/U66  ( .A(\u_fsm/calc_range_counter [1]), .B(
        \u_fsm/calc_range_counter [0]), .C(\u_fsm/n61 ), .Y(\u_fsm/n60 ) );
  OAI21X1 \u_fsm/U65  ( .A(\u_fsm/n59 ), .B(n145), .C(\u_fsm/n60 ), .Y(
        \u_fsm/n145 ) );
  NAND2X1 \u_fsm/U64  ( .A(\u_fsm/n58 ), .B(\u_fsm/n48 ), .Y(\u_fsm/n57 ) );
  OAI21X1 \u_fsm/U63  ( .A(\u_fsm/n45 ), .B(\u_fsm/n57 ), .C(n67), .Y(
        \u_fsm/n54 ) );
  OAI21X1 \u_fsm/U62  ( .A(restart), .B(\u_fsm/calc_lateral_counter [0]), .C(
        \u_fsm/n54 ), .Y(\u_fsm/n53 ) );
  NAND3X1 \u_fsm/U61  ( .A(\u_fsm/n56 ), .B(n66), .C(\u_fsm/n54 ), .Y(
        \u_fsm/n52 ) );
  NAND3X1 \u_fsm/U60  ( .A(n86), .B(n132), .C(\u_fsm/calc_lateral_counter [0]), 
        .Y(\u_fsm/n55 ) );
  OAI21X1 \u_fsm/U59  ( .A(n85), .B(n132), .C(\u_fsm/n55 ), .Y(\u_fsm/n144 )
         );
  OAI22X1 \u_fsm/U58  ( .A(n130), .B(\u_fsm/n54 ), .C(
        \u_fsm/calc_lateral_counter [0]), .D(\u_fsm/n52 ), .Y(\u_fsm/n143 ) );
  AOI21X1 \u_fsm/U57  ( .A(n132), .B(n64), .C(\u_fsm/n53 ), .Y(\u_fsm/n49 ) );
  NOR2X1 \u_fsm/U56  ( .A(\u_fsm/calc_lateral_counter [2]), .B(\u_fsm/n52 ), 
        .Y(\u_fsm/n51 ) );
  NAND3X1 \u_fsm/U55  ( .A(\u_fsm/calc_lateral_counter [1]), .B(
        \u_fsm/calc_lateral_counter [0]), .C(\u_fsm/n51 ), .Y(\u_fsm/n50 ) );
  OAI21X1 \u_fsm/U54  ( .A(\u_fsm/n49 ), .B(n131), .C(\u_fsm/n50 ), .Y(
        \u_fsm/n142 ) );
  NAND2X1 \u_fsm/U53  ( .A(\u_fsm/n47 ), .B(\u_fsm/n48 ), .Y(\u_fsm/n46 ) );
  OAI21X1 \u_fsm/U52  ( .A(\u_fsm/n45 ), .B(\u_fsm/n46 ), .C(n67), .Y(
        \u_fsm/n42 ) );
  OAI21X1 \u_fsm/U51  ( .A(restart), .B(\u_fsm/calc_v_sq_counter [0]), .C(
        \u_fsm/n42 ), .Y(\u_fsm/n41 ) );
  NAND3X1 \u_fsm/U50  ( .A(\u_fsm/n44 ), .B(n65), .C(\u_fsm/n42 ), .Y(
        \u_fsm/n40 ) );
  NAND3X1 \u_fsm/U49  ( .A(n88), .B(n129), .C(\u_fsm/calc_v_sq_counter [0]), 
        .Y(\u_fsm/n43 ) );
  OAI21X1 \u_fsm/U48  ( .A(n87), .B(n129), .C(\u_fsm/n43 ), .Y(\u_fsm/n141 )
         );
  OAI22X1 \u_fsm/U47  ( .A(n127), .B(\u_fsm/n42 ), .C(
        \u_fsm/calc_v_sq_counter [0]), .D(\u_fsm/n40 ), .Y(\u_fsm/n140 ) );
  AOI21X1 \u_fsm/U46  ( .A(n129), .B(n64), .C(\u_fsm/n41 ), .Y(\u_fsm/n37 ) );
  NOR2X1 \u_fsm/U45  ( .A(\u_fsm/calc_v_sq_counter [2]), .B(\u_fsm/n40 ), .Y(
        \u_fsm/n39 ) );
  NAND3X1 \u_fsm/U44  ( .A(\u_fsm/calc_v_sq_counter [1]), .B(
        \u_fsm/calc_v_sq_counter [0]), .C(\u_fsm/n39 ), .Y(\u_fsm/n38 ) );
  OAI21X1 \u_fsm/U43  ( .A(\u_fsm/n37 ), .B(n128), .C(\u_fsm/n38 ), .Y(
        \u_fsm/n139 ) );
  AND2X2 \u_fsm/U6  ( .A(\u_fsm/current_state [1]), .B(n140), .Y(\u_fsm/n120 )
         );
  AND2X2 \u_fsm/U5  ( .A(\u_fsm/current_state [3]), .B(n148), .Y(\u_fsm/n127 )
         );
  AND2X2 \u_fsm/U4  ( .A(\u_fsm/n87 ), .B(\u_fsm/n86 ), .Y(\u_fsm/n136 ) );
  AND2X2 \u_fsm/U3  ( .A(\u_fsm/n82 ), .B(\u_fsm/n76 ), .Y(\u_fsm/n130 ) );
  DFFNEGX1 \u_fsm/access_trig_enable_reg  ( .D(\u_fsm/N236 ), .CLK(n75), .Q(
        w_access_trig_enable) );
  DFFNEGX1 \u_fsm/h_angle_store_enable_reg  ( .D(\u_fsm/N235 ), .CLK(n75), .Q(
        w_h_angle_store_enable) );
  DFFNEGX1 \u_fsm/v_angle_store_enable_reg  ( .D(\u_fsm/N234 ), .CLK(n75), .Q(
        w_v_angle_store_enable) );
  DFFNEGX1 \u_fsm/spin_store_enable_reg  ( .D(\u_fsm/N233 ), .CLK(n75), .Q(
        w_spin_store_enable) );
  DFFNEGX1 \u_fsm/strike_store_enable_reg  ( .D(\u_fsm/N232 ), .CLK(n75), .Q(
        w_strike_store_enable) );
  DFFNEGX1 \u_fsm/state_debug_reg[0]  ( .D(\u_fsm/N228 ), .CLK(n75), .Q(
        state_debug[0]) );
  DFFNEGX1 \u_fsm/state_debug_reg[1]  ( .D(\u_fsm/N229 ), .CLK(n75), .Q(
        state_debug[1]) );
  DFFNEGX1 \u_fsm/state_debug_reg[2]  ( .D(\u_fsm/N230 ), .CLK(n75), .Q(
        state_debug[2]) );
  DFFNEGX1 \u_fsm/state_debug_reg[3]  ( .D(\u_fsm/N231 ), .CLK(n75), .Q(
        state_debug[3]) );
  DFFNEGX1 \u_fsm/display_enable_reg  ( .D(\u_fsm/N243 ), .CLK(n75), .Q(
        w_display_enable) );
  DFFNEGX1 \u_fsm/range_enable_reg  ( .D(\u_fsm/N240 ), .CLK(n75), .Q(
        w_range_enable) );
  DFFNEGX1 \u_fsm/collision_check_enable_reg  ( .D(\u_fsm/N242 ), .CLK(n75), 
        .Q(w_collision_check_enable) );
  DFFNEGX1 \u_fsm/sample_keeper_enable_reg  ( .D(\u_fsm/N239 ), .CLK(n75), .Q(
        w_sample_keeper_enable) );
  DFFNEGX1 \u_fsm/multiplication_select_reg[0]  ( .D(\u_fsm/N237 ), .CLK(n74), 
        .Q(w_multiplication_select[0]) );
  DFFNEGX1 \u_fsm/multiplication_select_reg[1]  ( .D(\u_fsm/N238 ), .CLK(n74), 
        .Q(w_multiplication_select[1]) );
  DFFNEGX1 \u_fsm/next_state_reg[0]  ( .D(\u_fsm/N134 ), .CLK(clka), .Q(
        \u_fsm/next_state [0]) );
  DFFNEGX1 \u_fsm/calc_v_sq_counter_reg[0]  ( .D(\u_fsm/n140 ), .CLK(clka), 
        .Q(\u_fsm/calc_v_sq_counter [0]) );
  DFFNEGX1 \u_fsm/calc_v_sq_counter_reg[2]  ( .D(\u_fsm/n139 ), .CLK(clka), 
        .Q(\u_fsm/calc_v_sq_counter [2]) );
  DFFNEGX1 \u_fsm/calc_v_sq_counter_reg[1]  ( .D(\u_fsm/n141 ), .CLK(clka), 
        .Q(\u_fsm/calc_v_sq_counter [1]) );
  DFFNEGX1 \u_fsm/calc_lateral_counter_reg[0]  ( .D(\u_fsm/n143 ), .CLK(clka), 
        .Q(\u_fsm/calc_lateral_counter [0]) );
  DFFNEGX1 \u_fsm/calc_lateral_counter_reg[2]  ( .D(\u_fsm/n142 ), .CLK(clka), 
        .Q(\u_fsm/calc_lateral_counter [2]) );
  DFFNEGX1 \u_fsm/calc_lateral_counter_reg[1]  ( .D(\u_fsm/n144 ), .CLK(clka), 
        .Q(\u_fsm/calc_lateral_counter [1]) );
  DFFNEGX1 \u_fsm/current_state_reg[3]  ( .D(\u_fsm/N231 ), .CLK(n74), .Q(
        \u_fsm/current_state [3]) );
  DFFNEGX1 \u_fsm/next_state_reg[3]  ( .D(\u_fsm/N137 ), .CLK(clka), .Q(
        \u_fsm/next_state [3]) );
  DFFNEGX1 \u_fsm/current_state_reg[2]  ( .D(\u_fsm/N230 ), .CLK(n74), .Q(
        \u_fsm/current_state [2]) );
  DFFNEGX1 \u_fsm/next_state_reg[2]  ( .D(n82), .CLK(clka), .Q(
        \u_fsm/next_state [2]) );
  DFFNEGX1 \u_fsm/calc_range_counter_reg[0]  ( .D(\u_fsm/n146 ), .CLK(clka), 
        .Q(\u_fsm/calc_range_counter [0]) );
  DFFNEGX1 \u_fsm/calc_range_counter_reg[2]  ( .D(\u_fsm/n145 ), .CLK(clka), 
        .Q(\u_fsm/calc_range_counter [2]) );
  DFFNEGX1 \u_fsm/calc_range_counter_reg[1]  ( .D(\u_fsm/n147 ), .CLK(clka), 
        .Q(\u_fsm/calc_range_counter [1]) );
  DFFNEGX1 \u_fsm/current_state_reg[1]  ( .D(\u_fsm/N229 ), .CLK(n74), .Q(
        \u_fsm/current_state [1]) );
  DFFNEGX1 \u_fsm/next_state_reg[1]  ( .D(n81), .CLK(clka), .Q(
        \u_fsm/next_state [1]) );
  DFFNEGX1 \u_fsm/current_state_reg[0]  ( .D(\u_fsm/N228 ), .CLK(n74), .Q(
        \u_fsm/current_state [0]) );
  NAND2X1 \u_datapath/U455  ( .A(n125), .B(n124), .Y(\u_datapath/n269 ) );
  NAND3X1 \u_datapath/U454  ( .A(\u_datapath/mult_cycle [0]), .B(n212), .C(
        \u_datapath/mult_cycle [2]), .Y(\u_datapath/n367 ) );
  OAI21X1 \u_datapath/U453  ( .A(n213), .B(n212), .C(\u_datapath/n398 ), .Y(
        \u_datapath/n387 ) );
  XOR2X1 \u_datapath/U452  ( .A(\u_datapath/prev_mult_select [0]), .B(
        w_multiplication_select[0]), .Y(\u_datapath/n396 ) );
  XOR2X1 \u_datapath/U451  ( .A(\u_datapath/prev_mult_select [1]), .B(
        w_multiplication_select[1]), .Y(\u_datapath/n397 ) );
  OAI21X1 \u_datapath/U450  ( .A(\u_datapath/n396 ), .B(\u_datapath/n397 ), 
        .C(\u_datapath/n269 ), .Y(\u_datapath/n267 ) );
  NAND2X1 \u_datapath/U449  ( .A(n123), .B(\u_datapath/n267 ), .Y(
        \u_datapath/n392 ) );
  NAND3X1 \u_datapath/U448  ( .A(\u_datapath/n387 ), .B(\u_datapath/n267 ), 
        .C(\u_datapath/n269 ), .Y(\u_datapath/n268 ) );
  OAI21X1 \u_datapath/U447  ( .A(n214), .B(\u_datapath/n268 ), .C(
        \u_datapath/n267 ), .Y(\u_datapath/n395 ) );
  AOI21X1 \u_datapath/U446  ( .A(n122), .B(n214), .C(\u_datapath/n395 ), .Y(
        \u_datapath/n394 ) );
  NOR2X1 \u_datapath/U445  ( .A(restart), .B(\u_datapath/n394 ), .Y(
        \u_datapath/N275 ) );
  OAI21X1 \u_datapath/U444  ( .A(\u_datapath/mult_cycle [0]), .B(
        \u_datapath/n392 ), .C(\u_datapath/n268 ), .Y(\u_datapath/n393 ) );
  NAND2X1 \u_datapath/U443  ( .A(\u_datapath/n393 ), .B(n67), .Y(
        \u_datapath/n389 ) );
  NAND3X1 \u_datapath/U441  ( .A(\u_datapath/mult_cycle [0]), .B(n212), .C(n45), .Y(\u_datapath/n391 ) );
  OAI21X1 \u_datapath/U440  ( .A(n212), .B(\u_datapath/n389 ), .C(
        \u_datapath/n391 ), .Y(\u_datapath/N276 ) );
  NAND3X1 \u_datapath/U439  ( .A(\u_datapath/mult_cycle [1]), .B(
        \u_datapath/mult_cycle [0]), .C(n45), .Y(\u_datapath/n390 ) );
  OAI21X1 \u_datapath/U438  ( .A(n213), .B(\u_datapath/n389 ), .C(
        \u_datapath/n390 ), .Y(\u_datapath/N277 ) );
  NOR2X1 \u_datapath/U437  ( .A(restart), .B(n124), .Y(\u_datapath/N290 ) );
  NOR2X1 \u_datapath/U436  ( .A(restart), .B(n125), .Y(\u_datapath/N291 ) );
  NOR2X1 \u_datapath/U435  ( .A(n121), .B(n214), .Y(\u_datapath/n388 ) );
  NAND3X1 \u_datapath/U434  ( .A(n212), .B(n213), .C(\u_datapath/n388 ), .Y(
        \u_datapath/n369 ) );
  NAND2X1 \u_datapath/U433  ( .A(\u_datapath/mult_shift_a [0]), .B(
        \u_datapath/mult_shift_b [0]), .Y(\u_datapath/n147 ) );
  AOI21X1 \u_datapath/U432  ( .A(n212), .B(n213), .C(\u_datapath/n387 ), .Y(
        \u_datapath/n372 ) );
  NOR2X1 \u_datapath/U431  ( .A(n61), .B(n62), .Y(\u_datapath/n371 ) );
  AOI22X1 \u_datapath/U430  ( .A(\u_datapath/n371 ), .B(mult_product_debug[0]), 
        .C(\u_datapath/N305 ), .D(n61), .Y(\u_datapath/n386 ) );
  OAI21X1 \u_datapath/U429  ( .A(\u_datapath/n369 ), .B(\u_datapath/n147 ), 
        .C(\u_datapath/n386 ), .Y(\u_datapath/n385 ) );
  NAND2X1 \u_datapath/U428  ( .A(\u_datapath/mult_shift_a [1]), .B(
        \u_datapath/mult_shift_b [0]), .Y(\u_datapath/n146 ) );
  AOI22X1 \u_datapath/U427  ( .A(\u_datapath/n371 ), .B(mult_product_debug[1]), 
        .C(\u_datapath/N306 ), .D(n61), .Y(\u_datapath/n384 ) );
  OAI21X1 \u_datapath/U426  ( .A(\u_datapath/n369 ), .B(\u_datapath/n146 ), 
        .C(\u_datapath/n384 ), .Y(\u_datapath/n383 ) );
  NAND2X1 \u_datapath/U425  ( .A(\u_datapath/mult_shift_a [2]), .B(
        \u_datapath/mult_shift_b [0]), .Y(\u_datapath/n145 ) );
  AOI22X1 \u_datapath/U424  ( .A(\u_datapath/n371 ), .B(mult_product_debug[2]), 
        .C(\u_datapath/N307 ), .D(n61), .Y(\u_datapath/n382 ) );
  OAI21X1 \u_datapath/U423  ( .A(\u_datapath/n369 ), .B(\u_datapath/n145 ), 
        .C(\u_datapath/n382 ), .Y(\u_datapath/n381 ) );
  NAND2X1 \u_datapath/U422  ( .A(\u_datapath/mult_shift_a [3]), .B(
        \u_datapath/mult_shift_b [0]), .Y(\u_datapath/n144 ) );
  AOI22X1 \u_datapath/U421  ( .A(\u_datapath/n371 ), .B(mult_product_debug[3]), 
        .C(\u_datapath/N308 ), .D(n61), .Y(\u_datapath/n380 ) );
  OAI21X1 \u_datapath/U420  ( .A(\u_datapath/n369 ), .B(\u_datapath/n144 ), 
        .C(\u_datapath/n380 ), .Y(\u_datapath/n379 ) );
  NAND2X1 \u_datapath/U419  ( .A(\u_datapath/mult_shift_a [4]), .B(
        \u_datapath/mult_shift_b [0]), .Y(\u_datapath/n143 ) );
  AOI22X1 \u_datapath/U418  ( .A(\u_datapath/n371 ), .B(mult_product_debug[4]), 
        .C(\u_datapath/N309 ), .D(n61), .Y(\u_datapath/n378 ) );
  OAI21X1 \u_datapath/U417  ( .A(\u_datapath/n369 ), .B(\u_datapath/n143 ), 
        .C(\u_datapath/n378 ), .Y(\u_datapath/n377 ) );
  NAND2X1 \u_datapath/U416  ( .A(\u_datapath/mult_shift_a [5]), .B(
        \u_datapath/mult_shift_b [0]), .Y(\u_datapath/n142 ) );
  AOI22X1 \u_datapath/U415  ( .A(\u_datapath/n371 ), .B(mult_product_debug[5]), 
        .C(\u_datapath/N310 ), .D(n61), .Y(\u_datapath/n376 ) );
  OAI21X1 \u_datapath/U414  ( .A(\u_datapath/n369 ), .B(\u_datapath/n142 ), 
        .C(\u_datapath/n376 ), .Y(\u_datapath/n375 ) );
  NAND2X1 \u_datapath/U413  ( .A(\u_datapath/mult_shift_a [6]), .B(
        \u_datapath/mult_shift_b [0]), .Y(\u_datapath/n141 ) );
  AOI22X1 \u_datapath/U412  ( .A(\u_datapath/n371 ), .B(mult_product_debug[6]), 
        .C(\u_datapath/N311 ), .D(n61), .Y(\u_datapath/n374 ) );
  OAI21X1 \u_datapath/U411  ( .A(\u_datapath/n369 ), .B(\u_datapath/n141 ), 
        .C(\u_datapath/n374 ), .Y(\u_datapath/n373 ) );
  NAND2X1 \u_datapath/U410  ( .A(\u_datapath/mult_shift_b [0]), .B(
        \u_datapath/mult_shift_a [7]), .Y(\u_datapath/n140 ) );
  AOI22X1 \u_datapath/U409  ( .A(\u_datapath/n371 ), .B(mult_product_debug[7]), 
        .C(\u_datapath/N312 ), .D(n61), .Y(\u_datapath/n370 ) );
  OAI21X1 \u_datapath/U408  ( .A(\u_datapath/n369 ), .B(\u_datapath/n140 ), 
        .C(\u_datapath/n370 ), .Y(\u_datapath/n368 ) );
  NOR2X1 \u_datapath/U407  ( .A(\u_datapath/n367 ), .B(n121), .Y(
        \u_datapath/n233 ) );
  NAND2X1 \u_datapath/U406  ( .A(\u_datapath/n233 ), .B(n124), .Y(
        \u_datapath/n359 ) );
  NAND2X1 \u_datapath/U405  ( .A(w_range_enable), .B(n121), .Y(
        \u_datapath/n356 ) );
  AOI22X1 \u_datapath/U404  ( .A(\u_datapath/n357 ), .B(range_debug[0]), .C(
        \u_datapath/N327 ), .D(n119), .Y(\u_datapath/n366 ) );
  OAI21X1 \u_datapath/U403  ( .A(\u_datapath/n359 ), .B(n168), .C(
        \u_datapath/n366 ), .Y(\u_datapath/n365 ) );
  AOI22X1 \u_datapath/U402  ( .A(\u_datapath/n357 ), .B(range_debug[1]), .C(
        \u_datapath/N328 ), .D(n119), .Y(\u_datapath/n364 ) );
  OAI21X1 \u_datapath/U401  ( .A(\u_datapath/n359 ), .B(n167), .C(
        \u_datapath/n364 ), .Y(\u_datapath/n363 ) );
  AOI22X1 \u_datapath/U400  ( .A(\u_datapath/n357 ), .B(range_debug[2]), .C(
        \u_datapath/N329 ), .D(n119), .Y(\u_datapath/n362 ) );
  OAI21X1 \u_datapath/U399  ( .A(\u_datapath/n359 ), .B(n166), .C(
        \u_datapath/n362 ), .Y(\u_datapath/n361 ) );
  AOI22X1 \u_datapath/U398  ( .A(\u_datapath/n357 ), .B(range_debug[3]), .C(
        \u_datapath/N330 ), .D(n119), .Y(\u_datapath/n360 ) );
  OAI21X1 \u_datapath/U397  ( .A(\u_datapath/n359 ), .B(n165), .C(
        \u_datapath/n360 ), .Y(\u_datapath/n358 ) );
  NOR2X1 \u_datapath/U396  ( .A(\u_datapath/n356 ), .B(n63), .Y(
        \u_datapath/n352 ) );
  AOI22X1 \u_datapath/U395  ( .A(range_debug[4]), .B(\u_datapath/n351 ), .C(
        \u_datapath/N331 ), .D(\u_datapath/n352 ), .Y(\u_datapath/n355 ) );
  AOI22X1 \u_datapath/U394  ( .A(range_debug[5]), .B(\u_datapath/n351 ), .C(
        \u_datapath/N332 ), .D(\u_datapath/n352 ), .Y(\u_datapath/n354 ) );
  AOI22X1 \u_datapath/U393  ( .A(range_debug[6]), .B(\u_datapath/n351 ), .C(
        \u_datapath/N333 ), .D(\u_datapath/n352 ), .Y(\u_datapath/n353 ) );
  AOI22X1 \u_datapath/U392  ( .A(range_debug[7]), .B(\u_datapath/n351 ), .C(
        \u_datapath/N334 ), .D(\u_datapath/n352 ), .Y(\u_datapath/n350 ) );
  NOR2X1 \u_datapath/U391  ( .A(w_access_trig_enable), .B(n63), .Y(
        \u_datapath/n308 ) );
  OR2X1 \u_datapath/U390  ( .A(n63), .B(\u_datapath/lfsr_reg [2]), .Y(
        \u_datapath/N58 ) );
  OR2X1 \u_datapath/U389  ( .A(n63), .B(\u_datapath/lfsr_reg [4]), .Y(
        \u_datapath/N60 ) );
  XNOR2X1 \u_datapath/U388  ( .A(\u_datapath/lfsr_reg [5]), .B(
        \u_datapath/lfsr_reg [0]), .Y(\u_datapath/n349 ) );
  NOR2X1 \u_datapath/U387  ( .A(n63), .B(\u_datapath/n349 ), .Y(
        \u_datapath/N61 ) );
  XNOR2X1 \u_datapath/U386  ( .A(\u_datapath/lfsr_reg [6]), .B(
        \u_datapath/lfsr_reg [0]), .Y(\u_datapath/n348 ) );
  NAND2X1 \u_datapath/U385  ( .A(\u_datapath/n348 ), .B(n67), .Y(
        \u_datapath/N62 ) );
  XNOR2X1 \u_datapath/U384  ( .A(\u_datapath/lfsr_reg [7]), .B(
        \u_datapath/lfsr_reg [0]), .Y(\u_datapath/n347 ) );
  NOR2X1 \u_datapath/U383  ( .A(n63), .B(\u_datapath/n347 ), .Y(
        \u_datapath/N63 ) );
  OR2X1 \u_datapath/U382  ( .A(n63), .B(w_spin_store_enable), .Y(
        \u_datapath/n341 ) );
  NAND2X1 \u_datapath/U381  ( .A(ring_spin_cnt[3]), .B(\u_datapath/n343 ), .Y(
        \u_datapath/n346 ) );
  OAI21X1 \u_datapath/U380  ( .A(n225), .B(\u_datapath/n341 ), .C(
        \u_datapath/n346 ), .Y(\u_datapath/n458 ) );
  NAND2X1 \u_datapath/U379  ( .A(ring_spin_cnt[2]), .B(\u_datapath/n343 ), .Y(
        \u_datapath/n345 ) );
  OAI21X1 \u_datapath/U378  ( .A(n224), .B(\u_datapath/n341 ), .C(
        \u_datapath/n345 ), .Y(\u_datapath/n457 ) );
  NAND2X1 \u_datapath/U377  ( .A(ring_spin_cnt[1]), .B(\u_datapath/n343 ), .Y(
        \u_datapath/n344 ) );
  OAI21X1 \u_datapath/U376  ( .A(n223), .B(\u_datapath/n341 ), .C(
        \u_datapath/n344 ), .Y(\u_datapath/n456 ) );
  NAND2X1 \u_datapath/U375  ( .A(ring_spin_cnt[0]), .B(\u_datapath/n343 ), .Y(
        \u_datapath/n342 ) );
  OAI21X1 \u_datapath/U374  ( .A(n222), .B(\u_datapath/n341 ), .C(
        \u_datapath/n342 ), .Y(\u_datapath/n455 ) );
  OR2X1 \u_datapath/U373  ( .A(w_h_angle_store_enable), .B(restart), .Y(
        \u_datapath/n335 ) );
  NAND2X1 \u_datapath/U372  ( .A(ring_h_angle_cnt[3]), .B(\u_datapath/n337 ), 
        .Y(\u_datapath/n340 ) );
  OAI21X1 \u_datapath/U371  ( .A(n221), .B(\u_datapath/n335 ), .C(
        \u_datapath/n340 ), .Y(\u_datapath/n454 ) );
  NAND2X1 \u_datapath/U370  ( .A(ring_h_angle_cnt[2]), .B(\u_datapath/n337 ), 
        .Y(\u_datapath/n339 ) );
  OAI21X1 \u_datapath/U369  ( .A(n220), .B(\u_datapath/n335 ), .C(
        \u_datapath/n339 ), .Y(\u_datapath/n453 ) );
  NAND2X1 \u_datapath/U368  ( .A(ring_h_angle_cnt[1]), .B(\u_datapath/n337 ), 
        .Y(\u_datapath/n338 ) );
  OAI21X1 \u_datapath/U367  ( .A(n218), .B(\u_datapath/n335 ), .C(
        \u_datapath/n338 ), .Y(\u_datapath/n452 ) );
  NAND2X1 \u_datapath/U366  ( .A(ring_h_angle_cnt[0]), .B(\u_datapath/n337 ), 
        .Y(\u_datapath/n336 ) );
  OAI21X1 \u_datapath/U365  ( .A(n217), .B(\u_datapath/n335 ), .C(
        \u_datapath/n336 ), .Y(\u_datapath/n451 ) );
  NAND2X1 \u_datapath/U364  ( .A(\u_datapath/h_reg [3]), .B(n220), .Y(
        \u_datapath/n324 ) );
  NAND3X1 \u_datapath/U363  ( .A(\u_datapath/h_reg [1]), .B(n217), .C(n219), 
        .Y(\u_datapath/n315 ) );
  OAI21X1 \u_datapath/U362  ( .A(n221), .B(n220), .C(\u_datapath/n315 ), .Y(
        \u_datapath/n334 ) );
  OAI21X1 \u_datapath/U361  ( .A(n217), .B(\u_datapath/n324 ), .C(n215), .Y(
        \u_datapath/n328 ) );
  NOR2X1 \u_datapath/U360  ( .A(\u_datapath/h_reg [1]), .B(
        \u_datapath/h_reg [0]), .Y(\u_datapath/n331 ) );
  NAND2X1 \u_datapath/U359  ( .A(\u_datapath/n331 ), .B(n219), .Y(
        \u_datapath/n322 ) );
  OAI21X1 \u_datapath/U358  ( .A(\u_datapath/n331 ), .B(n220), .C(
        \u_datapath/n322 ), .Y(\u_datapath/n333 ) );
  NAND2X1 \u_datapath/U357  ( .A(n95), .B(n66), .Y(\u_datapath/n306 ) );
  OAI21X1 \u_datapath/U356  ( .A(\u_datapath/n328 ), .B(\u_datapath/n333 ), 
        .C(n76), .Y(\u_datapath/n332 ) );
  OAI21X1 \u_datapath/U355  ( .A(n95), .B(n211), .C(\u_datapath/n332 ), .Y(
        \u_datapath/n450 ) );
  NAND2X1 \u_datapath/U354  ( .A(\u_datapath/h_reg [0]), .B(n220), .Y(
        \u_datapath/n330 ) );
  NAND2X1 \u_datapath/U353  ( .A(\u_datapath/n331 ), .B(\u_datapath/h_reg [2]), 
        .Y(\u_datapath/n326 ) );
  OAI21X1 \u_datapath/U352  ( .A(n218), .B(\u_datapath/n330 ), .C(
        \u_datapath/n326 ), .Y(\u_datapath/n329 ) );
  OAI21X1 \u_datapath/U351  ( .A(\u_datapath/n328 ), .B(\u_datapath/n329 ), 
        .C(n76), .Y(\u_datapath/n327 ) );
  OAI21X1 \u_datapath/U350  ( .A(n95), .B(n210), .C(\u_datapath/n327 ), .Y(
        \u_datapath/n449 ) );
  NAND2X1 \u_datapath/U349  ( .A(\u_datapath/h_reg [1]), .B(
        \u_datapath/h_reg [0]), .Y(\u_datapath/n325 ) );
  OAI21X1 \u_datapath/U348  ( .A(\u_datapath/n324 ), .B(\u_datapath/n325 ), 
        .C(\u_datapath/n326 ), .Y(\u_datapath/n318 ) );
  XOR2X1 \u_datapath/U347  ( .A(\u_datapath/h_reg [1]), .B(
        \u_datapath/h_reg [0]), .Y(\u_datapath/n323 ) );
  NOR2X1 \u_datapath/U346  ( .A(n220), .B(n217), .Y(\u_datapath/n316 ) );
  AOI22X1 \u_datapath/U345  ( .A(\u_datapath/n323 ), .B(n220), .C(
        \u_datapath/n316 ), .D(\u_datapath/h_reg [1]), .Y(\u_datapath/n320 )
         );
  AOI21X1 \u_datapath/U344  ( .A(\u_datapath/h_reg [2]), .B(
        \u_datapath/h_reg [1]), .C(\u_datapath/n316 ), .Y(\u_datapath/n321 )
         );
  OAI21X1 \u_datapath/U343  ( .A(\u_datapath/n321 ), .B(n221), .C(
        \u_datapath/n322 ), .Y(\u_datapath/n312 ) );
  OAI21X1 \u_datapath/U342  ( .A(\u_datapath/h_reg [3]), .B(\u_datapath/n320 ), 
        .C(n216), .Y(\u_datapath/n319 ) );
  OAI21X1 \u_datapath/U341  ( .A(\u_datapath/n318 ), .B(\u_datapath/n319 ), 
        .C(n76), .Y(\u_datapath/n317 ) );
  OAI21X1 \u_datapath/U340  ( .A(n95), .B(n209), .C(\u_datapath/n317 ), .Y(
        \u_datapath/n448 ) );
  OR2X1 \u_datapath/U339  ( .A(\u_datapath/n316 ), .B(\u_datapath/h_reg [3]), 
        .Y(\u_datapath/n314 ) );
  OAI21X1 \u_datapath/U338  ( .A(n218), .B(\u_datapath/n314 ), .C(
        \u_datapath/n315 ), .Y(\u_datapath/n313 ) );
  OAI21X1 \u_datapath/U337  ( .A(\u_datapath/n312 ), .B(\u_datapath/n313 ), 
        .C(n76), .Y(\u_datapath/n311 ) );
  OAI21X1 \u_datapath/U336  ( .A(n95), .B(n208), .C(\u_datapath/n311 ), .Y(
        \u_datapath/n447 ) );
  NAND2X1 \u_datapath/U335  ( .A(\u_datapath/spin_adj [2]), .B(
        \u_datapath/n308 ), .Y(\u_datapath/n310 ) );
  OAI21X1 \u_datapath/U334  ( .A(n225), .B(\u_datapath/n306 ), .C(
        \u_datapath/n310 ), .Y(\u_datapath/n446 ) );
  NAND2X1 \u_datapath/U333  ( .A(\u_datapath/spin_adj [1]), .B(
        \u_datapath/n308 ), .Y(\u_datapath/n309 ) );
  OAI21X1 \u_datapath/U332  ( .A(n224), .B(\u_datapath/n306 ), .C(
        \u_datapath/n309 ), .Y(\u_datapath/n445 ) );
  NAND2X1 \u_datapath/U331  ( .A(\u_datapath/spin_adj [0]), .B(
        \u_datapath/n308 ), .Y(\u_datapath/n307 ) );
  OAI21X1 \u_datapath/U330  ( .A(n223), .B(\u_datapath/n306 ), .C(
        \u_datapath/n307 ), .Y(\u_datapath/n444 ) );
  OR2X1 \u_datapath/U329  ( .A(restart), .B(w_v_angle_store_enable), .Y(
        \u_datapath/n300 ) );
  NAND2X1 \u_datapath/U328  ( .A(ring_v_angle_cnt[3]), .B(\u_datapath/n302 ), 
        .Y(\u_datapath/n305 ) );
  OAI21X1 \u_datapath/U327  ( .A(n207), .B(\u_datapath/n300 ), .C(
        \u_datapath/n305 ), .Y(\u_datapath/n443 ) );
  NAND2X1 \u_datapath/U326  ( .A(ring_v_angle_cnt[2]), .B(\u_datapath/n302 ), 
        .Y(\u_datapath/n304 ) );
  OAI21X1 \u_datapath/U325  ( .A(n206), .B(\u_datapath/n300 ), .C(
        \u_datapath/n304 ), .Y(\u_datapath/n442 ) );
  NAND2X1 \u_datapath/U324  ( .A(ring_v_angle_cnt[1]), .B(\u_datapath/n302 ), 
        .Y(\u_datapath/n303 ) );
  OAI21X1 \u_datapath/U323  ( .A(n204), .B(\u_datapath/n300 ), .C(
        \u_datapath/n303 ), .Y(\u_datapath/n441 ) );
  NAND2X1 \u_datapath/U322  ( .A(ring_v_angle_cnt[0]), .B(\u_datapath/n302 ), 
        .Y(\u_datapath/n301 ) );
  OAI21X1 \u_datapath/U321  ( .A(n203), .B(\u_datapath/n300 ), .C(
        \u_datapath/n301 ), .Y(\u_datapath/n440 ) );
  NOR2X1 \u_datapath/U320  ( .A(n206), .B(n203), .Y(\u_datapath/n294 ) );
  AOI21X1 \u_datapath/U319  ( .A(\u_datapath/v_reg [2]), .B(
        \u_datapath/v_reg [1]), .C(\u_datapath/n294 ), .Y(\u_datapath/n299 )
         );
  NOR2X1 \u_datapath/U318  ( .A(\u_datapath/v_reg [1]), .B(
        \u_datapath/v_reg [0]), .Y(\u_datapath/n279 ) );
  NAND2X1 \u_datapath/U317  ( .A(\u_datapath/v_reg [3]), .B(n206), .Y(
        \u_datapath/n285 ) );
  NAND2X1 \u_datapath/U316  ( .A(\u_datapath/n279 ), .B(n205), .Y(
        \u_datapath/n280 ) );
  OAI21X1 \u_datapath/U315  ( .A(\u_datapath/n299 ), .B(n207), .C(
        \u_datapath/n280 ), .Y(\u_datapath/n292 ) );
  OR2X1 \u_datapath/U314  ( .A(\u_datapath/n294 ), .B(\u_datapath/v_reg [3]), 
        .Y(\u_datapath/n298 ) );
  NAND3X1 \u_datapath/U313  ( .A(\u_datapath/v_reg [1]), .B(n203), .C(n205), 
        .Y(\u_datapath/n287 ) );
  OAI21X1 \u_datapath/U312  ( .A(n204), .B(\u_datapath/n298 ), .C(
        \u_datapath/n287 ), .Y(\u_datapath/n297 ) );
  OAI21X1 \u_datapath/U311  ( .A(\u_datapath/n292 ), .B(\u_datapath/n297 ), 
        .C(n76), .Y(\u_datapath/n296 ) );
  OAI21X1 \u_datapath/U310  ( .A(n95), .B(n199), .C(\u_datapath/n296 ), .Y(
        \u_datapath/n439 ) );
  NAND2X1 \u_datapath/U309  ( .A(\u_datapath/v_reg [1]), .B(
        \u_datapath/v_reg [0]), .Y(\u_datapath/n295 ) );
  NAND2X1 \u_datapath/U308  ( .A(\u_datapath/n279 ), .B(\u_datapath/v_reg [2]), 
        .Y(\u_datapath/n284 ) );
  OAI21X1 \u_datapath/U307  ( .A(\u_datapath/n285 ), .B(\u_datapath/n295 ), 
        .C(\u_datapath/n284 ), .Y(\u_datapath/n289 ) );
  XOR2X1 \u_datapath/U306  ( .A(\u_datapath/v_reg [1]), .B(
        \u_datapath/v_reg [0]), .Y(\u_datapath/n293 ) );
  AOI22X1 \u_datapath/U305  ( .A(\u_datapath/n293 ), .B(n206), .C(
        \u_datapath/n294 ), .D(\u_datapath/v_reg [1]), .Y(\u_datapath/n291 )
         );
  OAI21X1 \u_datapath/U304  ( .A(\u_datapath/v_reg [3]), .B(\u_datapath/n291 ), 
        .C(n201), .Y(\u_datapath/n290 ) );
  OAI21X1 \u_datapath/U303  ( .A(\u_datapath/n289 ), .B(\u_datapath/n290 ), 
        .C(n76), .Y(\u_datapath/n288 ) );
  OAI21X1 \u_datapath/U302  ( .A(n95), .B(n200), .C(\u_datapath/n288 ), .Y(
        \u_datapath/n438 ) );
  OAI21X1 \u_datapath/U301  ( .A(n207), .B(n206), .C(\u_datapath/n287 ), .Y(
        \u_datapath/n286 ) );
  OAI21X1 \u_datapath/U300  ( .A(n203), .B(\u_datapath/n285 ), .C(n202), .Y(
        \u_datapath/n277 ) );
  NAND2X1 \u_datapath/U299  ( .A(\u_datapath/v_reg [0]), .B(n206), .Y(
        \u_datapath/n283 ) );
  OAI21X1 \u_datapath/U298  ( .A(n204), .B(\u_datapath/n283 ), .C(
        \u_datapath/n284 ), .Y(\u_datapath/n282 ) );
  OAI21X1 \u_datapath/U297  ( .A(\u_datapath/n277 ), .B(\u_datapath/n282 ), 
        .C(n76), .Y(\u_datapath/n281 ) );
  OAI21X1 \u_datapath/U296  ( .A(n95), .B(n197), .C(\u_datapath/n281 ), .Y(
        \u_datapath/n437 ) );
  OAI21X1 \u_datapath/U295  ( .A(\u_datapath/n279 ), .B(n206), .C(
        \u_datapath/n280 ), .Y(\u_datapath/n278 ) );
  OAI21X1 \u_datapath/U294  ( .A(\u_datapath/n277 ), .B(\u_datapath/n278 ), 
        .C(n76), .Y(\u_datapath/n276 ) );
  OAI21X1 \u_datapath/U293  ( .A(n95), .B(n198), .C(\u_datapath/n276 ), .Y(
        \u_datapath/n436 ) );
  OR2X1 \u_datapath/U292  ( .A(n63), .B(w_strike_store_enable), .Y(
        \u_datapath/n270 ) );
  NAND2X1 \u_datapath/U291  ( .A(ring_power_cnt[3]), .B(\u_datapath/n272 ), 
        .Y(\u_datapath/n275 ) );
  OAI21X1 \u_datapath/U290  ( .A(n196), .B(\u_datapath/n270 ), .C(
        \u_datapath/n275 ), .Y(\u_datapath/n435 ) );
  NAND2X1 \u_datapath/U289  ( .A(ring_power_cnt[2]), .B(\u_datapath/n272 ), 
        .Y(\u_datapath/n274 ) );
  OAI21X1 \u_datapath/U288  ( .A(n195), .B(\u_datapath/n270 ), .C(
        \u_datapath/n274 ), .Y(\u_datapath/n434 ) );
  NAND2X1 \u_datapath/U287  ( .A(ring_power_cnt[1]), .B(\u_datapath/n272 ), 
        .Y(\u_datapath/n273 ) );
  OAI21X1 \u_datapath/U286  ( .A(n194), .B(\u_datapath/n270 ), .C(
        \u_datapath/n273 ), .Y(\u_datapath/n433 ) );
  NAND2X1 \u_datapath/U285  ( .A(ring_power_cnt[0]), .B(\u_datapath/n272 ), 
        .Y(\u_datapath/n271 ) );
  OAI21X1 \u_datapath/U284  ( .A(n193), .B(\u_datapath/n270 ), .C(
        \u_datapath/n271 ), .Y(\u_datapath/n432 ) );
  AOI21X1 \u_datapath/U283  ( .A(\u_datapath/n268 ), .B(\u_datapath/n269 ), 
        .C(n63), .Y(\u_datapath/n196 ) );
  AOI22X1 \u_datapath/U282  ( .A(\u_datapath/mult_shift_b [1]), .B(n45), .C(
        n60), .D(\u_datapath/mult_shift_b [0]), .Y(\u_datapath/n263 ) );
  NOR2X1 \u_datapath/U281  ( .A(\u_datapath/n267 ), .B(n63), .Y(
        \u_datapath/n266 ) );
  NOR2X1 \u_datapath/U280  ( .A(n125), .B(n124), .Y(\u_datapath/n232 ) );
  NAND2X1 \u_datapath/U279  ( .A(\u_datapath/n232 ), .B(\u_datapath/n266 ), 
        .Y(\u_datapath/n205 ) );
  NAND2X1 \u_datapath/U278  ( .A(\u_datapath/power_reg [0]), .B(
        \u_datapath/n256 ), .Y(\u_datapath/n217 ) );
  OAI21X1 \u_datapath/U277  ( .A(\u_datapath/n205 ), .B(n208), .C(
        \u_datapath/n217 ), .Y(\u_datapath/n265 ) );
  AOI21X1 \u_datapath/U276  ( .A(\u_datapath/trig_v [0]), .B(\u_datapath/n203 ), .C(\u_datapath/n265 ), .Y(\u_datapath/n264 ) );
  NAND2X1 \u_datapath/U275  ( .A(\u_datapath/n263 ), .B(\u_datapath/n264 ), 
        .Y(\u_datapath/n431 ) );
  AOI22X1 \u_datapath/U274  ( .A(\u_datapath/mult_shift_b [2]), .B(n45), .C(
        \u_datapath/mult_shift_b [1]), .D(n60), .Y(\u_datapath/n260 ) );
  NAND2X1 \u_datapath/U273  ( .A(\u_datapath/power_reg [1]), .B(
        \u_datapath/n256 ), .Y(\u_datapath/n214 ) );
  OAI21X1 \u_datapath/U272  ( .A(\u_datapath/n205 ), .B(n209), .C(
        \u_datapath/n214 ), .Y(\u_datapath/n262 ) );
  AOI21X1 \u_datapath/U271  ( .A(\u_datapath/trig_v [1]), .B(\u_datapath/n203 ), .C(\u_datapath/n262 ), .Y(\u_datapath/n261 ) );
  NAND2X1 \u_datapath/U270  ( .A(\u_datapath/n260 ), .B(\u_datapath/n261 ), 
        .Y(\u_datapath/n430 ) );
  AOI22X1 \u_datapath/U269  ( .A(\u_datapath/mult_shift_b [3]), .B(n45), .C(
        \u_datapath/mult_shift_b [2]), .D(\u_datapath/n196 ), .Y(
        \u_datapath/n257 ) );
  NAND2X1 \u_datapath/U268  ( .A(\u_datapath/power_reg [2]), .B(
        \u_datapath/n256 ), .Y(\u_datapath/n210 ) );
  OAI21X1 \u_datapath/U267  ( .A(\u_datapath/n205 ), .B(n210), .C(
        \u_datapath/n210 ), .Y(\u_datapath/n259 ) );
  AOI21X1 \u_datapath/U266  ( .A(\u_datapath/trig_v [2]), .B(\u_datapath/n203 ), .C(\u_datapath/n259 ), .Y(\u_datapath/n258 ) );
  NAND2X1 \u_datapath/U265  ( .A(\u_datapath/n257 ), .B(\u_datapath/n258 ), 
        .Y(\u_datapath/n429 ) );
  NAND2X1 \u_datapath/U264  ( .A(\u_datapath/power_reg [3]), .B(
        \u_datapath/n256 ), .Y(\u_datapath/n206 ) );
  OAI21X1 \u_datapath/U263  ( .A(\u_datapath/n205 ), .B(n211), .C(
        \u_datapath/n206 ), .Y(\u_datapath/n255 ) );
  AOI22X1 \u_datapath/U262  ( .A(\u_datapath/n196 ), .B(
        \u_datapath/mult_shift_b [3]), .C(\u_datapath/n203 ), .D(
        \u_datapath/trig_v [3]), .Y(\u_datapath/n254 ) );
  NAND2X1 \u_datapath/U261  ( .A(n97), .B(\u_datapath/n254 ), .Y(
        \u_datapath/n428 ) );
  XOR2X1 \u_datapath/U259  ( .A(\u_datapath/v_reg [3]), .B(
        \u_datapath/power_reg [3]), .Y(\u_datapath/n253 ) );
  XNOR2X1 \u_datapath/U258  ( .A(\u_datapath/lfsr_reg [3]), .B(
        \u_datapath/n253 ), .Y(\u_datapath/n252 ) );
  NAND2X1 \u_datapath/U257  ( .A(\u_datapath/n236 ), .B(n66), .Y(
        \u_datapath/n238 ) );
  OAI22X1 \u_datapath/U256  ( .A(n192), .B(\u_datapath/n236 ), .C(
        \u_datapath/n252 ), .D(\u_datapath/n238 ), .Y(\u_datapath/n427 ) );
  XOR2X1 \u_datapath/U255  ( .A(\u_datapath/v_reg [2]), .B(
        \u_datapath/power_reg [2]), .Y(\u_datapath/n251 ) );
  XNOR2X1 \u_datapath/U254  ( .A(\u_datapath/lfsr_reg [2]), .B(
        \u_datapath/n251 ), .Y(\u_datapath/n250 ) );
  OAI22X1 \u_datapath/U253  ( .A(n191), .B(\u_datapath/n236 ), .C(
        \u_datapath/n250 ), .D(\u_datapath/n238 ), .Y(\u_datapath/n426 ) );
  XOR2X1 \u_datapath/U252  ( .A(\u_datapath/v_reg [1]), .B(
        \u_datapath/power_reg [1]), .Y(\u_datapath/n249 ) );
  XNOR2X1 \u_datapath/U251  ( .A(\u_datapath/lfsr_reg [1]), .B(
        \u_datapath/n249 ), .Y(\u_datapath/n248 ) );
  OAI22X1 \u_datapath/U250  ( .A(n190), .B(\u_datapath/n236 ), .C(
        \u_datapath/n248 ), .D(\u_datapath/n238 ), .Y(\u_datapath/n425 ) );
  XOR2X1 \u_datapath/U249  ( .A(\u_datapath/v_reg [0]), .B(
        \u_datapath/power_reg [0]), .Y(\u_datapath/n247 ) );
  XNOR2X1 \u_datapath/U248  ( .A(\u_datapath/lfsr_reg [0]), .B(
        \u_datapath/n247 ), .Y(\u_datapath/n246 ) );
  OAI22X1 \u_datapath/U247  ( .A(n189), .B(\u_datapath/n236 ), .C(
        \u_datapath/n246 ), .D(\u_datapath/n238 ), .Y(\u_datapath/n424 ) );
  XOR2X1 \u_datapath/U246  ( .A(\u_datapath/spin_reg [3]), .B(
        \u_datapath/lfsr_reg [7]), .Y(\u_datapath/n245 ) );
  XOR2X1 \u_datapath/U245  ( .A(n221), .B(\u_datapath/n245 ), .Y(
        \u_datapath/n244 ) );
  OAI22X1 \u_datapath/U244  ( .A(n188), .B(\u_datapath/n236 ), .C(
        \u_datapath/n244 ), .D(\u_datapath/n238 ), .Y(\u_datapath/n423 ) );
  XOR2X1 \u_datapath/U243  ( .A(\u_datapath/lfsr_reg [6]), .B(n224), .Y(
        \u_datapath/n243 ) );
  XOR2X1 \u_datapath/U242  ( .A(\u_datapath/n243 ), .B(\u_datapath/h_reg [2]), 
        .Y(\u_datapath/n242 ) );
  OAI22X1 \u_datapath/U241  ( .A(n187), .B(\u_datapath/n236 ), .C(
        \u_datapath/n242 ), .D(\u_datapath/n238 ), .Y(\u_datapath/n422 ) );
  XOR2X1 \u_datapath/U240  ( .A(\u_datapath/lfsr_reg [5]), .B(n223), .Y(
        \u_datapath/n241 ) );
  XOR2X1 \u_datapath/U239  ( .A(\u_datapath/n241 ), .B(\u_datapath/h_reg [1]), 
        .Y(\u_datapath/n240 ) );
  OAI22X1 \u_datapath/U238  ( .A(n186), .B(\u_datapath/n236 ), .C(
        \u_datapath/n240 ), .D(\u_datapath/n238 ), .Y(\u_datapath/n421 ) );
  XOR2X1 \u_datapath/U237  ( .A(\u_datapath/lfsr_reg [4]), .B(n222), .Y(
        \u_datapath/n239 ) );
  XOR2X1 \u_datapath/U236  ( .A(\u_datapath/n239 ), .B(\u_datapath/h_reg [0]), 
        .Y(\u_datapath/n237 ) );
  OAI22X1 \u_datapath/U235  ( .A(n185), .B(\u_datapath/n236 ), .C(
        \u_datapath/n237 ), .D(\u_datapath/n238 ), .Y(\u_datapath/n420 ) );
  OAI21X1 \u_datapath/U234  ( .A(w_multiplication_select[1]), .B(n120), .C(n67), .Y(\u_datapath/n234 ) );
  NAND2X1 \u_datapath/U233  ( .A(\u_datapath/n234 ), .B(n67), .Y(
        \u_datapath/n235 ) );
  OAI22X1 \u_datapath/U232  ( .A(n183), .B(\u_datapath/n234 ), .C(
        \u_datapath/n235 ), .D(n184), .Y(\u_datapath/n419 ) );
  OAI22X1 \u_datapath/U231  ( .A(n173), .B(\u_datapath/n234 ), .C(
        \u_datapath/n235 ), .D(n174), .Y(\u_datapath/n418 ) );
  OAI22X1 \u_datapath/U230  ( .A(n171), .B(\u_datapath/n234 ), .C(
        \u_datapath/n235 ), .D(n172), .Y(\u_datapath/n417 ) );
  OAI22X1 \u_datapath/U229  ( .A(n169), .B(\u_datapath/n234 ), .C(
        \u_datapath/n235 ), .D(n170), .Y(\u_datapath/n416 ) );
  AOI21X1 \u_datapath/U228  ( .A(\u_datapath/n232 ), .B(\u_datapath/n233 ), 
        .C(n63), .Y(\u_datapath/n220 ) );
  NOR2X1 \u_datapath/U227  ( .A(\u_datapath/n220 ), .B(n63), .Y(
        \u_datapath/n219 ) );
  NAND2X1 \u_datapath/U226  ( .A(\u_datapath/N345 ), .B(\u_datapath/n219 ), 
        .Y(\u_datapath/n231 ) );
  OAI21X1 \u_datapath/U225  ( .A(n163), .B(n98), .C(\u_datapath/n231 ), .Y(
        \u_datapath/n415 ) );
  NAND2X1 \u_datapath/U224  ( .A(\u_datapath/N346 ), .B(\u_datapath/n219 ), 
        .Y(\u_datapath/n230 ) );
  OAI21X1 \u_datapath/U223  ( .A(n161), .B(n98), .C(\u_datapath/n230 ), .Y(
        \u_datapath/n414 ) );
  NAND2X1 \u_datapath/U222  ( .A(\u_datapath/N347 ), .B(\u_datapath/n219 ), 
        .Y(\u_datapath/n229 ) );
  OAI21X1 \u_datapath/U221  ( .A(n160), .B(n98), .C(\u_datapath/n229 ), .Y(
        \u_datapath/n413 ) );
  NAND2X1 \u_datapath/U220  ( .A(\u_datapath/N348 ), .B(\u_datapath/n219 ), 
        .Y(\u_datapath/n228 ) );
  OAI21X1 \u_datapath/U219  ( .A(n159), .B(n98), .C(\u_datapath/n228 ), .Y(
        \u_datapath/n412 ) );
  NOR2X1 \u_datapath/U218  ( .A(w_collision_check_enable), .B(n63), .Y(
        \u_datapath/n191 ) );
  NAND2X1 \u_datapath/U216  ( .A(ball_x[0]), .B(\u_datapath/n191 ), .Y(
        \u_datapath/n227 ) );
  OAI21X1 \u_datapath/U215  ( .A(n163), .B(n58), .C(\u_datapath/n227 ), .Y(
        \u_datapath/n411 ) );
  NAND2X1 \u_datapath/U214  ( .A(ball_x[1]), .B(\u_datapath/n191 ), .Y(
        \u_datapath/n226 ) );
  OAI21X1 \u_datapath/U213  ( .A(n161), .B(n58), .C(\u_datapath/n226 ), .Y(
        \u_datapath/n410 ) );
  NAND2X1 \u_datapath/U212  ( .A(ball_x[2]), .B(\u_datapath/n191 ), .Y(
        \u_datapath/n225 ) );
  OAI21X1 \u_datapath/U211  ( .A(n160), .B(n58), .C(\u_datapath/n225 ), .Y(
        \u_datapath/n409 ) );
  NAND2X1 \u_datapath/U210  ( .A(ball_x[3]), .B(\u_datapath/n191 ), .Y(
        \u_datapath/n224 ) );
  OAI21X1 \u_datapath/U209  ( .A(n159), .B(n58), .C(\u_datapath/n224 ), .Y(
        \u_datapath/n408 ) );
  AOI22X1 \u_datapath/U208  ( .A(\u_datapath/N349 ), .B(\u_datapath/n219 ), 
        .C(lateral_debug[4]), .D(\u_datapath/n220 ), .Y(\u_datapath/n223 ) );
  AOI22X1 \u_datapath/U207  ( .A(\u_datapath/N350 ), .B(\u_datapath/n219 ), 
        .C(lateral_debug[5]), .D(\u_datapath/n220 ), .Y(\u_datapath/n222 ) );
  AOI22X1 \u_datapath/U206  ( .A(\u_datapath/N351 ), .B(\u_datapath/n219 ), 
        .C(lateral_debug[6]), .D(\u_datapath/n220 ), .Y(\u_datapath/n221 ) );
  AOI22X1 \u_datapath/U205  ( .A(\u_datapath/N352 ), .B(\u_datapath/n219 ), 
        .C(lateral_debug[7]), .D(\u_datapath/n220 ), .Y(\u_datapath/n218 ) );
  OAI21X1 \u_datapath/U204  ( .A(n154), .B(\u_datapath/n205 ), .C(
        \u_datapath/n217 ), .Y(\u_datapath/n216 ) );
  AOI22X1 \u_datapath/U203  ( .A(\u_datapath/mult_shift_a [0]), .B(n60), .C(
        \u_datapath/n203 ), .D(\u_datapath/v_sq_reg [0]), .Y(\u_datapath/n215 ) );
  NAND2X1 \u_datapath/U202  ( .A(n96), .B(\u_datapath/n215 ), .Y(
        \u_datapath/n407 ) );
  AOI22X1 \u_datapath/U201  ( .A(n45), .B(\u_datapath/mult_shift_a [0]), .C(
        \u_datapath/n196 ), .D(\u_datapath/mult_shift_a [1]), .Y(
        \u_datapath/n211 ) );
  OAI21X1 \u_datapath/U200  ( .A(n152), .B(\u_datapath/n205 ), .C(
        \u_datapath/n214 ), .Y(\u_datapath/n213 ) );
  AOI21X1 \u_datapath/U199  ( .A(\u_datapath/v_sq_reg [1]), .B(
        \u_datapath/n203 ), .C(\u_datapath/n213 ), .Y(\u_datapath/n212 ) );
  NAND2X1 \u_datapath/U198  ( .A(\u_datapath/n211 ), .B(\u_datapath/n212 ), 
        .Y(\u_datapath/n406 ) );
  AOI22X1 \u_datapath/U197  ( .A(n45), .B(\u_datapath/mult_shift_a [1]), .C(
        n60), .D(\u_datapath/mult_shift_a [2]), .Y(\u_datapath/n207 ) );
  OAI21X1 \u_datapath/U196  ( .A(n151), .B(\u_datapath/n205 ), .C(
        \u_datapath/n210 ), .Y(\u_datapath/n209 ) );
  AOI21X1 \u_datapath/U195  ( .A(\u_datapath/v_sq_reg [2]), .B(
        \u_datapath/n203 ), .C(\u_datapath/n209 ), .Y(\u_datapath/n208 ) );
  NAND2X1 \u_datapath/U194  ( .A(\u_datapath/n207 ), .B(\u_datapath/n208 ), 
        .Y(\u_datapath/n405 ) );
  AOI22X1 \u_datapath/U193  ( .A(n45), .B(\u_datapath/mult_shift_a [2]), .C(
        \u_datapath/n196 ), .D(\u_datapath/mult_shift_a [3]), .Y(
        \u_datapath/n201 ) );
  OAI21X1 \u_datapath/U192  ( .A(n156), .B(\u_datapath/n205 ), .C(
        \u_datapath/n206 ), .Y(\u_datapath/n204 ) );
  AOI21X1 \u_datapath/U191  ( .A(\u_datapath/v_sq_reg [3]), .B(
        \u_datapath/n203 ), .C(\u_datapath/n204 ), .Y(\u_datapath/n202 ) );
  NAND2X1 \u_datapath/U190  ( .A(\u_datapath/n201 ), .B(\u_datapath/n202 ), 
        .Y(\u_datapath/n404 ) );
  AOI22X1 \u_datapath/U189  ( .A(\u_datapath/mult_shift_a [4]), .B(n60), .C(
        \u_datapath/mult_shift_a [3]), .D(n45), .Y(\u_datapath/n200 ) );
  AOI22X1 \u_datapath/U188  ( .A(\u_datapath/mult_shift_a [5]), .B(n60), .C(
        \u_datapath/mult_shift_a [4]), .D(n45), .Y(\u_datapath/n199 ) );
  AOI22X1 \u_datapath/U187  ( .A(\u_datapath/mult_shift_a [6]), .B(n60), .C(
        \u_datapath/mult_shift_a [5]), .D(n45), .Y(\u_datapath/n198 ) );
  AOI22X1 \u_datapath/U186  ( .A(\u_datapath/mult_shift_a [7]), .B(n60), .C(
        \u_datapath/mult_shift_a [6]), .D(n45), .Y(\u_datapath/n195 ) );
  NAND2X1 \u_datapath/U185  ( .A(ball_y[0]), .B(\u_datapath/n191 ), .Y(
        \u_datapath/n194 ) );
  OAI21X1 \u_datapath/U184  ( .A(n154), .B(n58), .C(\u_datapath/n194 ), .Y(
        \u_datapath/n403 ) );
  NAND2X1 \u_datapath/U183  ( .A(ball_y[1]), .B(\u_datapath/n191 ), .Y(
        \u_datapath/n193 ) );
  OAI21X1 \u_datapath/U182  ( .A(n152), .B(n58), .C(\u_datapath/n193 ), .Y(
        \u_datapath/n402 ) );
  NAND2X1 \u_datapath/U181  ( .A(ball_y[2]), .B(\u_datapath/n191 ), .Y(
        \u_datapath/n192 ) );
  OAI21X1 \u_datapath/U180  ( .A(n151), .B(n58), .C(\u_datapath/n192 ), .Y(
        \u_datapath/n401 ) );
  NAND2X1 \u_datapath/U179  ( .A(ball_y[3]), .B(\u_datapath/n191 ), .Y(
        \u_datapath/n190 ) );
  OAI21X1 \u_datapath/U178  ( .A(n156), .B(n58), .C(\u_datapath/n190 ), .Y(
        \u_datapath/n400 ) );
  NAND2X1 \u_datapath/U177  ( .A(range_debug[0]), .B(n185), .Y(
        \u_datapath/n188 ) );
  NOR2X1 \u_datapath/U176  ( .A(n185), .B(range_debug[0]), .Y(
        \u_datapath/n183 ) );
  XNOR2X1 \u_datapath/U175  ( .A(n186), .B(range_debug[1]), .Y(
        \u_datapath/n187 ) );
  XOR2X1 \u_datapath/U174  ( .A(keeper_y[2]), .B(n151), .Y(\u_datapath/n159 )
         );
  AOI22X1 \u_datapath/U173  ( .A(\u_datapath/n159 ), .B(n186), .C(
        range_debug[2]), .D(n187), .Y(\u_datapath/n189 ) );
  XNOR2X1 \u_datapath/U172  ( .A(n188), .B(range_debug[3]), .Y(
        \u_datapath/n169 ) );
  OAI22X1 \u_datapath/U171  ( .A(keeper_y[3]), .B(n156), .C(\u_datapath/n189 ), 
        .D(\u_datapath/n169 ), .Y(\u_datapath/n157 ) );
  OR2X1 \u_datapath/U170  ( .A(n150), .B(\u_datapath/n183 ), .Y(
        \u_datapath/n185 ) );
  NAND3X1 \u_datapath/U169  ( .A(\u_datapath/n187 ), .B(\u_datapath/n188 ), 
        .C(n150), .Y(\u_datapath/n186 ) );
  OAI21X1 \u_datapath/U168  ( .A(n153), .B(\u_datapath/n185 ), .C(
        \u_datapath/n186 ), .Y(\u_datapath/n184 ) );
  OAI21X1 \u_datapath/U167  ( .A(n155), .B(\u_datapath/n183 ), .C(
        \u_datapath/n184 ), .Y(\u_datapath/n170 ) );
  NAND2X1 \u_datapath/U166  ( .A(lateral_debug[0]), .B(n189), .Y(
        \u_datapath/n181 ) );
  NOR2X1 \u_datapath/U165  ( .A(n189), .B(lateral_debug[0]), .Y(
        \u_datapath/n176 ) );
  XNOR2X1 \u_datapath/U164  ( .A(n190), .B(lateral_debug[1]), .Y(
        \u_datapath/n180 ) );
  XOR2X1 \u_datapath/U163  ( .A(n191), .B(n160), .Y(\u_datapath/n164 ) );
  OAI22X1 \u_datapath/U162  ( .A(\u_datapath/n164 ), .B(keeper_x[1]), .C(n160), 
        .D(keeper_x[2]), .Y(\u_datapath/n182 ) );
  XOR2X1 \u_datapath/U161  ( .A(keeper_x[3]), .B(n159), .Y(\u_datapath/n165 )
         );
  AOI22X1 \u_datapath/U160  ( .A(n192), .B(lateral_debug[3]), .C(
        \u_datapath/n182 ), .D(\u_datapath/n165 ), .Y(\u_datapath/n162 ) );
  OR2X1 \u_datapath/U159  ( .A(\u_datapath/n162 ), .B(\u_datapath/n176 ), .Y(
        \u_datapath/n178 ) );
  NAND3X1 \u_datapath/U158  ( .A(\u_datapath/n180 ), .B(\u_datapath/n181 ), 
        .C(\u_datapath/n162 ), .Y(\u_datapath/n179 ) );
  OAI21X1 \u_datapath/U157  ( .A(n162), .B(\u_datapath/n178 ), .C(
        \u_datapath/n179 ), .Y(\u_datapath/n177 ) );
  OAI21X1 \u_datapath/U156  ( .A(n164), .B(\u_datapath/n176 ), .C(
        \u_datapath/n177 ), .Y(\u_datapath/n171 ) );
  NOR2X1 \u_datapath/U155  ( .A(n161), .B(keeper_x[1]), .Y(\u_datapath/n175 )
         );
  AOI21X1 \u_datapath/U154  ( .A(\u_datapath/n175 ), .B(n191), .C(
        \u_datapath/n165 ), .Y(\u_datapath/n173 ) );
  XOR2X1 \u_datapath/U153  ( .A(\u_datapath/n175 ), .B(\u_datapath/n164 ), .Y(
        \u_datapath/n174 ) );
  OAI21X1 \u_datapath/U152  ( .A(\u_datapath/n173 ), .B(\u_datapath/n174 ), 
        .C(\u_datapath/n162 ), .Y(\u_datapath/n172 ) );
  NAND3X1 \u_datapath/U151  ( .A(\u_datapath/n170 ), .B(\u_datapath/n171 ), 
        .C(\u_datapath/n172 ), .Y(\u_datapath/n149 ) );
  NOR2X1 \u_datapath/U150  ( .A(n152), .B(keeper_y[1]), .Y(\u_datapath/n168 )
         );
  AOI21X1 \u_datapath/U149  ( .A(\u_datapath/n168 ), .B(n187), .C(n157), .Y(
        \u_datapath/n166 ) );
  XNOR2X1 \u_datapath/U148  ( .A(\u_datapath/n168 ), .B(\u_datapath/n159 ), 
        .Y(\u_datapath/n167 ) );
  OAI21X1 \u_datapath/U147  ( .A(\u_datapath/n166 ), .B(\u_datapath/n167 ), 
        .C(n150), .Y(\u_datapath/n152 ) );
  NOR2X1 \u_datapath/U146  ( .A(n190), .B(lateral_debug[1]), .Y(
        \u_datapath/n163 ) );
  AOI21X1 \u_datapath/U145  ( .A(\u_datapath/n163 ), .B(keeper_x[2]), .C(
        \u_datapath/n165 ), .Y(\u_datapath/n160 ) );
  XOR2X1 \u_datapath/U144  ( .A(\u_datapath/n163 ), .B(\u_datapath/n164 ), .Y(
        \u_datapath/n161 ) );
  OAI21X1 \u_datapath/U143  ( .A(\u_datapath/n160 ), .B(\u_datapath/n161 ), 
        .C(n158), .Y(\u_datapath/n153 ) );
  NOR2X1 \u_datapath/U142  ( .A(n186), .B(range_debug[1]), .Y(
        \u_datapath/n158 ) );
  AOI21X1 \u_datapath/U141  ( .A(\u_datapath/n158 ), .B(keeper_y[2]), .C(n157), 
        .Y(\u_datapath/n155 ) );
  XNOR2X1 \u_datapath/U140  ( .A(\u_datapath/n158 ), .B(\u_datapath/n159 ), 
        .Y(\u_datapath/n156 ) );
  OAI21X1 \u_datapath/U139  ( .A(\u_datapath/n155 ), .B(\u_datapath/n156 ), 
        .C(\u_datapath/n157 ), .Y(\u_datapath/n154 ) );
  NAND3X1 \u_datapath/U138  ( .A(\u_datapath/n152 ), .B(\u_datapath/n153 ), 
        .C(\u_datapath/n154 ), .Y(\u_datapath/n150 ) );
  OAI21X1 \u_datapath/U137  ( .A(\u_datapath/n149 ), .B(\u_datapath/n150 ), 
        .C(n46), .Y(\u_datapath/n148 ) );
  OAI21X1 \u_datapath/U136  ( .A(n103), .B(n149), .C(\u_datapath/n148 ), .Y(
        \u_datapath/n399 ) );
  AND2X2 \u_datapath/U30  ( .A(\u_datapath/n269 ), .B(\u_datapath/n367 ), .Y(
        \u_datapath/n398 ) );
  AND2X2 \u_datapath/U29  ( .A(\u_datapath/n385 ), .B(n68), .Y(
        \u_datapath/N397 ) );
  AND2X2 \u_datapath/U28  ( .A(\u_datapath/n383 ), .B(n68), .Y(
        \u_datapath/N398 ) );
  AND2X2 \u_datapath/U27  ( .A(\u_datapath/n381 ), .B(n69), .Y(
        \u_datapath/N399 ) );
  AND2X2 \u_datapath/U26  ( .A(\u_datapath/n379 ), .B(n68), .Y(
        \u_datapath/N400 ) );
  AND2X2 \u_datapath/U25  ( .A(\u_datapath/n377 ), .B(n68), .Y(
        \u_datapath/N401 ) );
  AND2X2 \u_datapath/U24  ( .A(\u_datapath/n375 ), .B(n68), .Y(
        \u_datapath/N402 ) );
  AND2X2 \u_datapath/U20  ( .A(\u_datapath/n373 ), .B(n68), .Y(
        \u_datapath/N403 ) );
  AND2X2 \u_datapath/U19  ( .A(\u_datapath/n368 ), .B(n68), .Y(
        \u_datapath/N404 ) );
  AND2X2 \u_datapath/U18  ( .A(\u_datapath/n356 ), .B(\u_datapath/n359 ), .Y(
        \u_datapath/n357 ) );
  AND2X2 \u_datapath/U17  ( .A(\u_datapath/n365 ), .B(n68), .Y(
        \u_datapath/N409 ) );
  AND2X2 \u_datapath/U16  ( .A(\u_datapath/n363 ), .B(n68), .Y(
        \u_datapath/N410 ) );
  AND2X2 \u_datapath/U15  ( .A(\u_datapath/n361 ), .B(n69), .Y(
        \u_datapath/N411 ) );
  AND2X2 \u_datapath/U14  ( .A(\u_datapath/n358 ), .B(n69), .Y(
        \u_datapath/N412 ) );
  AND2X2 \u_datapath/U13  ( .A(\u_datapath/n357 ), .B(n69), .Y(
        \u_datapath/n351 ) );
  AND2X2 \u_datapath/U12  ( .A(w_display_enable), .B(n68), .Y(
        \u_datapath/N442 ) );
  AND2X2 \u_datapath/U11  ( .A(n66), .B(\u_datapath/lfsr_reg [1]), .Y(
        \u_datapath/N57 ) );
  AND2X2 \u_datapath/U10  ( .A(n64), .B(\u_datapath/lfsr_reg [3]), .Y(
        \u_datapath/N59 ) );
  AND2X2 \u_datapath/U9  ( .A(\u_datapath/n341 ), .B(n69), .Y(
        \u_datapath/n343 ) );
  AND2X2 \u_datapath/U8  ( .A(\u_datapath/n335 ), .B(n69), .Y(
        \u_datapath/n337 ) );
  AND2X2 \u_datapath/U7  ( .A(\u_datapath/n300 ), .B(n69), .Y(
        \u_datapath/n302 ) );
  AND2X2 \u_datapath/U6  ( .A(\u_datapath/n270 ), .B(n69), .Y(
        \u_datapath/n272 ) );
  AND2X2 \u_datapath/U5  ( .A(\u_datapath/n266 ), .B(n124), .Y(
        \u_datapath/n203 ) );
  AND2X2 \u_datapath/U4  ( .A(\u_datapath/n266 ), .B(n125), .Y(
        \u_datapath/n256 ) );
  DFFNEGX1 \u_datapath/goal_flag_reg  ( .D(\u_datapath/n399 ), .CLK(n74), .Q(
        win_loss) );
  DFFNEGX1 \u_datapath/ball_y_reg[3]  ( .D(\u_datapath/n400 ), .CLK(n74), .Q(
        ball_y[3]) );
  DFFNEGX1 \u_datapath/range_reg_reg[7]  ( .D(n80), .CLK(n74), .Q(
        range_debug[7]) );
  DFFNEGX1 \u_datapath/range_reg_reg[6]  ( .D(n79), .CLK(n74), .Q(
        range_debug[6]) );
  DFFNEGX1 \u_datapath/range_reg_reg[5]  ( .D(n78), .CLK(n74), .Q(
        range_debug[5]) );
  DFFNEGX1 \u_datapath/range_reg_reg[4]  ( .D(n77), .CLK(n74), .Q(
        range_debug[4]) );
  DFFNEGX1 \u_datapath/ball_y_reg[2]  ( .D(\u_datapath/n401 ), .CLK(n74), .Q(
        ball_y[2]) );
  DFFNEGX1 \u_datapath/range_reg_reg[2]  ( .D(\u_datapath/N411 ), .CLK(n73), 
        .Q(range_debug[2]) );
  DFFNEGX1 \u_datapath/ball_y_reg[1]  ( .D(\u_datapath/n402 ), .CLK(n73), .Q(
        ball_y[1]) );
  DFFNEGX1 \u_datapath/range_reg_reg[1]  ( .D(\u_datapath/N410 ), .CLK(n73), 
        .Q(range_debug[1]) );
  DFFNEGX1 \u_datapath/ball_y_reg[0]  ( .D(\u_datapath/n403 ), .CLK(n73), .Q(
        ball_y[0]) );
  DFFNEGX1 \u_datapath/range_reg_reg[0]  ( .D(\u_datapath/N409 ), .CLK(n73), 
        .Q(range_debug[0]) );
  DFFNEGX1 \u_datapath/range_reg_reg[3]  ( .D(\u_datapath/N412 ), .CLK(n73), 
        .Q(range_debug[3]) );
  DFFNEGX1 \u_datapath/lateral_reg_reg[7]  ( .D(n102), .CLK(n73), .Q(
        lateral_debug[7]) );
  DFFNEGX1 \u_datapath/lateral_reg_reg[6]  ( .D(n101), .CLK(n73), .Q(
        lateral_debug[6]) );
  DFFNEGX1 \u_datapath/lateral_reg_reg[5]  ( .D(n100), .CLK(n73), .Q(
        lateral_debug[5]) );
  DFFNEGX1 \u_datapath/lateral_reg_reg[4]  ( .D(n99), .CLK(n73), .Q(
        lateral_debug[4]) );
  DFFNEGX1 \u_datapath/ball_x_reg[3]  ( .D(\u_datapath/n408 ), .CLK(n73), .Q(
        ball_x[3]) );
  DFFNEGX1 \u_datapath/lateral_reg_reg[3]  ( .D(\u_datapath/n412 ), .CLK(n73), 
        .Q(lateral_debug[3]) );
  DFFNEGX1 \u_datapath/ball_x_reg[2]  ( .D(\u_datapath/n409 ), .CLK(n73), .Q(
        ball_x[2]) );
  DFFNEGX1 \u_datapath/lateral_reg_reg[2]  ( .D(\u_datapath/n413 ), .CLK(n72), 
        .Q(lateral_debug[2]) );
  DFFNEGX1 \u_datapath/ball_x_reg[1]  ( .D(\u_datapath/n410 ), .CLK(n72), .Q(
        ball_x[1]) );
  DFFNEGX1 \u_datapath/lateral_reg_reg[1]  ( .D(\u_datapath/n414 ), .CLK(n72), 
        .Q(lateral_debug[1]) );
  DFFNEGX1 \u_datapath/ball_x_reg[0]  ( .D(\u_datapath/n411 ), .CLK(n72), .Q(
        ball_x[0]) );
  DFFNEGX1 \u_datapath/lateral_reg_reg[0]  ( .D(\u_datapath/n415 ), .CLK(n72), 
        .Q(lateral_debug[0]) );
  DFFNEGX1 \u_datapath/mult_accum_reg[7]  ( .D(\u_datapath/N404 ), .CLK(n72), 
        .Q(mult_product_debug[7]) );
  DFFNEGX1 \u_datapath/mult_accum_reg[6]  ( .D(\u_datapath/N403 ), .CLK(n72), 
        .Q(mult_product_debug[6]) );
  DFFNEGX1 \u_datapath/mult_accum_reg[5]  ( .D(\u_datapath/N402 ), .CLK(n72), 
        .Q(mult_product_debug[5]) );
  DFFNEGX1 \u_datapath/mult_accum_reg[4]  ( .D(\u_datapath/N401 ), .CLK(n72), 
        .Q(mult_product_debug[4]) );
  DFFNEGX1 \u_datapath/v_sq_reg_reg[3]  ( .D(\u_datapath/n416 ), .CLK(n72), 
        .Q(\u_datapath/v_sq_reg [3]) );
  DFFNEGX1 \u_datapath/mult_accum_reg[3]  ( .D(\u_datapath/N400 ), .CLK(n72), 
        .Q(mult_product_debug[3]) );
  DFFNEGX1 \u_datapath/v_sq_reg_reg[2]  ( .D(\u_datapath/n417 ), .CLK(n72), 
        .Q(\u_datapath/v_sq_reg [2]) );
  DFFNEGX1 \u_datapath/mult_accum_reg[2]  ( .D(\u_datapath/N399 ), .CLK(n72), 
        .Q(mult_product_debug[2]) );
  DFFNEGX1 \u_datapath/v_sq_reg_reg[1]  ( .D(\u_datapath/n418 ), .CLK(n71), 
        .Q(\u_datapath/v_sq_reg [1]) );
  DFFNEGX1 \u_datapath/mult_accum_reg[1]  ( .D(\u_datapath/N398 ), .CLK(n71), 
        .Q(mult_product_debug[1]) );
  DFFNEGX1 \u_datapath/mult_shift_a_reg[7]  ( .D(n94), .CLK(clka), .Q(
        \u_datapath/mult_shift_a [7]) );
  DFFNEGX1 \u_datapath/mult_shift_a_reg[6]  ( .D(n93), .CLK(clka), .Q(
        \u_datapath/mult_shift_a [6]) );
  DFFNEGX1 \u_datapath/mult_shift_a_reg[5]  ( .D(n92), .CLK(clka), .Q(
        \u_datapath/mult_shift_a [5]) );
  DFFNEGX1 \u_datapath/mult_shift_a_reg[4]  ( .D(n91), .CLK(clka), .Q(
        \u_datapath/mult_shift_a [4]) );
  DFFNEGX1 \u_datapath/mult_shift_a_reg[3]  ( .D(\u_datapath/n404 ), .CLK(clka), .Q(\u_datapath/mult_shift_a [3]) );
  DFFNEGX1 \u_datapath/mult_shift_a_reg[2]  ( .D(\u_datapath/n405 ), .CLK(clka), .Q(\u_datapath/mult_shift_a [2]) );
  DFFNEGX1 \u_datapath/mult_shift_a_reg[1]  ( .D(\u_datapath/n406 ), .CLK(clka), .Q(\u_datapath/mult_shift_a [1]) );
  DFFNEGX1 \u_datapath/mult_shift_a_reg[0]  ( .D(\u_datapath/n407 ), .CLK(clka), .Q(\u_datapath/mult_shift_a [0]) );
  DFFNEGX1 \u_datapath/v_sq_reg_reg[0]  ( .D(\u_datapath/n419 ), .CLK(n71), 
        .Q(\u_datapath/v_sq_reg [0]) );
  DFFNEGX1 \u_datapath/mult_accum_reg[0]  ( .D(\u_datapath/N397 ), .CLK(n71), 
        .Q(mult_product_debug[0]) );
  DFFNEGX1 \u_datapath/keeper_y_reg[0]  ( .D(\u_datapath/n420 ), .CLK(n71), 
        .Q(keeper_y[0]) );
  DFFNEGX1 \u_datapath/keeper_y_reg[1]  ( .D(\u_datapath/n421 ), .CLK(n71), 
        .Q(keeper_y[1]) );
  DFFNEGX1 \u_datapath/keeper_y_reg[2]  ( .D(\u_datapath/n422 ), .CLK(n71), 
        .Q(keeper_y[2]) );
  DFFNEGX1 \u_datapath/keeper_y_reg[3]  ( .D(\u_datapath/n423 ), .CLK(n71), 
        .Q(keeper_y[3]) );
  DFFNEGX1 \u_datapath/keeper_x_reg[0]  ( .D(\u_datapath/n424 ), .CLK(n71), 
        .Q(keeper_x[0]) );
  DFFNEGX1 \u_datapath/keeper_x_reg[1]  ( .D(\u_datapath/n425 ), .CLK(n71), 
        .Q(keeper_x[1]) );
  DFFNEGX1 \u_datapath/keeper_x_reg[2]  ( .D(\u_datapath/n426 ), .CLK(n71), 
        .Q(keeper_x[2]) );
  DFFNEGX1 \u_datapath/keeper_x_reg[3]  ( .D(\u_datapath/n427 ), .CLK(n71), 
        .Q(keeper_x[3]) );
  DFFNEGX1 \u_datapath/valid_reg  ( .D(\u_datapath/N442 ), .CLK(n71), .Q(valid) );
  DFFNEGX1 \u_datapath/mult_shift_b_reg[0]  ( .D(\u_datapath/n431 ), .CLK(clka), .Q(\u_datapath/mult_shift_b [0]) );
  DFFNEGX1 \u_datapath/power_reg_reg[0]  ( .D(\u_datapath/n432 ), .CLK(clka), 
        .Q(\u_datapath/power_reg [0]) );
  DFFNEGX1 \u_datapath/mult_shift_b_reg[1]  ( .D(\u_datapath/n430 ), .CLK(clka), .Q(\u_datapath/mult_shift_b [1]) );
  DFFNEGX1 \u_datapath/power_reg_reg[1]  ( .D(\u_datapath/n433 ), .CLK(clka), 
        .Q(\u_datapath/power_reg [1]) );
  DFFNEGX1 \u_datapath/mult_shift_b_reg[2]  ( .D(\u_datapath/n429 ), .CLK(clka), .Q(\u_datapath/mult_shift_b [2]) );
  DFFNEGX1 \u_datapath/power_reg_reg[2]  ( .D(\u_datapath/n434 ), .CLK(clka), 
        .Q(\u_datapath/power_reg [2]) );
  DFFNEGX1 \u_datapath/mult_shift_b_reg[3]  ( .D(\u_datapath/n428 ), .CLK(clka), .Q(\u_datapath/mult_shift_b [3]) );
  DFFNEGX1 \u_datapath/power_reg_reg[3]  ( .D(\u_datapath/n435 ), .CLK(clka), 
        .Q(\u_datapath/power_reg [3]) );
  DFFNEGX1 \u_datapath/trig_v_reg[2]  ( .D(\u_datapath/n437 ), .CLK(clka), .Q(
        \u_datapath/trig_v [2]) );
  DFFNEGX1 \u_datapath/trig_v_reg[3]  ( .D(\u_datapath/n436 ), .CLK(clka), .Q(
        \u_datapath/trig_v [3]) );
  DFFNEGX1 \u_datapath/trig_v_reg[0]  ( .D(\u_datapath/n439 ), .CLK(clka), .Q(
        \u_datapath/trig_v [0]) );
  DFFNEGX1 \u_datapath/trig_v_reg[1]  ( .D(\u_datapath/n438 ), .CLK(clka), .Q(
        \u_datapath/trig_v [1]) );
  DFFNEGX1 \u_datapath/v_reg_reg[0]  ( .D(\u_datapath/n440 ), .CLK(clka), .Q(
        \u_datapath/v_reg [0]) );
  DFFNEGX1 \u_datapath/v_reg_reg[1]  ( .D(\u_datapath/n441 ), .CLK(clka), .Q(
        \u_datapath/v_reg [1]) );
  DFFNEGX1 \u_datapath/v_reg_reg[2]  ( .D(\u_datapath/n442 ), .CLK(clka), .Q(
        \u_datapath/v_reg [2]) );
  DFFNEGX1 \u_datapath/v_reg_reg[3]  ( .D(\u_datapath/n443 ), .CLK(clka), .Q(
        \u_datapath/v_reg [3]) );
  DFFNEGX1 \u_datapath/spin_adj_reg[0]  ( .D(\u_datapath/n444 ), .CLK(clka), 
        .Q(\u_datapath/spin_adj [0]) );
  DFFNEGX1 \u_datapath/spin_adj_reg[1]  ( .D(\u_datapath/n445 ), .CLK(clka), 
        .Q(\u_datapath/spin_adj [1]) );
  DFFNEGX1 \u_datapath/spin_adj_reg[2]  ( .D(\u_datapath/n446 ), .CLK(clka), 
        .Q(\u_datapath/spin_adj [2]) );
  DFFNEGX1 \u_datapath/trig_h_reg[0]  ( .D(\u_datapath/n447 ), .CLK(clka), .Q(
        \u_datapath/trig_h [0]) );
  DFFNEGX1 \u_datapath/trig_h_reg[1]  ( .D(\u_datapath/n448 ), .CLK(clka), .Q(
        \u_datapath/trig_h [1]) );
  DFFNEGX1 \u_datapath/trig_h_reg[2]  ( .D(\u_datapath/n449 ), .CLK(clka), .Q(
        \u_datapath/trig_h [2]) );
  DFFNEGX1 \u_datapath/trig_h_reg[3]  ( .D(\u_datapath/n450 ), .CLK(clka), .Q(
        \u_datapath/trig_h [3]) );
  DFFNEGX1 \u_datapath/mult_cycle_reg[1]  ( .D(\u_datapath/N276 ), .CLK(clka), 
        .Q(\u_datapath/mult_cycle [1]) );
  DFFNEGX1 \u_datapath/mult_cycle_reg[2]  ( .D(\u_datapath/N277 ), .CLK(clka), 
        .Q(\u_datapath/mult_cycle [2]) );
  DFFNEGX1 \u_datapath/mult_cycle_reg[0]  ( .D(\u_datapath/N275 ), .CLK(clka), 
        .Q(\u_datapath/mult_cycle [0]) );
  DFFNEGX1 \u_datapath/h_reg_reg[0]  ( .D(\u_datapath/n451 ), .CLK(clka), .Q(
        \u_datapath/h_reg [0]) );
  DFFNEGX1 \u_datapath/h_reg_reg[1]  ( .D(\u_datapath/n452 ), .CLK(clka), .Q(
        \u_datapath/h_reg [1]) );
  DFFNEGX1 \u_datapath/h_reg_reg[2]  ( .D(\u_datapath/n453 ), .CLK(clka), .Q(
        \u_datapath/h_reg [2]) );
  DFFNEGX1 \u_datapath/h_reg_reg[3]  ( .D(\u_datapath/n454 ), .CLK(clka), .Q(
        \u_datapath/h_reg [3]) );
  DFFNEGX1 \u_datapath/spin_reg_reg[0]  ( .D(\u_datapath/n455 ), .CLK(clka), 
        .Q(\u_datapath/spin_reg [0]) );
  DFFNEGX1 \u_datapath/spin_reg_reg[1]  ( .D(\u_datapath/n456 ), .CLK(clka), 
        .Q(\u_datapath/spin_reg [1]) );
  DFFNEGX1 \u_datapath/spin_reg_reg[2]  ( .D(\u_datapath/n457 ), .CLK(clka), 
        .Q(\u_datapath/spin_reg [2]) );
  DFFNEGX1 \u_datapath/spin_reg_reg[3]  ( .D(\u_datapath/n458 ), .CLK(clka), 
        .Q(\u_datapath/spin_reg [3]) );
  DFFNEGX1 \u_datapath/prev_mult_select_reg[0]  ( .D(\u_datapath/N290 ), .CLK(
        clka), .Q(\u_datapath/prev_mult_select [0]) );
  DFFNEGX1 \u_datapath/prev_mult_select_reg[1]  ( .D(\u_datapath/N291 ), .CLK(
        clka), .Q(\u_datapath/prev_mult_select [1]) );
  DFFNEGX1 \u_datapath/lfsr_reg_reg[1]  ( .D(\u_datapath/N58 ), .CLK(clka), 
        .Q(\u_datapath/lfsr_reg [1]) );
  DFFNEGX1 \u_datapath/lfsr_reg_reg[2]  ( .D(\u_datapath/N59 ), .CLK(clka), 
        .Q(\u_datapath/lfsr_reg [2]) );
  DFFNEGX1 \u_datapath/lfsr_reg_reg[3]  ( .D(\u_datapath/N60 ), .CLK(clka), 
        .Q(\u_datapath/lfsr_reg [3]) );
  DFFNEGX1 \u_datapath/lfsr_reg_reg[4]  ( .D(\u_datapath/N61 ), .CLK(clka), 
        .Q(\u_datapath/lfsr_reg [4]) );
  DFFNEGX1 \u_datapath/lfsr_reg_reg[5]  ( .D(\u_datapath/N62 ), .CLK(clka), 
        .Q(\u_datapath/lfsr_reg [5]) );
  DFFNEGX1 \u_datapath/lfsr_reg_reg[6]  ( .D(\u_datapath/N63 ), .CLK(clka), 
        .Q(\u_datapath/lfsr_reg [6]) );
  DFFNEGX1 \u_datapath/lfsr_reg_reg[0]  ( .D(\u_datapath/N57 ), .CLK(clka), 
        .Q(\u_datapath/lfsr_reg [0]) );
  DFFNEGX1 \u_datapath/lfsr_reg_reg[7]  ( .D(n63), .CLK(clka), .Q(
        \u_datapath/lfsr_reg [7]) );
  FAX1 \u_datapath/add_218/U1_1  ( .A(mult_product_debug[1]), .B(n181), .C(n49), .YC(\u_datapath/add_218/carry [2]), .YS(\u_datapath/N306 ) );
  FAX1 \u_datapath/add_218/U1_2  ( .A(mult_product_debug[2]), .B(n180), .C(
        \u_datapath/add_218/carry [2]), .YC(\u_datapath/add_218/carry [3]), 
        .YS(\u_datapath/N307 ) );
  FAX1 \u_datapath/add_218/U1_3  ( .A(mult_product_debug[3]), .B(n179), .C(
        \u_datapath/add_218/carry [3]), .YC(\u_datapath/add_218/carry [4]), 
        .YS(\u_datapath/N308 ) );
  FAX1 \u_datapath/add_218/U1_4  ( .A(mult_product_debug[4]), .B(n178), .C(
        \u_datapath/add_218/carry [4]), .YC(\u_datapath/add_218/carry [5]), 
        .YS(\u_datapath/N309 ) );
  FAX1 \u_datapath/add_218/U1_5  ( .A(mult_product_debug[5]), .B(n177), .C(
        \u_datapath/add_218/carry [5]), .YC(\u_datapath/add_218/carry [6]), 
        .YS(\u_datapath/N310 ) );
  FAX1 \u_datapath/add_218/U1_6  ( .A(mult_product_debug[6]), .B(n176), .C(
        \u_datapath/add_218/carry [6]), .YC(\u_datapath/add_218/carry [7]), 
        .YS(\u_datapath/N311 ) );
  FAX1 \u_datapath/add_218/U1_7  ( .A(mult_product_debug[7]), .B(n175), .C(
        \u_datapath/add_218/carry [7]), .YC(), .YS(\u_datapath/N312 ) );
  FAX1 \u_datapath/add_230/U1_1  ( .A(range_debug[1]), .B(
        \u_datapath/spin_adj [1]), .C(n48), .YC(\u_datapath/add_230/carry [2]), 
        .YS(\u_datapath/N328 ) );
  FAX1 \u_datapath/add_230/U1_2  ( .A(range_debug[2]), .B(
        \u_datapath/spin_adj [2]), .C(\u_datapath/add_230/carry [2]), .YC(
        \u_datapath/add_230/carry [3]), .YS(\u_datapath/N329 ) );
  FAX1 \u_datapath/add_235/U1_1  ( .A(mult_product_debug[1]), .B(
        \u_datapath/spin_adj [1]), .C(n47), .YC(\u_datapath/add_235/carry [2]), 
        .YS(\u_datapath/N346 ) );
  FAX1 \u_datapath/add_235/U1_2  ( .A(mult_product_debug[2]), .B(
        \u_datapath/spin_adj [2]), .C(\u_datapath/add_235/carry [2]), .YC(
        \u_datapath/add_235/carry [3]), .YS(\u_datapath/N347 ) );
  NOR2X1 U56 ( .A(\u_datapath/n392 ), .B(n63), .Y(n45) );
  AND2X2 U57 ( .A(n103), .B(n67), .Y(n46) );
  AND2X2 U58 ( .A(\u_datapath/spin_adj [0]), .B(mult_product_debug[0]), .Y(n47) );
  AND2X2 U59 ( .A(\u_datapath/spin_adj [0]), .B(range_debug[0]), .Y(n48) );
  AND2X2 U60 ( .A(n182), .B(mult_product_debug[0]), .Y(n49) );
  AND2X2 U61 ( .A(\u_datapath/add_235/carry [3]), .B(mult_product_debug[3]), 
        .Y(n50) );
  AND2X2 U62 ( .A(n50), .B(mult_product_debug[4]), .Y(n51) );
  AND2X2 U63 ( .A(n51), .B(mult_product_debug[5]), .Y(n52) );
  AND2X2 U64 ( .A(\u_datapath/add_230/carry [3]), .B(range_debug[3]), .Y(n53)
         );
  AND2X2 U65 ( .A(n53), .B(range_debug[4]), .Y(n54) );
  AND2X2 U66 ( .A(n54), .B(range_debug[5]), .Y(n55) );
  AND2X2 U67 ( .A(n52), .B(mult_product_debug[6]), .Y(n56) );
  AND2X2 U68 ( .A(n55), .B(range_debug[6]), .Y(n57) );
  INVX2 U69 ( .A(n59), .Y(n60) );
  INVX2 U70 ( .A(n65), .Y(n63) );
  INVX2 U71 ( .A(\u_datapath/n196 ), .Y(n59) );
  INVX2 U72 ( .A(n46), .Y(n58) );
  INVX2 U73 ( .A(\u_datapath/n308 ), .Y(n95) );
  BUFX2 U74 ( .A(n70), .Y(n65) );
  BUFX2 U75 ( .A(n70), .Y(n66) );
  BUFX2 U76 ( .A(n70), .Y(n64) );
  BUFX2 U77 ( .A(n64), .Y(n67) );
  BUFX2 U78 ( .A(n64), .Y(n69) );
  BUFX2 U79 ( .A(n64), .Y(n68) );
  BUFX2 U80 ( .A(\u_datapath/n372 ), .Y(n61) );
  INVX2 U81 ( .A(\u_datapath/n369 ), .Y(n62) );
  INVX2 U82 ( .A(restart), .Y(n70) );
  BUFX2 U83 ( .A(clkb), .Y(n71) );
  BUFX2 U84 ( .A(clkb), .Y(n72) );
  BUFX2 U85 ( .A(clkb), .Y(n73) );
  BUFX2 U86 ( .A(clkb), .Y(n74) );
  BUFX2 U87 ( .A(clkb), .Y(n75) );
  XOR2X1 U88 ( .A(n182), .B(mult_product_debug[0]), .Y(\u_datapath/N305 ) );
  XOR2X1 U89 ( .A(\u_datapath/spin_adj [0]), .B(range_debug[0]), .Y(
        \u_datapath/N327 ) );
  XOR2X1 U90 ( .A(\u_datapath/add_230/carry [3]), .B(range_debug[3]), .Y(
        \u_datapath/N330 ) );
  XOR2X1 U91 ( .A(n53), .B(range_debug[4]), .Y(\u_datapath/N331 ) );
  XOR2X1 U92 ( .A(n54), .B(range_debug[5]), .Y(\u_datapath/N332 ) );
  XOR2X1 U93 ( .A(n55), .B(range_debug[6]), .Y(\u_datapath/N333 ) );
  XOR2X1 U94 ( .A(range_debug[7]), .B(n57), .Y(\u_datapath/N334 ) );
  XOR2X1 U95 ( .A(\u_datapath/spin_adj [0]), .B(mult_product_debug[0]), .Y(
        \u_datapath/N345 ) );
  XOR2X1 U96 ( .A(\u_datapath/add_235/carry [3]), .B(mult_product_debug[3]), 
        .Y(\u_datapath/N348 ) );
  XOR2X1 U97 ( .A(n50), .B(mult_product_debug[4]), .Y(\u_datapath/N349 ) );
  XOR2X1 U98 ( .A(n51), .B(mult_product_debug[5]), .Y(\u_datapath/N350 ) );
  XOR2X1 U99 ( .A(n52), .B(mult_product_debug[6]), .Y(\u_datapath/N351 ) );
  XOR2X1 U100 ( .A(mult_product_debug[7]), .B(n56), .Y(\u_datapath/N352 ) );
  OR2X2 U101 ( .A(n63), .B(w_sample_keeper_enable), .Y(\u_datapath/n236 ) );
  INVX2 U102 ( .A(\u_datapath/n306 ), .Y(n76) );
  INVX2 U103 ( .A(\u_datapath/n355 ), .Y(n77) );
  INVX2 U104 ( .A(\u_datapath/n354 ), .Y(n78) );
  INVX2 U105 ( .A(\u_datapath/n353 ), .Y(n79) );
  INVX2 U106 ( .A(\u_datapath/n350 ), .Y(n80) );
  INVX2 U107 ( .A(\u_fsm/n121 ), .Y(n81) );
  INVX2 U108 ( .A(\u_fsm/n116 ), .Y(n82) );
  INVX2 U109 ( .A(\u_fsm/n63 ), .Y(n83) );
  INVX2 U110 ( .A(\u_fsm/n62 ), .Y(n84) );
  INVX2 U111 ( .A(\u_fsm/n53 ), .Y(n85) );
  INVX2 U112 ( .A(\u_fsm/n52 ), .Y(n86) );
  INVX2 U113 ( .A(\u_fsm/n41 ), .Y(n87) );
  INVX2 U114 ( .A(\u_fsm/n40 ), .Y(n88) );
  INVX2 U115 ( .A(n42), .Y(n89) );
  INVX2 U116 ( .A(n43), .Y(n90) );
  INVX2 U117 ( .A(\u_datapath/n200 ), .Y(n91) );
  INVX2 U118 ( .A(\u_datapath/n199 ), .Y(n92) );
  INVX2 U119 ( .A(\u_datapath/n198 ), .Y(n93) );
  INVX2 U120 ( .A(\u_datapath/n195 ), .Y(n94) );
  INVX2 U121 ( .A(\u_datapath/n216 ), .Y(n96) );
  INVX2 U122 ( .A(\u_datapath/n255 ), .Y(n97) );
  INVX2 U123 ( .A(\u_datapath/n220 ), .Y(n98) );
  INVX2 U124 ( .A(\u_datapath/n223 ), .Y(n99) );
  INVX2 U125 ( .A(\u_datapath/n222 ), .Y(n100) );
  INVX2 U126 ( .A(\u_datapath/n221 ), .Y(n101) );
  INVX2 U127 ( .A(\u_datapath/n218 ), .Y(n102) );
  INVX2 U128 ( .A(\u_datapath/n191 ), .Y(n103) );
  INVX2 U129 ( .A(N21), .Y(n104) );
  INVX2 U130 ( .A(spin_ctrl), .Y(n105) );
  INVX2 U131 ( .A(v_angle_ctrl), .Y(n106) );
  INVX2 U132 ( .A(h_angle_ctrl), .Y(n107) );
  INVX2 U133 ( .A(ring_v_angle_cnt[2]), .Y(n108) );
  INVX2 U134 ( .A(n24), .Y(n109) );
  INVX2 U135 ( .A(ring_h_angle_cnt[0]), .Y(n110) );
  INVX2 U136 ( .A(ring_h_angle_cnt[1]), .Y(n111) );
  INVX2 U137 ( .A(ring_h_angle_cnt[2]), .Y(n112) );
  INVX2 U138 ( .A(ring_power_cnt[2]), .Y(n113) );
  INVX2 U139 ( .A(ring_power_cnt[3]), .Y(n114) );
  INVX2 U140 ( .A(n34), .Y(n115) );
  INVX2 U141 ( .A(ring_spin_cnt[0]), .Y(n116) );
  INVX2 U142 ( .A(ring_spin_cnt[2]), .Y(n117) );
  INVX2 U143 ( .A(ring_spin_cnt[3]), .Y(n118) );
  INVX2 U144 ( .A(\u_datapath/n356 ), .Y(n119) );
  INVX2 U145 ( .A(\u_datapath/n233 ), .Y(n120) );
  INVX2 U146 ( .A(\u_datapath/n269 ), .Y(n121) );
  INVX2 U147 ( .A(\u_datapath/n392 ), .Y(n122) );
  INVX2 U148 ( .A(\u_datapath/n387 ), .Y(n123) );
  INVX2 U149 ( .A(w_multiplication_select[0]), .Y(n124) );
  INVX2 U150 ( .A(w_multiplication_select[1]), .Y(n125) );
  INVX2 U151 ( .A(\u_fsm/next_state [0]), .Y(n126) );
  INVX2 U152 ( .A(\u_fsm/calc_v_sq_counter [0]), .Y(n127) );
  INVX2 U153 ( .A(\u_fsm/calc_v_sq_counter [2]), .Y(n128) );
  INVX2 U154 ( .A(\u_fsm/calc_v_sq_counter [1]), .Y(n129) );
  INVX2 U155 ( .A(\u_fsm/calc_lateral_counter [0]), .Y(n130) );
  INVX2 U156 ( .A(\u_fsm/calc_lateral_counter [2]), .Y(n131) );
  INVX2 U157 ( .A(\u_fsm/calc_lateral_counter [1]), .Y(n132) );
  INVX2 U158 ( .A(\u_fsm/n114 ), .Y(n133) );
  INVX2 U159 ( .A(\u_fsm/n47 ), .Y(n134) );
  INVX2 U160 ( .A(\u_fsm/n73 ), .Y(n135) );
  INVX2 U161 ( .A(\u_fsm/n83 ), .Y(n136) );
  INVX2 U162 ( .A(\u_fsm/n81 ), .Y(n137) );
  INVX2 U163 ( .A(\u_fsm/n85 ), .Y(n138) );
  INVX2 U164 ( .A(\u_fsm/next_state [3]), .Y(n139) );
  INVX2 U165 ( .A(\u_fsm/current_state [2]), .Y(n140) );
  INVX2 U166 ( .A(\u_fsm/n84 ), .Y(n141) );
  INVX2 U167 ( .A(\u_fsm/next_state [2]), .Y(n142) );
  INVX2 U168 ( .A(\u_fsm/n66 ), .Y(n143) );
  INVX2 U169 ( .A(\u_fsm/calc_range_counter [0]), .Y(n144) );
  INVX2 U170 ( .A(\u_fsm/calc_range_counter [2]), .Y(n145) );
  INVX2 U171 ( .A(\u_fsm/calc_range_counter [1]), .Y(n146) );
  INVX2 U172 ( .A(\u_fsm/next_state [1]), .Y(n147) );
  INVX2 U173 ( .A(\u_fsm/current_state [0]), .Y(n148) );
  INVX2 U174 ( .A(win_loss), .Y(n149) );
  INVX2 U175 ( .A(\u_datapath/n157 ), .Y(n150) );
  INVX2 U176 ( .A(range_debug[2]), .Y(n151) );
  INVX2 U177 ( .A(range_debug[1]), .Y(n152) );
  INVX2 U178 ( .A(\u_datapath/n187 ), .Y(n153) );
  INVX2 U179 ( .A(range_debug[0]), .Y(n154) );
  INVX2 U180 ( .A(\u_datapath/n188 ), .Y(n155) );
  INVX2 U181 ( .A(range_debug[3]), .Y(n156) );
  INVX2 U182 ( .A(\u_datapath/n169 ), .Y(n157) );
  INVX2 U183 ( .A(\u_datapath/n162 ), .Y(n158) );
  INVX2 U184 ( .A(lateral_debug[3]), .Y(n159) );
  INVX2 U185 ( .A(lateral_debug[2]), .Y(n160) );
  INVX2 U186 ( .A(lateral_debug[1]), .Y(n161) );
  INVX2 U187 ( .A(\u_datapath/n180 ), .Y(n162) );
  INVX2 U188 ( .A(lateral_debug[0]), .Y(n163) );
  INVX2 U189 ( .A(\u_datapath/n181 ), .Y(n164) );
  INVX2 U190 ( .A(mult_product_debug[7]), .Y(n165) );
  INVX2 U191 ( .A(mult_product_debug[6]), .Y(n166) );
  INVX2 U192 ( .A(mult_product_debug[5]), .Y(n167) );
  INVX2 U193 ( .A(mult_product_debug[4]), .Y(n168) );
  INVX2 U194 ( .A(\u_datapath/v_sq_reg [3]), .Y(n169) );
  INVX2 U195 ( .A(mult_product_debug[3]), .Y(n170) );
  INVX2 U196 ( .A(\u_datapath/v_sq_reg [2]), .Y(n171) );
  INVX2 U197 ( .A(mult_product_debug[2]), .Y(n172) );
  INVX2 U198 ( .A(\u_datapath/v_sq_reg [1]), .Y(n173) );
  INVX2 U199 ( .A(mult_product_debug[1]), .Y(n174) );
  INVX2 U200 ( .A(\u_datapath/n140 ), .Y(n175) );
  INVX2 U201 ( .A(\u_datapath/n141 ), .Y(n176) );
  INVX2 U202 ( .A(\u_datapath/n142 ), .Y(n177) );
  INVX2 U203 ( .A(\u_datapath/n143 ), .Y(n178) );
  INVX2 U204 ( .A(\u_datapath/n144 ), .Y(n179) );
  INVX2 U205 ( .A(\u_datapath/n145 ), .Y(n180) );
  INVX2 U206 ( .A(\u_datapath/n146 ), .Y(n181) );
  INVX2 U207 ( .A(\u_datapath/n147 ), .Y(n182) );
  INVX2 U208 ( .A(\u_datapath/v_sq_reg [0]), .Y(n183) );
  INVX2 U209 ( .A(mult_product_debug[0]), .Y(n184) );
  INVX2 U210 ( .A(keeper_y[0]), .Y(n185) );
  INVX2 U211 ( .A(keeper_y[1]), .Y(n186) );
  INVX2 U212 ( .A(keeper_y[2]), .Y(n187) );
  INVX2 U213 ( .A(keeper_y[3]), .Y(n188) );
  INVX2 U214 ( .A(keeper_x[0]), .Y(n189) );
  INVX2 U215 ( .A(keeper_x[1]), .Y(n190) );
  INVX2 U216 ( .A(keeper_x[2]), .Y(n191) );
  INVX2 U217 ( .A(keeper_x[3]), .Y(n192) );
  INVX2 U218 ( .A(\u_datapath/power_reg [0]), .Y(n193) );
  INVX2 U219 ( .A(\u_datapath/power_reg [1]), .Y(n194) );
  INVX2 U220 ( .A(\u_datapath/power_reg [2]), .Y(n195) );
  INVX2 U221 ( .A(\u_datapath/power_reg [3]), .Y(n196) );
  INVX2 U222 ( .A(\u_datapath/trig_v [2]), .Y(n197) );
  INVX2 U223 ( .A(\u_datapath/trig_v [3]), .Y(n198) );
  INVX2 U224 ( .A(\u_datapath/trig_v [0]), .Y(n199) );
  INVX2 U225 ( .A(\u_datapath/trig_v [1]), .Y(n200) );
  INVX2 U226 ( .A(\u_datapath/n292 ), .Y(n201) );
  INVX2 U227 ( .A(\u_datapath/n286 ), .Y(n202) );
  INVX2 U228 ( .A(\u_datapath/v_reg [0]), .Y(n203) );
  INVX2 U229 ( .A(\u_datapath/v_reg [1]), .Y(n204) );
  INVX2 U230 ( .A(\u_datapath/n285 ), .Y(n205) );
  INVX2 U231 ( .A(\u_datapath/v_reg [2]), .Y(n206) );
  INVX2 U232 ( .A(\u_datapath/v_reg [3]), .Y(n207) );
  INVX2 U233 ( .A(\u_datapath/trig_h [0]), .Y(n208) );
  INVX2 U234 ( .A(\u_datapath/trig_h [1]), .Y(n209) );
  INVX2 U235 ( .A(\u_datapath/trig_h [2]), .Y(n210) );
  INVX2 U236 ( .A(\u_datapath/trig_h [3]), .Y(n211) );
  INVX2 U237 ( .A(\u_datapath/mult_cycle [1]), .Y(n212) );
  INVX2 U238 ( .A(\u_datapath/mult_cycle [2]), .Y(n213) );
  INVX2 U239 ( .A(\u_datapath/mult_cycle [0]), .Y(n214) );
  INVX2 U240 ( .A(\u_datapath/n334 ), .Y(n215) );
  INVX2 U241 ( .A(\u_datapath/n312 ), .Y(n216) );
  INVX2 U242 ( .A(\u_datapath/h_reg [0]), .Y(n217) );
  INVX2 U243 ( .A(\u_datapath/h_reg [1]), .Y(n218) );
  INVX2 U244 ( .A(\u_datapath/n324 ), .Y(n219) );
  INVX2 U245 ( .A(\u_datapath/h_reg [2]), .Y(n220) );
  INVX2 U246 ( .A(\u_datapath/h_reg [3]), .Y(n221) );
  INVX2 U247 ( .A(\u_datapath/spin_reg [0]), .Y(n222) );
  INVX2 U248 ( .A(\u_datapath/spin_reg [1]), .Y(n223) );
  INVX2 U249 ( .A(\u_datapath/spin_reg [2]), .Y(n224) );
  INVX2 U250 ( .A(\u_datapath/spin_reg [3]), .Y(n225) );
endmodule

