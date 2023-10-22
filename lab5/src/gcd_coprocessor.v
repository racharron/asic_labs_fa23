//=========================================================================
// Template for GCD coprocessor
//-------------------------------------------------------------------------
//

module gcd_coprocessor #( parameter W = 32 ) (
  input clk,
  input reset,

  input operands_val,
  input [W-1:0] operands_bits_A,
  input [W-1:0] operands_bits_B,
  output operands_rdy,

  output result_val,
  output [W-1:0] result_bits,
  input result_rdy

);

// You should be able to build this with mostly structural verilog!

// Define wires
wire operands_availible, operands_requested;
wire [W-1:0] op_A;
wire [W-1:0] op_B;
wire result_availible, result_requested;
wire [W-1:0] res;
wire B_mux_sel, A_en, B_en;
wire [1:0] A_mux_sel;
wire B_zero;
wire A_lt_B;

// Instantiate gcd_datapath
gcd_datapath#(W) datapath( 

	//data inputs/outputs
	.operands_bits_A(op_A),
	.operands_bits_B(op_B),
	.result_bits_data(res),

	//global inputs
	.clk(clk), .reset(reset),

	//control signal inputs and outputs
	.B_mux_sel(B_mux_sel),
  .A_en(A_en),
  .B_en(B_en),
	.A_mux_sel(A_mux_sel),
	.B_zero(B_zero),
	.A_lt_B(A_lt_B)
);
// Instantiate gcd_control
gcd_control control
( 
	.clk(clk), .reset(reset),
  .operands_val(operands_availible),
  .result_rdy(result_requested),
	.B_zero(B_zero), .A_lt_B(A_lt_B),
	.result_val(result_availible),
  .operands_rdy(operands_requested),
	.A_mux_sel(A_mux_sel),
	.B_mux_sel(B_mux_sel), .A_en(A_en), .B_en(B_en)
);
// Instantiate request FIFO
fifo#(2*W, 2) op_q(
  .clk(clk),
  .reset(reset),

  .enq_val(operands_val),
  .enq_data({operands_bits_A, operands_bits_B}),
  .enq_rdy(operands_rdy),

  .deq_val(operands_availible),
  .deq_data({op_A, op_B}),
  .deq_rdy(operands_requested)
);
// Instantiate response FIFO
fifo#(W, 2) res_q(
  .clk(clk),
  .reset(reset),

  .enq_val(result_availible),
  .enq_data(res),
  .enq_rdy(result_requested),

  .deq_val(result_val),
  .deq_data(result_bits),
  .deq_rdy(result_rdy)
);

endmodule
