
// Generated by Cadence Genus(TM) Synthesis Solution 19.15-s090_1
// Generated on: Oct 26 2023 16:31:43 PDT (Oct 26 2023 23:31:43 UTC)

// Verification Directory fv/gcd 

module REGISTER_R_N2_INIT2h2(q, d, rst, clk);
  input [1:0] d;
  input rst, clk;
  output [1:0] q;
  wire [1:0] d;
  wire rst, clk;
  wire [1:0] q;
  wire n_0, n_1;
  sky130_fd_sc_hd__dfxtp_1 \q_reg[1] (.CLK (clk), .D (n_1), .Q (q[1]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[0] (.CLK (clk), .D (n_0), .Q (q[0]));
  sky130_fd_sc_hd__or2_0 g5__2398(.A (rst), .B (d[1]), .X (n_1));
  sky130_fd_sc_hd__nor2b_1 g6__5107(.A (rst), .B_N (d[0]), .Y (n_0));
endmodule

module gcd_control(clk, reset, operands_val, result_rdy, B_zero,
     A_lt_B, result_val, operands_rdy, A_mux_sel, B_mux_sel, A_en,
     B_en);
  input clk, reset, operands_val, result_rdy, B_zero, A_lt_B;
  output result_val, operands_rdy, B_mux_sel, A_en, B_en;
  output [1:0] A_mux_sel;
  wire clk, reset, operands_val, result_rdy, B_zero, A_lt_B;
  wire result_val, operands_rdy, B_mux_sel, A_en, B_en;
  wire [1:0] A_mux_sel;
  wire [1:0] nextstate;
  wire [1:0] state;
  wire UNCONNECTED, n_0, n_1, n_2, n_3, n_4, n_5, n_6;
  wire n_7, n_8;
  REGISTER_R_N2_INIT2h2 state_machine(.q (state), .d (nextstate), .rst
       (reset), .clk (clk));
  sky130_fd_sc_hd__o21ai_1 g466__6260(.A1 (state[1]), .A2 (n_8), .B1
       (n_7), .Y (A_en));
  sky130_fd_sc_hd__nand2b_1 g467__4319(.A_N (A_mux_sel[0]), .B (n_7),
       .Y (B_en));
  sky130_fd_sc_hd__a21boi_1 g468__8428(.A1 (state[1]), .A2 (n_1), .B1_N
       (n_8), .Y (nextstate[0]));
  sky130_fd_sc_hd__a22o_1 g469__5526(.A1 (n_6), .A2 (n_4), .B1
       (state[1]), .B2 (n_5), .X (nextstate[1]));
  sky130_fd_sc_hd__and2_2 g470__6783(.A (A_lt_B), .B (n_4), .X
       (A_mux_sel[0]));
  sky130_fd_sc_hd__or2_1 g471__3680(.A (state[0]), .B (n_6), .X (n_8));
  sky130_fd_sc_hd__and2_1 g472__1617(.A (n_3), .B (n_4), .X
       (A_mux_sel[1]));
  sky130_fd_sc_hd__nand2b_1 g473__2802(.A_N (n_5), .B (state[1]), .Y
       (n_7));
  sky130_fd_sc_hd__nor2b_1 g474__1705(.A (A_lt_B), .B_N (B_zero), .Y
       (n_6));
  sky130_fd_sc_hd__nand2b_1 g475__5122(.A_N (state[0]), .B
       (operands_val), .Y (n_5));
  sky130_fd_sc_hd__nor2_1 g476__8246(.A (state[0]), .B (state[1]), .Y
       (n_4));
  sky130_fd_sc_hd__nor2_1 g477__7098(.A (A_lt_B), .B (B_zero), .Y
       (n_3));
  sky130_fd_sc_hd__and2_0 g479__6131(.A (state[1]), .B (state[0]), .X
       (n_2));
  sky130_fd_sc_hd__nand2b_1 g480__1881(.A_N (result_rdy), .B
       (state[0]), .Y (n_1));
  sky130_fd_sc_hd__buf_8 drc_bufs(.A (n_0), .X (operands_rdy));
  sky130_fd_sc_hd__buf_8 drc_bufs482(.A (n_2), .X (result_val));
  sky130_fd_sc_hd__nor2b_1 g2__5115(.A (state[0]), .B_N (state[1]), .Y
       (n_0));
  sky130_fd_sc_hd__conb_1 tie_0_cell(.HI (UNCONNECTED), .LO
       (B_mux_sel));
endmodule

module CLKGATE_RC_CG_MOD(enable, ck_in, ck_out, test);
  input enable, ck_in, test;
  output ck_out;
  wire enable, ck_in, test;
  wire ck_out;
  sky130_fd_sc_hd__sdlclkp_1 RC_CGIC_INST(.GATE (enable), .CLK (ck_in),
       .SCE (test), .GCLK (ck_out));
endmodule

module REGISTER_R_CE_N16(q, d, rst, ce, clk);
  input [15:0] d;
  input rst, ce, clk;
  output [15:0] q;
  wire [15:0] d;
  wire rst, ce, clk;
  wire [15:0] q;
  wire CLKGATE_rc_gclk, UNCONNECTED0, logic_0_1_net, n_0, n_1, n_2,
       n_3, n_4;
  wire n_5, n_6, n_7, n_8, n_9, n_10, n_11, n_12;
  wire n_13, n_14, n_15, n_16;
  CLKGATE_RC_CG_MOD CLKGATE_RC_CG_HIER_INST0(.enable (n_16), .ck_in
       (clk), .ck_out (CLKGATE_rc_gclk), .test (logic_0_1_net));
  sky130_fd_sc_hd__or2_0 g67__7482(.A (rst), .B (ce), .X (n_16));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[2] (.CLK (CLKGATE_rc_gclk), .D
       (n_15), .Q (q[2]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[1] (.CLK (CLKGATE_rc_gclk), .D
       (n_12), .Q (q[1]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[14] (.CLK (CLKGATE_rc_gclk), .D
       (n_13), .Q (q[14]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[15] (.CLK (CLKGATE_rc_gclk), .D
       (n_11), .Q (q[15]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[0] (.CLK (CLKGATE_rc_gclk), .D
       (n_14), .Q (q[0]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[3] (.CLK (CLKGATE_rc_gclk), .D
       (n_10), .Q (q[3]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[4] (.CLK (CLKGATE_rc_gclk), .D (n_8),
       .Q (q[4]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[5] (.CLK (CLKGATE_rc_gclk), .D (n_3),
       .Q (q[5]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[10] (.CLK (CLKGATE_rc_gclk), .D
       (n_1), .Q (q[10]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[7] (.CLK (CLKGATE_rc_gclk), .D (n_5),
       .Q (q[7]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[8] (.CLK (CLKGATE_rc_gclk), .D (n_7),
       .Q (q[8]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[9] (.CLK (CLKGATE_rc_gclk), .D (n_2),
       .Q (q[9]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[6] (.CLK (CLKGATE_rc_gclk), .D (n_6),
       .Q (q[6]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[11] (.CLK (CLKGATE_rc_gclk), .D
       (n_4), .Q (q[11]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[12] (.CLK (CLKGATE_rc_gclk), .D
       (n_0), .Q (q[12]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[13] (.CLK (CLKGATE_rc_gclk), .D
       (n_9), .Q (q[13]));
  sky130_fd_sc_hd__nor2b_1 g83__4733(.A (rst), .B_N (d[2]), .Y (n_15));
  sky130_fd_sc_hd__nor2b_1 g84__6161(.A (rst), .B_N (d[0]), .Y (n_14));
  sky130_fd_sc_hd__nor2b_1 g85__9315(.A (rst), .B_N (d[14]), .Y (n_13));
  sky130_fd_sc_hd__nor2b_1 g86__9945(.A (rst), .B_N (d[1]), .Y (n_12));
  sky130_fd_sc_hd__nor2b_1 g87__2883(.A (rst), .B_N (d[15]), .Y (n_11));
  sky130_fd_sc_hd__nor2b_1 g88__2346(.A (rst), .B_N (d[3]), .Y (n_10));
  sky130_fd_sc_hd__nor2b_1 g89__1666(.A (rst), .B_N (d[13]), .Y (n_9));
  sky130_fd_sc_hd__nor2b_1 g90__7410(.A (rst), .B_N (d[4]), .Y (n_8));
  sky130_fd_sc_hd__nor2b_1 g91__6417(.A (rst), .B_N (d[8]), .Y (n_7));
  sky130_fd_sc_hd__nor2b_1 g92__5477(.A (rst), .B_N (d[6]), .Y (n_6));
  sky130_fd_sc_hd__nor2b_1 g93__2398(.A (rst), .B_N (d[7]), .Y (n_5));
  sky130_fd_sc_hd__nor2b_1 g94__5107(.A (rst), .B_N (d[11]), .Y (n_4));
  sky130_fd_sc_hd__nor2b_1 g95__6260(.A (rst), .B_N (d[5]), .Y (n_3));
  sky130_fd_sc_hd__nor2b_1 g96__4319(.A (rst), .B_N (d[9]), .Y (n_2));
  sky130_fd_sc_hd__nor2b_1 g97__8428(.A (rst), .B_N (d[10]), .Y (n_1));
  sky130_fd_sc_hd__nor2b_1 g98__5526(.A (rst), .B_N (d[12]), .Y (n_0));
  sky130_fd_sc_hd__conb_1 tie_0_cell(.HI (UNCONNECTED0), .LO
       (logic_0_1_net));
endmodule

module CLKGATE_RC_CG_MOD_1(enable, ck_in, ck_out, test);
  input enable, ck_in, test;
  output ck_out;
  wire enable, ck_in, test;
  wire ck_out;
  sky130_fd_sc_hd__sdlclkp_1 RC_CGIC_INST(.GATE (enable), .CLK (ck_in),
       .SCE (test), .GCLK (ck_out));
endmodule

module REGISTER_R_CE_N16_26(q, d, rst, ce, clk);
  input [15:0] d;
  input rst, ce, clk;
  output [15:0] q;
  wire [15:0] d;
  wire rst, ce, clk;
  wire [15:0] q;
  wire CLKGATE_rc_gclk, UNCONNECTED1, logic_0_1_net, n_0, n_1, n_2,
       n_3, n_4;
  wire n_5, n_6, n_7, n_8, n_9, n_10, n_11, n_12;
  wire n_13, n_14, n_15, n_16;
  CLKGATE_RC_CG_MOD_1 CLKGATE_RC_CG_HIER_INST1(.enable (n_16), .ck_in
       (clk), .ck_out (CLKGATE_rc_gclk), .test (logic_0_1_net));
  sky130_fd_sc_hd__or2_0 g67__6783(.A (rst), .B (ce), .X (n_16));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[2] (.CLK (CLKGATE_rc_gclk), .D
       (n_15), .Q (q[2]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[1] (.CLK (CLKGATE_rc_gclk), .D
       (n_12), .Q (q[1]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[14] (.CLK (CLKGATE_rc_gclk), .D
       (n_13), .Q (q[14]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[15] (.CLK (CLKGATE_rc_gclk), .D
       (n_11), .Q (q[15]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[0] (.CLK (CLKGATE_rc_gclk), .D
       (n_14), .Q (q[0]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[3] (.CLK (CLKGATE_rc_gclk), .D
       (n_10), .Q (q[3]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[4] (.CLK (CLKGATE_rc_gclk), .D (n_8),
       .Q (q[4]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[5] (.CLK (CLKGATE_rc_gclk), .D (n_3),
       .Q (q[5]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[10] (.CLK (CLKGATE_rc_gclk), .D
       (n_1), .Q (q[10]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[7] (.CLK (CLKGATE_rc_gclk), .D (n_5),
       .Q (q[7]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[8] (.CLK (CLKGATE_rc_gclk), .D (n_7),
       .Q (q[8]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[9] (.CLK (CLKGATE_rc_gclk), .D (n_2),
       .Q (q[9]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[6] (.CLK (CLKGATE_rc_gclk), .D (n_6),
       .Q (q[6]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[11] (.CLK (CLKGATE_rc_gclk), .D
       (n_4), .Q (q[11]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[12] (.CLK (CLKGATE_rc_gclk), .D
       (n_0), .Q (q[12]));
  sky130_fd_sc_hd__dfxtp_1 \q_reg[13] (.CLK (CLKGATE_rc_gclk), .D
       (n_9), .Q (q[13]));
  sky130_fd_sc_hd__nor2b_1 g83__3680(.A (rst), .B_N (d[2]), .Y (n_15));
  sky130_fd_sc_hd__nor2b_1 g84__1617(.A (rst), .B_N (d[0]), .Y (n_14));
  sky130_fd_sc_hd__nor2b_1 g85__2802(.A (rst), .B_N (d[14]), .Y (n_13));
  sky130_fd_sc_hd__nor2b_1 g86__1705(.A (rst), .B_N (d[1]), .Y (n_12));
  sky130_fd_sc_hd__nor2b_1 g87__5122(.A (rst), .B_N (d[15]), .Y (n_11));
  sky130_fd_sc_hd__nor2b_1 g88__8246(.A (rst), .B_N (d[3]), .Y (n_10));
  sky130_fd_sc_hd__nor2b_1 g89__7098(.A (rst), .B_N (d[13]), .Y (n_9));
  sky130_fd_sc_hd__nor2b_1 g90__6131(.A (rst), .B_N (d[4]), .Y (n_8));
  sky130_fd_sc_hd__nor2b_1 g91__1881(.A (rst), .B_N (d[8]), .Y (n_7));
  sky130_fd_sc_hd__nor2b_1 g92__5115(.A (rst), .B_N (d[6]), .Y (n_6));
  sky130_fd_sc_hd__nor2b_1 g93__7482(.A (rst), .B_N (d[7]), .Y (n_5));
  sky130_fd_sc_hd__nor2b_1 g94__4733(.A (rst), .B_N (d[11]), .Y (n_4));
  sky130_fd_sc_hd__nor2b_1 g95__6161(.A (rst), .B_N (d[5]), .Y (n_3));
  sky130_fd_sc_hd__nor2b_1 g96__9315(.A (rst), .B_N (d[9]), .Y (n_2));
  sky130_fd_sc_hd__nor2b_1 g97__9945(.A (rst), .B_N (d[10]), .Y (n_1));
  sky130_fd_sc_hd__nor2b_1 g98__2883(.A (rst), .B_N (d[12]), .Y (n_0));
  sky130_fd_sc_hd__conb_1 tie_0_cell(.HI (UNCONNECTED1), .LO
       (logic_0_1_net));
endmodule

module gcd_datapath_W16(operands_bits_A, operands_bits_B,
     result_bits_data, clk, reset, B_mux_sel, A_en, B_en, A_mux_sel,
     B_zero, A_lt_B);
  input [15:0] operands_bits_A, operands_bits_B;
  input clk, reset, B_mux_sel, A_en, B_en;
  input [1:0] A_mux_sel;
  output [15:0] result_bits_data;
  output B_zero, A_lt_B;
  wire [15:0] operands_bits_A, operands_bits_B;
  wire clk, reset, B_mux_sel, A_en, B_en;
  wire [1:0] A_mux_sel;
  wire [15:0] result_bits_data;
  wire B_zero, A_lt_B;
  wire [15:0] A_next;
  wire [15:0] A_reg;
  wire [15:0] B_next;
  wire [15:0] B_reg;
  wire n_0, n_1, n_2, n_3, n_4, n_5, n_6, n_7;
  wire n_8, n_9, n_10, n_11, n_12, n_13, n_14, n_15;
  wire n_16, n_17, n_18, n_19, n_20, n_21, n_22, n_23;
  wire n_24, n_25, n_26, n_27, n_28, n_29, n_30, n_31;
  wire n_32, n_33, n_34, n_35, n_36, n_37, n_38, n_39;
  wire n_40, n_41, n_42, n_43, n_44, n_45, n_46, n_47;
  wire n_48, n_49, n_50, n_51, n_52, n_53, n_54, n_55;
  wire n_56, n_57, n_58, n_59, n_60, n_61, n_62, n_63;
  wire n_80, n_81, n_82, n_83, n_84, n_85, n_86, n_87;
  wire n_88, n_89, n_90, n_91, n_92, n_93, n_94, n_95;
  wire n_96, n_97, n_98, n_99, n_100, n_101, n_102, sub_45_24_n_0;
  wire sub_45_24_n_1, sub_45_24_n_2, sub_45_24_n_3, sub_45_24_n_4,
       sub_45_24_n_5, sub_45_24_n_6, sub_45_24_n_7, sub_45_24_n_8;
  wire sub_45_24_n_9, sub_45_24_n_10, sub_45_24_n_11, sub_45_24_n_12,
       sub_45_24_n_13, sub_45_24_n_14, sub_45_24_n_15, sub_45_24_n_16;
  wire sub_45_24_n_18, sub_45_24_n_20, sub_45_24_n_22, sub_45_24_n_24,
       sub_45_24_n_26, sub_45_24_n_28, sub_45_24_n_30, sub_45_24_n_32;
  wire sub_45_24_n_34, sub_45_24_n_36, sub_45_24_n_38, sub_45_24_n_40,
       sub_45_24_n_42, sub_45_24_n_44;
  REGISTER_R_CE_N16 A_register(.q (A_reg), .d (A_next), .rst (reset),
       .ce (A_en), .clk (clk));
  REGISTER_R_CE_N16_26 B_register(.q (B_reg), .d (B_next), .rst
       (reset), .ce (B_en), .clk (clk));
  sky130_fd_sc_hd__buf_8 g809(.A (n_86), .X (result_bits_data[11]));
  sky130_fd_sc_hd__buf_8 g825(.A (n_85), .X (result_bits_data[7]));
  sky130_fd_sc_hd__buf_8 g814(.A (n_80), .X (result_bits_data[1]));
  sky130_fd_sc_hd__buf_8 g817(.A (n_82), .X (result_bits_data[3]));
  sky130_fd_sc_hd__buf_8 g819(.A (n_84), .X (result_bits_data[6]));
  sky130_fd_sc_hd__buf_8 g821(.A (n_83), .X (result_bits_data[5]));
  sky130_fd_sc_hd__buf_8 g823(.A (n_81), .X (result_bits_data[2]));
  sky130_fd_sc_hd__buf_8 g812(.A (A_reg[9]), .X (result_bits_data[9]));
  sky130_fd_sc_hd__buf_8 g813(.A (A_reg[15]), .X
       (result_bits_data[15]));
  sky130_fd_sc_hd__buf_8 g807(.A (A_reg[14]), .X
       (result_bits_data[14]));
  sky130_fd_sc_hd__buf_8 g806(.A (A_reg[13]), .X
       (result_bits_data[13]));
  sky130_fd_sc_hd__buf_8 g808(.A (A_reg[12]), .X
       (result_bits_data[12]));
  sky130_fd_sc_hd__buf_8 g811(.A (A_reg[10]), .X
       (result_bits_data[10]));
  sky130_fd_sc_hd__buf_1 g810(.A (A_reg[11]), .X (n_86));
  sky130_fd_sc_hd__buf_8 g827(.A (A_reg[8]), .X (result_bits_data[8]));
  sky130_fd_sc_hd__buf_8 g816(.A (A_reg[0]), .X (result_bits_data[0]));
  sky130_fd_sc_hd__buf_8 g828(.A (A_reg[4]), .X (result_bits_data[4]));
  sky130_fd_sc_hd__buf_1 g818(.A (A_reg[3]), .X (n_82));
  sky130_fd_sc_hd__buf_1 g820(.A (A_reg[6]), .X (n_84));
  sky130_fd_sc_hd__buf_1 g824(.A (A_reg[2]), .X (n_81));
  sky130_fd_sc_hd__buf_1 g815(.A (A_reg[1]), .X (n_80));
  sky130_fd_sc_hd__buf_1 g826(.A (A_reg[7]), .X (n_85));
  sky130_fd_sc_hd__buf_1 g822(.A (A_reg[5]), .X (n_83));
  sky130_fd_sc_hd__inv_1 g1197(.A (n_63), .Y (A_next[6]));
  sky130_fd_sc_hd__inv_1 g1198(.A (n_62), .Y (A_next[13]));
  sky130_fd_sc_hd__inv_1 g1199(.A (n_61), .Y (A_next[11]));
  sky130_fd_sc_hd__inv_1 g1200(.A (n_60), .Y (A_next[7]));
  sky130_fd_sc_hd__inv_1 g1201(.A (n_59), .Y (A_next[15]));
  sky130_fd_sc_hd__inv_1 g1202(.A (n_58), .Y (A_next[10]));
  sky130_fd_sc_hd__inv_1 g1203(.A (n_57), .Y (A_next[5]));
  sky130_fd_sc_hd__inv_1 g1204(.A (n_56), .Y (A_next[4]));
  sky130_fd_sc_hd__a222oi_1 g1205__2346(.A1 (operands_bits_A[6]), .A2
       (n_47), .B1 (B_reg[6]), .B2 (n_46), .C1 (A_mux_sel[1]), .C2
       (n_93), .Y (n_63));
  sky130_fd_sc_hd__a222oi_1 g1206__1666(.A1 (operands_bits_A[13]), .A2
       (n_47), .B1 (B_reg[13]), .B2 (n_46), .C1 (A_mux_sel[1]), .C2
       (n_100), .Y (n_62));
  sky130_fd_sc_hd__a222oi_1 g1207__7410(.A1 (operands_bits_A[11]), .A2
       (n_47), .B1 (B_reg[11]), .B2 (n_46), .C1 (A_mux_sel[1]), .C2
       (n_98), .Y (n_61));
  sky130_fd_sc_hd__a222oi_1 g1208__6417(.A1 (operands_bits_A[7]), .A2
       (n_47), .B1 (B_reg[7]), .B2 (n_46), .C1 (A_mux_sel[1]), .C2
       (n_94), .Y (n_60));
  sky130_fd_sc_hd__a222oi_1 g1209__5477(.A1 (operands_bits_A[15]), .A2
       (n_47), .B1 (B_reg[15]), .B2 (n_46), .C1 (n_102), .C2
       (A_mux_sel[1]), .Y (n_59));
  sky130_fd_sc_hd__a222oi_1 g1210__2398(.A1 (operands_bits_A[10]), .A2
       (n_47), .B1 (B_reg[10]), .B2 (n_46), .C1 (A_mux_sel[1]), .C2
       (n_97), .Y (n_58));
  sky130_fd_sc_hd__a222oi_1 g1211__5107(.A1 (operands_bits_A[5]), .A2
       (n_47), .B1 (B_reg[5]), .B2 (n_46), .C1 (A_mux_sel[1]), .C2
       (n_92), .Y (n_57));
  sky130_fd_sc_hd__a222oi_1 g1212__6260(.A1 (operands_bits_A[4]), .A2
       (n_47), .B1 (B_reg[4]), .B2 (n_46), .C1 (A_mux_sel[1]), .C2
       (n_91), .Y (n_56));
  sky130_fd_sc_hd__inv_1 g1213(.A (n_55), .Y (A_next[12]));
  sky130_fd_sc_hd__inv_1 g1214(.A (n_54), .Y (A_next[9]));
  sky130_fd_sc_hd__inv_1 g1215(.A (n_53), .Y (A_next[3]));
  sky130_fd_sc_hd__inv_1 g1216(.A (n_52), .Y (A_next[2]));
  sky130_fd_sc_hd__inv_1 g1217(.A (n_51), .Y (A_next[14]));
  sky130_fd_sc_hd__inv_1 g1218(.A (n_50), .Y (A_next[1]));
  sky130_fd_sc_hd__inv_1 g1219(.A (n_49), .Y (A_next[8]));
  sky130_fd_sc_hd__inv_1 g1220(.A (n_48), .Y (A_next[0]));
  sky130_fd_sc_hd__a222oi_1 g1221__4319(.A1 (operands_bits_A[12]), .A2
       (n_47), .B1 (B_reg[12]), .B2 (n_46), .C1 (A_mux_sel[1]), .C2
       (n_99), .Y (n_55));
  sky130_fd_sc_hd__a222oi_1 g1222__8428(.A1 (operands_bits_A[9]), .A2
       (n_47), .B1 (B_reg[9]), .B2 (n_46), .C1 (A_mux_sel[1]), .C2
       (n_96), .Y (n_54));
  sky130_fd_sc_hd__a222oi_1 g1223__5526(.A1 (operands_bits_A[3]), .A2
       (n_47), .B1 (B_reg[3]), .B2 (n_46), .C1 (A_mux_sel[1]), .C2
       (n_90), .Y (n_53));
  sky130_fd_sc_hd__a222oi_1 g1224__6783(.A1 (operands_bits_A[2]), .A2
       (n_47), .B1 (B_reg[2]), .B2 (n_46), .C1 (A_mux_sel[1]), .C2
       (n_89), .Y (n_52));
  sky130_fd_sc_hd__a222oi_1 g1225__3680(.A1 (operands_bits_A[14]), .A2
       (n_47), .B1 (B_reg[14]), .B2 (n_46), .C1 (A_mux_sel[1]), .C2
       (n_101), .Y (n_51));
  sky130_fd_sc_hd__a222oi_1 g1226__1617(.A1 (operands_bits_A[1]), .A2
       (n_47), .B1 (B_reg[1]), .B2 (n_46), .C1 (A_mux_sel[1]), .C2
       (n_88), .Y (n_50));
  sky130_fd_sc_hd__a222oi_1 g1227__2802(.A1 (operands_bits_A[8]), .A2
       (n_47), .B1 (B_reg[8]), .B2 (n_46), .C1 (A_mux_sel[1]), .C2
       (n_95), .Y (n_49));
  sky130_fd_sc_hd__a222oi_1 g1228__1705(.A1 (operands_bits_A[0]), .A2
       (n_47), .B1 (B_reg[0]), .B2 (n_46), .C1 (A_mux_sel[1]), .C2
       (n_87), .Y (n_48));
  sky130_fd_sc_hd__mux2_2 g1229__5122(.A0 (operands_bits_B[11]), .A1
       (n_86), .S (A_mux_sel[0]), .X (B_next[11]));
  sky130_fd_sc_hd__mux2_2 g1230__8246(.A0 (operands_bits_B[14]), .A1
       (A_reg[14]), .S (A_mux_sel[0]), .X (B_next[14]));
  sky130_fd_sc_hd__mux2_2 g1231__7098(.A0 (operands_bits_B[13]), .A1
       (A_reg[13]), .S (A_mux_sel[0]), .X (B_next[13]));
  sky130_fd_sc_hd__mux2_2 g1232__6131(.A0 (operands_bits_B[12]), .A1
       (A_reg[12]), .S (A_mux_sel[0]), .X (B_next[12]));
  sky130_fd_sc_hd__mux2_2 g1233__1881(.A0 (operands_bits_B[15]), .A1
       (A_reg[15]), .S (A_mux_sel[0]), .X (B_next[15]));
  sky130_fd_sc_hd__mux2_2 g1234__5115(.A0 (operands_bits_B[10]), .A1
       (A_reg[10]), .S (A_mux_sel[0]), .X (B_next[10]));
  sky130_fd_sc_hd__mux2_2 g1235__7482(.A0 (operands_bits_B[9]), .A1
       (A_reg[9]), .S (A_mux_sel[0]), .X (B_next[9]));
  sky130_fd_sc_hd__mux2_2 g1236__4733(.A0 (operands_bits_B[8]), .A1
       (A_reg[8]), .S (A_mux_sel[0]), .X (B_next[8]));
  sky130_fd_sc_hd__mux2_2 g1237__6161(.A0 (operands_bits_B[3]), .A1
       (n_82), .S (A_mux_sel[0]), .X (B_next[3]));
  sky130_fd_sc_hd__mux2_2 g1238__9315(.A0 (operands_bits_B[6]), .A1
       (n_84), .S (A_mux_sel[0]), .X (B_next[6]));
  sky130_fd_sc_hd__mux2_2 g1239__9945(.A0 (operands_bits_B[5]), .A1
       (n_83), .S (A_mux_sel[0]), .X (B_next[5]));
  sky130_fd_sc_hd__mux2_2 g1240__2883(.A0 (operands_bits_B[4]), .A1
       (A_reg[4]), .S (A_mux_sel[0]), .X (B_next[4]));
  sky130_fd_sc_hd__mux2_2 g1241__2346(.A0 (operands_bits_B[7]), .A1
       (n_85), .S (A_mux_sel[0]), .X (B_next[7]));
  sky130_fd_sc_hd__mux2_2 g1242__1666(.A0 (operands_bits_B[2]), .A1
       (n_81), .S (A_mux_sel[0]), .X (B_next[2]));
  sky130_fd_sc_hd__mux2_2 g1243__7410(.A0 (operands_bits_B[1]), .A1
       (n_80), .S (A_mux_sel[0]), .X (B_next[1]));
  sky130_fd_sc_hd__mux2_2 g1244__6417(.A0 (operands_bits_B[0]), .A1
       (A_reg[0]), .S (A_mux_sel[0]), .X (B_next[0]));
  sky130_fd_sc_hd__and2b_1 g1245__5477(.A_N (A_mux_sel[1]), .B (n_45),
       .X (n_47));
  sky130_fd_sc_hd__nor2_1 g1246__2398(.A (A_mux_sel[1]), .B (n_45), .Y
       (n_46));
  sky130_fd_sc_hd__inv_2 g1247(.A (A_mux_sel[0]), .Y (n_45));
  sky130_fd_sc_hd__a31oi_1 g1317__5107(.A1 (n_44), .A2 (n_32), .A3
       (n_10), .B1 (n_39), .Y (A_lt_B));
  sky130_fd_sc_hd__o311ai_1 g1318__6260(.A1 (n_18), .A2 (n_13), .A3
       (n_42), .B1 (n_16), .C1 (n_29), .Y (n_44));
  sky130_fd_sc_hd__nor4_1 g1319__4319(.A (B_reg[13]), .B (B_reg[15]),
       .C (B_reg[12]), .D (n_43), .Y (B_zero));
  sky130_fd_sc_hd__or4_1 g1320__8428(.A (B_reg[14]), .B (B_reg[5]), .C
       (B_reg[8]), .D (n_40), .X (n_43));
  sky130_fd_sc_hd__a311oi_1 g1321__5526(.A1 (n_41), .A2 (n_22), .A3
       (n_15), .B1 (n_17), .C1 (n_31), .Y (n_42));
  sky130_fd_sc_hd__o311ai_1 g1322__6783(.A1 (n_21), .A2 (n_24), .A3
       (n_36), .B1 (n_27), .C1 (n_38), .Y (n_41));
  sky130_fd_sc_hd__or4_1 g1323__3680(.A (B_reg[10]), .B (B_reg[11]), .C
       (B_reg[4]), .D (n_37), .X (n_40));
  sky130_fd_sc_hd__o2111ai_1 g1324__1617(.A1 (B_reg[13]), .A2 (n_0),
       .B1 (n_20), .C1 (n_30), .D1 (n_34), .Y (n_39));
  sky130_fd_sc_hd__a21oi_1 g1325__2802(.A1 (n_1), .A2 (n_85), .B1
       (n_35), .Y (n_38));
  sky130_fd_sc_hd__or4_1 g1326__1705(.A (B_reg[6]), .B (B_reg[7]), .C
       (B_reg[9]), .D (n_26), .X (n_37));
  sky130_fd_sc_hd__o311ai_1 g1327__5122(.A1 (n_19), .A2 (n_7), .A3
       (n_33), .B1 (n_11), .C1 (n_8), .Y (n_36));
  sky130_fd_sc_hd__a21oi_1 g1328__8246(.A1 (n_28), .A2 (n_9), .B1
       (n_24), .Y (n_35));
  sky130_fd_sc_hd__nand3b_1 g1329__7098(.A_N (B_reg[12]), .B (n_32), .C
       (A_reg[12]), .Y (n_34));
  sky130_fd_sc_hd__a222oi_1 g1330__6131(.A1 (B_reg[1]), .A2 (n_6), .B1
       (B_reg[2]), .B2 (n_4), .C1 (n_25), .C2 (B_reg[0]), .Y (n_33));
  sky130_fd_sc_hd__and3b_1 g1331__1881(.A_N (B_reg[8]), .B (n_22), .C
       (A_reg[8]), .X (n_31));
  sky130_fd_sc_hd__nand3b_1 g1332__5115(.A_N (B_reg[14]), .B (n_14), .C
       (A_reg[14]), .Y (n_30));
  sky130_fd_sc_hd__a21oi_1 g1334__7482(.A1 (n_5), .A2 (B_reg[13]), .B1
       (n_23), .Y (n_32));
  sky130_fd_sc_hd__or3b_1 g1335__4733(.A (B_reg[10]), .B (n_13), .C_N
       (A_reg[10]), .X (n_29));
  sky130_fd_sc_hd__or3b_1 g1336__6161(.A (B_reg[4]), .B (n_21), .C_N
       (A_reg[4]), .X (n_28));
  sky130_fd_sc_hd__nand3b_1 g1337__9315(.A_N (B_reg[6]), .B (n_12), .C
       (n_84), .Y (n_27));
  sky130_fd_sc_hd__or4_1 g1338__9945(.A (B_reg[0]), .B (B_reg[3]), .C
       (B_reg[1]), .D (B_reg[2]), .X (n_26));
  sky130_fd_sc_hd__o21ba_1 g1339__2883(.A1 (B_reg[1]), .A2 (n_6), .B1_N
       (A_reg[0]), .X (n_25));
  sky130_fd_sc_hd__o21ai_1 g1341__2346(.A1 (n_84), .A2 (n_2), .B1
       (n_12), .Y (n_24));
  sky130_fd_sc_hd__o21ai_1 g1342__1666(.A1 (A_reg[14]), .A2 (n_3), .B1
       (n_14), .Y (n_23));
  sky130_fd_sc_hd__nand2b_1 g1343__7410(.A_N (B_reg[15]), .B
       (A_reg[15]), .Y (n_20));
  sky130_fd_sc_hd__nor2_1 g1344__6417(.A (B_reg[2]), .B (n_4), .Y
       (n_19));
  sky130_fd_sc_hd__nor2b_1 g1345__5477(.A (A_reg[10]), .B_N
       (B_reg[10]), .Y (n_18));
  sky130_fd_sc_hd__nor2b_1 g1346__2398(.A (B_reg[9]), .B_N (A_reg[9]),
       .Y (n_17));
  sky130_fd_sc_hd__nand2b_1 g1347__5107(.A_N (B_reg[11]), .B (n_86), .Y
       (n_16));
  sky130_fd_sc_hd__nand2b_1 g1348__6260(.A_N (A_reg[8]), .B (B_reg[8]),
       .Y (n_15));
  sky130_fd_sc_hd__nand2b_1 g1349__4319(.A_N (A_reg[9]), .B (B_reg[9]),
       .Y (n_22));
  sky130_fd_sc_hd__nor2b_1 g1350__8428(.A (n_83), .B_N (B_reg[5]), .Y
       (n_21));
  sky130_fd_sc_hd__nand2b_1 g1351__5526(.A_N (n_82), .B (B_reg[3]), .Y
       (n_11));
  sky130_fd_sc_hd__nand2b_1 g1352__6783(.A_N (A_reg[12]), .B
       (B_reg[12]), .Y (n_10));
  sky130_fd_sc_hd__nand2b_1 g1353__3680(.A_N (B_reg[5]), .B (n_83), .Y
       (n_9));
  sky130_fd_sc_hd__nand2b_1 g1354__1617(.A_N (A_reg[4]), .B (B_reg[4]),
       .Y (n_8));
  sky130_fd_sc_hd__nor2b_1 g1355__2802(.A (B_reg[3]), .B_N (n_82), .Y
       (n_7));
  sky130_fd_sc_hd__nand2b_1 g1356__1705(.A_N (A_reg[15]), .B
       (B_reg[15]), .Y (n_14));
  sky130_fd_sc_hd__nor2b_1 g1357__5122(.A (n_86), .B_N (B_reg[11]), .Y
       (n_13));
  sky130_fd_sc_hd__nand2b_1 g1358__8246(.A_N (n_85), .B (B_reg[7]), .Y
       (n_12));
  sky130_fd_sc_hd__inv_2 g1359(.A (n_80), .Y (n_6));
  sky130_fd_sc_hd__inv_2 g1360(.A (A_reg[13]), .Y (n_5));
  sky130_fd_sc_hd__inv_2 g1361(.A (n_81), .Y (n_4));
  sky130_fd_sc_hd__inv_1 g1362(.A (B_reg[14]), .Y (n_3));
  sky130_fd_sc_hd__inv_1 g1363(.A (B_reg[6]), .Y (n_2));
  sky130_fd_sc_hd__inv_1 g1364(.A (B_reg[7]), .Y (n_1));
  sky130_fd_sc_hd__nand2b_1 g2__7098(.A_N (n_23), .B (A_reg[13]), .Y
       (n_0));
  sky130_fd_sc_hd__xnor2_1 sub_45_24_g436__6131(.A (sub_45_24_n_16), .B
       (sub_45_24_n_44), .Y (n_102));
  sky130_fd_sc_hd__fa_1 sub_45_24_g437__1881(.A (A_reg[14]), .B
       (sub_45_24_n_11), .CIN (sub_45_24_n_42), .COUT (sub_45_24_n_44),
       .SUM (n_101));
  sky130_fd_sc_hd__fa_1 sub_45_24_g438__5115(.A (A_reg[13]), .B
       (sub_45_24_n_0), .CIN (sub_45_24_n_40), .COUT (sub_45_24_n_42),
       .SUM (n_100));
  sky130_fd_sc_hd__fa_1 sub_45_24_g439__7482(.A (A_reg[12]), .B
       (sub_45_24_n_9), .CIN (sub_45_24_n_38), .COUT (sub_45_24_n_40),
       .SUM (n_99));
  sky130_fd_sc_hd__fa_1 sub_45_24_g440__4733(.A (A_reg[11]), .B
       (sub_45_24_n_5), .CIN (sub_45_24_n_36), .COUT (sub_45_24_n_38),
       .SUM (n_98));
  sky130_fd_sc_hd__fa_1 sub_45_24_g441__6161(.A (A_reg[10]), .B
       (sub_45_24_n_4), .CIN (sub_45_24_n_34), .COUT (sub_45_24_n_36),
       .SUM (n_97));
  sky130_fd_sc_hd__fa_1 sub_45_24_g442__9315(.A (A_reg[9]), .B
       (sub_45_24_n_6), .CIN (sub_45_24_n_32), .COUT (sub_45_24_n_34),
       .SUM (n_96));
  sky130_fd_sc_hd__fa_1 sub_45_24_g443__9945(.A (A_reg[8]), .B
       (sub_45_24_n_8), .CIN (sub_45_24_n_30), .COUT (sub_45_24_n_32),
       .SUM (n_95));
  sky130_fd_sc_hd__fa_1 sub_45_24_g444__2883(.A (A_reg[7]), .B
       (sub_45_24_n_3), .CIN (sub_45_24_n_28), .COUT (sub_45_24_n_30),
       .SUM (n_94));
  sky130_fd_sc_hd__fa_1 sub_45_24_g445__2346(.A (A_reg[6]), .B
       (sub_45_24_n_2), .CIN (sub_45_24_n_26), .COUT (sub_45_24_n_28),
       .SUM (n_93));
  sky130_fd_sc_hd__fa_1 sub_45_24_g446__1666(.A (A_reg[5]), .B
       (sub_45_24_n_12), .CIN (sub_45_24_n_24), .COUT (sub_45_24_n_26),
       .SUM (n_92));
  sky130_fd_sc_hd__fa_1 sub_45_24_g447__7410(.A (A_reg[4]), .B
       (sub_45_24_n_13), .CIN (sub_45_24_n_22), .COUT (sub_45_24_n_24),
       .SUM (n_91));
  sky130_fd_sc_hd__fa_1 sub_45_24_g448__6417(.A (A_reg[3]), .B
       (sub_45_24_n_1), .CIN (sub_45_24_n_20), .COUT (sub_45_24_n_22),
       .SUM (n_90));
  sky130_fd_sc_hd__fa_1 sub_45_24_g449__5477(.A (A_reg[2]), .B
       (sub_45_24_n_7), .CIN (sub_45_24_n_18), .COUT (sub_45_24_n_20),
       .SUM (n_89));
  sky130_fd_sc_hd__fa_1 sub_45_24_g450__2398(.A (A_reg[1]), .B
       (sub_45_24_n_10), .CIN (sub_45_24_n_15), .COUT (sub_45_24_n_18),
       .SUM (n_88));
  sky130_fd_sc_hd__o21ai_1 sub_45_24_g451__5107(.A1 (B_reg[0]), .A2
       (sub_45_24_n_14), .B1 (sub_45_24_n_15), .Y (n_87));
  sky130_fd_sc_hd__xor2_1 sub_45_24_g452__6260(.A (B_reg[15]), .B
       (A_reg[15]), .X (sub_45_24_n_16));
  sky130_fd_sc_hd__nand2_1 sub_45_24_g453__4319(.A (sub_45_24_n_14), .B
       (B_reg[0]), .Y (sub_45_24_n_15));
  sky130_fd_sc_hd__clkinv_1 sub_45_24_g454(.A (A_reg[0]), .Y
       (sub_45_24_n_14));
  sky130_fd_sc_hd__inv_2 sub_45_24_g455(.A (B_reg[4]), .Y
       (sub_45_24_n_13));
  sky130_fd_sc_hd__inv_2 sub_45_24_g456(.A (B_reg[5]), .Y
       (sub_45_24_n_12));
  sky130_fd_sc_hd__inv_2 sub_45_24_g457(.A (B_reg[14]), .Y
       (sub_45_24_n_11));
  sky130_fd_sc_hd__inv_2 sub_45_24_g458(.A (B_reg[1]), .Y
       (sub_45_24_n_10));
  sky130_fd_sc_hd__inv_2 sub_45_24_g459(.A (B_reg[12]), .Y
       (sub_45_24_n_9));
  sky130_fd_sc_hd__inv_2 sub_45_24_g460(.A (B_reg[8]), .Y
       (sub_45_24_n_8));
  sky130_fd_sc_hd__inv_2 sub_45_24_g461(.A (B_reg[2]), .Y
       (sub_45_24_n_7));
  sky130_fd_sc_hd__inv_2 sub_45_24_g462(.A (B_reg[9]), .Y
       (sub_45_24_n_6));
  sky130_fd_sc_hd__inv_2 sub_45_24_g463(.A (B_reg[11]), .Y
       (sub_45_24_n_5));
  sky130_fd_sc_hd__inv_2 sub_45_24_g464(.A (B_reg[10]), .Y
       (sub_45_24_n_4));
  sky130_fd_sc_hd__inv_2 sub_45_24_g465(.A (B_reg[7]), .Y
       (sub_45_24_n_3));
  sky130_fd_sc_hd__inv_2 sub_45_24_g466(.A (B_reg[6]), .Y
       (sub_45_24_n_2));
  sky130_fd_sc_hd__inv_2 sub_45_24_g467(.A (B_reg[3]), .Y
       (sub_45_24_n_1));
  sky130_fd_sc_hd__inv_2 sub_45_24_g468(.A (B_reg[13]), .Y
       (sub_45_24_n_0));
endmodule

module gcd(clk, reset, operands_bits_A, operands_bits_B, operands_val,
     operands_rdy, result_bits_data, result_val, result_rdy);
  input clk, reset, operands_val, result_rdy;
  input [15:0] operands_bits_A, operands_bits_B;
  output operands_rdy, result_val;
  output [15:0] result_bits_data;
  wire clk, reset, operands_val, result_rdy;
  wire [15:0] operands_bits_A, operands_bits_B;
  wire operands_rdy, result_val;
  wire [15:0] result_bits_data;
  wire [1:0] A_mux_sel;
  wire A_en, A_lt_B, B_en, B_zero, UNCONNECTED2, UNCONNECTED3,
       logic_0_1_net;
  gcd_control GCDctrl0(.clk (clk), .reset (reset), .operands_val
       (operands_val), .result_rdy (result_rdy), .B_zero (B_zero),
       .A_lt_B (A_lt_B), .result_val (result_val), .operands_rdy
       (operands_rdy), .A_mux_sel (A_mux_sel), .B_mux_sel
       (UNCONNECTED2), .A_en (A_en), .B_en (B_en));
  gcd_datapath_W16 GCDdpath0(.operands_bits_A (operands_bits_A),
       .operands_bits_B (operands_bits_B), .result_bits_data
       (result_bits_data), .clk (clk), .reset (reset), .B_mux_sel
       (logic_0_1_net), .A_en (A_en), .B_en (B_en), .A_mux_sel
       (A_mux_sel), .B_zero (B_zero), .A_lt_B (A_lt_B));
  sky130_fd_sc_hd__conb_1 tie_0_cell(.HI (UNCONNECTED3), .LO
       (logic_0_1_net));
endmodule
