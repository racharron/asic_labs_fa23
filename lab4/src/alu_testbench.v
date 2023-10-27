`timescale 1 ns / 100 ps

`include "alu_op.vh"

module alu_testbench;

  reg [31:0] a;
  reg [31:0] b;
  reg [3:0] op;
  reg [31:0] c;
  reg [31:0] expected;

  reg signed [31:0] as, bs;

  //--------------------------------------------------------------------
  // Setup a clock
  //--------------------------------------------------------------------
  reg clk = 0;
  //always #(`CLOCK_PERIOD/2) clk = ~clk;
  always #20 clk = ~clk; // 50Mhz

  reg run = 0;
  reg done = 0;

  integer i;
  integer error_count;
  integer shift_marker;
  localparam num_tests = 100;
  localparam shift_count = 10;

  reg [15:0] test_A [num_tests-1:0];
  reg [15:0] test_B [num_tests-1:0];
  reg [15:0] test_results [num_tests-1:0];
  
  genvar shift;

  alu ALU(a, b, op, c);

  // Apply stimulus
  initial begin
    shift_marker = 0;
    $vcdpluson;
    error_count = 0;
    op = `ALU_ADD;
    run = 1;
  end

  always @(posedge run) begin

    op = `ALU_ADD;
    for (i = 0; i < num_tests; i = i + 1) begin
      @(negedge clk);
      a = $random;
      b = $random;
      @(posedge clk)
      if (c == a + b) begin
        $display(" [ passed ] Addition Test ( %d ), [ %d + %d == %d ] (decimal)",i,a,b,c);
      end else begin
        $display(" [ failed ] Addition Test ( %d ), [ %d + %d == %d ] (decimal)",i,a,b,c);
        error_count = error_count + 1;
      end
    end
    op = `ALU_SUB;
    for (i = 0; i < num_tests; i = i + 1) begin
      @(negedge clk);
      a = $random;
      b = $random;
      @(posedge clk)
      if (c == a - b) begin
        $display(" [ passed ] Subtraction Test ( %d ), [ %d - %d == %d ] (decimal)",i,a,b,c);
      end else begin
        $display(" [ failed ] Subtraction Test ( %d ), [ %d - %d == %d ] (decimal)",i,a,b,c);
        error_count = error_count + 1;
      end
    end
    op = `ALU_AND;
    for (i = 0; i < num_tests; i = i + 1) begin
      @(negedge clk);
      a = $random;
      b = $random;
      expected = a & b;
      @(posedge clk)
      if (c == expected) begin
        $display(" [ passed ] Anding Test ( %d ), [ %b & %b == %b ] (decimal)",i,a,b,c);
      end else begin
        $display(" [ failed ] Anding Test ( %d ), [ %b & %b == %b ] (decimal)",i,a,b,c);
        $display("expected: %b", expected);
        $display("received: %b", c);
        error_count = error_count + 1;
      end
    end
    op = `ALU_OR;
    for (i = 0; i < num_tests; i = i + 1) begin
      @(negedge clk);
      a = $random;
      b = $random;
      @(posedge clk)
      if (c == a | b) begin
        $display(" [ passed ] Oring Test ( %d ), [ %b | %b == %b ] (decimal)",i,a,b,c);
      end else begin
        $display(" [ failed ] Oring Test ( %d ), [ %b | %b == %b ] (decimal)",i,a,b,c);
        error_count = error_count + 1;
      end
    end
    op = `ALU_XOR;
    for (i = 0; i < num_tests; i = i + 1) begin
      @(negedge clk);
      a = $random;
      b = $random;
      @(posedge clk)
      if (c == a ^ b) begin
        $display(" [ passed ] Xoring Test ( %d ), [ %b ^ %b == %b ] (decimal)",i,a,b,c);
      end else begin
        $display(" [ failed ] Xoring Test ( %d ), [ %b ^ %b == %b ] (decimal)",i,a,b,c);
        error_count = error_count + 1;
      end
    end
    op = `ALU_SLT;
    for (i = 0; i < num_tests; i = i + 1) begin
      @(negedge clk);
      a = $random;
      b = $random;
      as = a;
      bs = b;
      @(posedge clk)
      if (c == (as < bs) ? 1 : 0) begin
        $display(" [ passed ] Signed Comparison Test ( %D ), [ %d sltu %d == %d ] (decimal)",i,as,bs,c);
      end else begin
        $display(" [ failed ] Signed Comparison Test ( %D ), [ %d sltu %d == %d ] (decimal)",i,as,bs,c);
        error_count = error_count + 1;
      end
    end
    op = `ALU_SLTU;
    for (i = 0; i < num_tests; i = i + 1) begin
      @(negedge clk);
      a = $random;
      b = $random;
      @(posedge clk)
      if (c == (a < b) ? 1 : 0) begin
        $display(" [ passed ] Unsigned Comparison Test ( %d ), [ %d slt %d == %d ] (decimal)",i,a,b,c);
      end else begin
        $display(" [ failed ] Unsigned Comparison Test ( %d ), [ %d slt %d == %d ] (decimal)",i,a,b,c);
        error_count = error_count + 1;
      end
    end

    op = op + 1;
  end

  always @(posedge (shift_marker == 32)) begin
    op = op + 1;
    shift_marker = 0;
  end

  generate
    for (shift = 0; shift < 32; shift = shift + 1) begin
      always @(posedge ((op == `ALU_SLL) & (shift_marker == shift))) begin
        for (i = 0; i < shift_count; i = i + 1) begin
          @(negedge clk);
          a = $random;
          b = ($random << 5) + shift;
          expected = a << shift;
          @(posedge clk)
          if (c == expected) begin
            $display(" [ passed ] SLL Test ( %d ), [ %d << %d == %d ] (decimal)",i,a,b,c);
          end else begin
            $display(" [ failed ] SLL Test ( %d ), [ %d << %d == %d ] (decimal)",i,a,b,c);
            $display("amount: %d", b[4:0]);
            $display("expected: %d", expected);
            $display("received: %d", c);
            error_count = error_count + 1;
          end
        end
        shift_marker = shift_marker + 1;
      end
    end
  endgenerate

  generate
    for (shift = 0; shift < 32; shift = shift + 1) begin
      always @(posedge ((op == `ALU_SRA) & (shift_marker == shift))) begin
        for (i = 0; i < shift_count; i = i + 1) begin
          @(negedge clk);
          a = $random;
          b = ($random << 5) + shift;
          expected = a >> shift;
          @(posedge clk)
          if (c == expected) begin
            $display(" [ passed ] SRA Test ( %d ), [ %d >> %d == %d ] (decimal)",i,a,b,c);
          end else begin
            $display(" [ failed ] SRA Test ( %d ), [ %d >> %d == %d ] (decimal)",i,a,b,c);
            error_count = error_count + 1;
          end
        end
        shift_marker = shift_marker + 1;
      end
    end
  endgenerate

  generate
    for (shift = 0; shift < 32; shift = shift + 1) begin
      always @(posedge ((op == `ALU_SRL) & (shift_marker == shift))) begin
        for (i = 0; i < shift_count; i = i + 1) begin
          @(negedge clk);
          a = $random;
          b = ($random << 5) + shift;
          @(posedge clk)
          if (c == a >>> shift) begin
            $display(" [ passed ] SRL Test ( %d ), [ %d >>> %d == %d ] (decimal)",i,a,b,c);
          end else begin
            $display(" [ failed ] SRL Test ( %d ), [ %d >>> %d == %d ] (decimal)",i,a,b,c);
            error_count = error_count + 1;
          end
        end
        shift_marker = shift_marker + 1;
      end
    end
  endgenerate

  always @(posedge (op == `ALU_COPY_B)) begin
    for (i = 0; i < num_tests; i = i + 1) begin
      @(negedge clk);
      a = $random;
      b = $random;
      @(posedge clk)
      if (c == b) begin
        $display(" [ passed ] Copy B Test ( %d ), [ %d cpb %d == %d ] (decimal)",i,a,b,c);
      end else begin
        $display(" [ failed ] Copy B Test ( %d ), [ %d cpb %d == %d ] (decimal)",i,a,b,c);
        error_count = error_count + 1;
      end
    end
    op = `ALU_XXX;
    for (i = 0; i < num_tests; i = i + 1) begin
      @(negedge clk);
      a = $random;
      b = $random;
      @(posedge clk)
      if (c == 0) begin
        $display(" [ passed ] Zero Test ( %d ), [ %d zero %d == %d ] (decimal)",i,a,b,c);
      end else begin
        $display(" [ failed ] Zero Test ( %d ), [ %d zero %d == %d ] (decimal)",i,a,b,c);
        error_count = error_count + 1;
      end
    end
    done = 1;
  end

  always @(posedge done) begin
    $display("Error Count: %d", error_count);

    $vcdplusoff;
    $finish;
  end

endmodule
