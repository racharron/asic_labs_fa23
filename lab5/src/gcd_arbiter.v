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

//  Used to indicate the length of a unit identifier
localparam U = $clog2(N);

genvar i, j;

// Keep track of which GCD unit you will enqueue to next
// reg available [N-1:0] = 0;

// Wires and assignments go here
// Hint: Most of your code will be assignments
reg enqueue;
reg dequeue;
reg can_enqueue;
reg can_dequeue;
reg [U-1:0] queue_input, queue_output;
wire blocked [N-1:0];
wire [N-1:0] request_rdy_bus;
// wire [N-1:0] blocked_bus;
wire [N-1:0] active;
wire [U-1:0] ids [N];
wire [N-1:0] active_ids [U];

// Keep track of which GCD unit you will dequeue from next
fifo#(U, U) queue (
  .clk(clk),
  .reset(reset),

  .enq_val(enqueue),
  .enq_data(queue_input),
  .enq_rdy(can_enqueue),

  .deq_val(can_dequeue),
  .deq_data(queue_output),
  .deq_rdy(dequeue)
);

// Define our "fire" wires
wire operands_fire, request_fire[N-1:0], result_fire, response_fire[N-1:0];

assign blocked[0] = 0;
generate
  for (i = 1; i < N; i = i + 1) begin
    assign blocked[i] = blocked[i-1] | request_rdy[i-1];
  end
endgenerate
generate
  for (i = 0; i < N; i = i + 1) begin
    assign request_rdy_bus[i] = request_rdy[i];
    // assign blocked_bus[i] = blocked[i];
    assign request_val[i] = can_enqueue & !blocked[i] & operands_val;
    assign response_rdy[i] = (queue_output == i) & result_fire;
    assign active[i] = !blocked[i] & request_rdy[i] & operands_val;
    assign ids[i] = i;
    for (j = 0; j < U; j = j + 1) begin
      assign active_ids[j][i] = active[i] & ids[i][j];
    end
  end
endgenerate
generate
  for (i = 0; i < U; i = i + 1) begin
    assign queue_input[i] = |active_ids[i];
  end
endgenerate

assign operands_fire = (|request_rdy_bus) & can_enqueue;

assign operands_rdy = operands_fire;
assign result_val = result_fire;

assign request_operands_bits_A = operands_bits_A;
assign request_operands_bits_B = operands_bits_B;

assign result_fire = can_dequeue & response_val[queue_output] & result_rdy;

assign result_bits_data = response_result_bits_data[queue_output];

assign enqueue = |active;

assign dequeue = result_fire;

// assign enqueue = operands_val & |(!blocked_bus & request_rdy_bus);

// Sequential logic goes here
// Be sure to implement reset! Look at fifo.v for an example
/*
generate
  for (i = 0; i < N; i = i + 1) begin
    always @(posedge clk) begin
      if (active[i]) begin
        queue_input <= i;
        enqueue <= 1;
      end
    end
  end
endgenerate

integer n;

always @(posedge clk) begin
  if (reset) begin
    // queue_input <= 0;
    // enqueue = 0;
  end else begin
    // enqueue <= operands_val & |(!blocked_bus & request_rdy_bus);
    / *
    for (n = 0; (n < N) & !flag; n = n + 1) begin
      if (!blocked[n] & request_rdy[n] & operands_val) begin
        queue_input <= n;
        enqueue <= 1;
      end
    end
    * /
    if (!|active) begin
      // enqueue <= 0;
      // queue_input <= 0;
    end
    / *if (!blocked[N-1] | !operands_val) begin
      enqueue <= 0;
    end* /
  end
end
*/

endmodule
