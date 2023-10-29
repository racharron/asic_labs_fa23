`timescale 1 ns /  1 ps

module dut_tb ();
  reg clk;
  reg a, b;
  wire x, y;
  
  dut d(a, b, clk, x, y);

  initial clk = 1'b0;
  always #(`CLOCK_PERIOD/2) clk <= ~clk;

  initial begin
    $vcdpluson;
    a = 1'b0;
    b = 1'b0;
    @(posedge clk);
    @(posedge clk);
    #(`CLOCK_PERIOD/4);
    b = 1'b1;
    #(`CLOCK_PERIOD/2);
    a = 1'b1;
    #(`CLOCK_PERIOD/2);
    a = 1'b0;
    @(negedge clk);
    @(negedge clk);
    b = 1'b0;
    @(posedge clk);
    @(posedge clk);
    $vcdplusoff;
    $finish;
  end
endmodule

module dut (
  input A, B, clk,
  output reg X, Z
);
  always @(posedge clk) begin
    X <= B;
    Z <= (Z & X) | A;
  end
endmodule
