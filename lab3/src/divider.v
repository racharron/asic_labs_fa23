`include "/home/ff/eecs151/verilog_lib/EECS151.v"

module divider #(
    WIDTH = 4
) (
  input clk,

  input start,
  output done,

  input [WIDTH-1:0] dividend,
  input [WIDTH-1:0] divisor,
  output reg [WIDTH-1:0] quotient,
  output [WIDTH-1:0] remainder
);

  // Feel free to change the code as long as your final code implements a divider
  // Check the algorithm described in the slides (URL in the spec)
  // Pay attention to the block diagram(s)

  reg [2*WIDTH-1:0] long_remainder;
  wire [2*WIDTH-1:0] shifted_remainder;
  wire [WIDTH-1:0] left_half;
  wire [WIDTH-1:0] subtracted;
  wire sub_negative;
  reg [$clog2(WIDTH+1)-1:0] iteration;

  assign remainder = left_half;
  assign done = iteration == WIDTH;

  assign shifted_remainder = {long_remainder[2*WIDTH-2:0], 1'b0};
  assign left_half = long_remainder[2*WIDTH-1:WIDTH];
  assign {sub_negative, subtracted} = {1'b0, shifted_remainder[2*WIDTH-1:WIDTH]} - {1'b0, divisor};

  always @(posedge clk ) begin
    if (start) begin
      long_remainder <= {{WIDTH{1'b0}}, dividend};
      iteration <= 0;
      quotient <= 0;
    end else if (!done) begin
      iteration <= iteration + 1;
      quotient <= {quotient[WIDTH-2:0], !sub_negative};
      if (sub_negative) begin
        if (iteration != WIDTH - 1) begin
          long_remainder <= shifted_remainder;
        end
      end else begin
        long_remainder <= {subtracted, shifted_remainder[WIDTH-1:0]};
      end
    end
  end

endmodule
