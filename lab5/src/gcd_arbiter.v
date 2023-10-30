module gcd_arbiter #(parameter W = 32, parameter N = 2) (
  input clk,
  input reset,

  // this will be connected to the input FIFO
  input operands_val,
  input [W-1:0] operands_bits_A,
  input [W-1:0] operands_bits_B,
  output operands_rdy,

  output request_val [N-1:0],
  output [W-1:0] request_operands_bits_A,
  output [W-1:0] request_operands_bits_B,
  input request_rdy [N-1:0],

  // This will be connected to the output FIFO
  output result_val,
  output [W-1:0] result_bits_data,
  input result_rdy,

  input response_val [N-1:0],
  input [W-1:0] response_result_bits_data [N-1:0],
  output response_rdy [N-1:0]
);

genvar i;

assign operands_rdy = 1'b0;
generate
  for (i = 0; i < N; i = i + 1) begin
    assign request_val[i] = 1'b0;
    assign response_rdy[i] = 1'b0;
  end
endgenerate
assign request_operands_bits_A = {W{1'b0}};
assign request_operands_bits_B = {W{1'b0}};
assign result_val = 1'b0;
assign result_bits_data = {W{1'b0}};

endmodule
