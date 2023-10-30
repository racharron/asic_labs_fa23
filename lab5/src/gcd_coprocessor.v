//=========================================================================
// Template for GCD coprocessor
//-------------------------------------------------------------------------
//

module gcd_coprocessor #( parameter W = 32, parameter P = 2 ) (
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
wire execute [P-1:0];
wire accepting [P-1:0];
wire done [P-1:0];
wire accepted [P-1:0];

wire [W-1:0] results [P-1:0];
wire [W-1:0] dispatch_A;
wire [W-1:0] dispatch_B;

gcd_unit#(W) units[P-1:0](
  .clk(clk),
  .reset(reset),

  .operands_val(execute),
  .operands_bits_A(dispatch_A),
  .operands_bits_B(dispatch_B),
  .operands_rdy(accepting),

  .result_val(done),
  .result_bits_data(results),
  .result_rdy(accepted)
);

gcd_arbiter#(W, P) arbiter(
  .clk(clk),
  .reset(reset),
  
  .operands_val(operands_val),
  .operands_bits_A(operands_bits_A),
  .operands_bits_B(operands_bits_B),
  .operands_rdy(operands_rdy),

  .request_val(execute),
  .request_operands_bits_A(dispatch_A),
  .request_operands_bits_B(dispatch_B),
  .request_rdy(accepting),

  .result_val(result_val),
  .result_bits_data(result_bits),
  .result_rdy(result_rdy),

  .response_val(done),
  .response_result_bits_data(results),
  .response_rdy(accepted)
);

endmodule
