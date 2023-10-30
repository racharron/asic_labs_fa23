`timescale 1 ns /  100 ps

module gcd_testbench;

  localparam integer WIDTH = 4;

  reg clk = 0;
  always #(`CLOCK_PERIOD/2) clk = ~clk;

  reg start;
  wire [WIDTH-1:0] dividend, divisor;
  wire [WIDTH-1:0] quotient, remainder;
  wire done;

  gcd #(.WIDTH(WIDTH)) gcd (
    .clk(clk),
    .start(start),
    .done(done),
    .dividend(dividend),
    .divisor(divisor),
    .quotient(quotient),
    .remainder(remainder)
  );

  reg [WIDTH:0] n, d;

  integer errc;

  assign dividend = n[WIDTH-1:0];
  assign divisor = d[WIDTH-1:0];

  /*
  always @(posedge clk) begin
    $display("At time %d: start %d, done %d, dividend %d, divisor %d, quotient %d, remainder %d",
      $time, start, done, dividend, divisor, quotient, remainder);
  end
  */
  always @(posedge (clk)) begin
    if (done & ! start & ((dividend / divisor != quotient) | (dividend % divisor != remainder))) begin
      $display("ERROR: %d / %d != %d rem %d", dividend, divisor, quotient, remainder);
      errc = errc + 1;
    end
  end

  initial begin
    $vcdpluson;
    errc = 0;
    start = 1'b0;
    @(posedge clk);
    @(negedge clk)

    for (n = 0; n < 2**WIDTH; n = n + 1) begin
      for (d = 1; d < 2**WIDTH; d = d + 1) begin
        start = 1'b1;
        @(negedge clk)
        start = 1'b0;
        @(posedge clk);
        while (!done) @(posedge clk);
        @(negedge clk);
      end
    end

    $display("ERROR COUNT: %d", errc);
    $vcdplusoff;
    $finish();
  end

  /*
  initial begin
    $vcdpluson;
    #0;
    start = 0;
    dividend = 0;
    divisor = 1;

    repeat (9) @(posedge clk);
    @(negedge clk);
    start = 1;
    dividend = 15;
    divisor = 1;

    @(negedge clk); start = 0; // 'start' is HIGH for one cycle
    @(posedge clk);

    // wait until 'done' is asserted
    while (done == 0) begin
      @(posedge clk);
    end
    $vcdplusoff;
    $finish();
  end
  */

endmodule
