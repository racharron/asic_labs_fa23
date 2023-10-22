//=========================================================================
// FIFO Template
//-------------------------------------------------------------------------
//
//`include "EECS151.v"

module fifo #(parameter WIDTH = 8, parameter LOGDEPTH = 3) (
    input clk,
    input reset,

    input enq_val,
    input [WIDTH-1:0] enq_data,
    output enq_rdy,

    output deq_val,
    output [WIDTH-1:0] deq_data,
    input deq_rdy

);

localparam DEPTH = (1 << LOGDEPTH);

// the buffer itself. Take note of the 2D syntax.
reg [WIDTH-1:0] buffer [DEPTH-1:0];
// read pointer, write pointer
reg [LOGDEPTH-1:0] rptr, wptr;
// is the buffer full? This is needed for when rptr == wptr
reg full;

// Define any additional regs or wires you need (if any) here
wire empty;
wire [LOGDEPTH-1:0] next;
wire behind = next == rptr;

// use "fire" to indicate when a valid transaction has been made
wire enq_fire;
wire deq_fire;

assign enq_fire = enq_val & enq_rdy;
assign deq_fire = deq_val & deq_rdy;

assign next = wptr + 1;
assign empty = (rptr == wptr) && !full;

assign enq_rdy = !full;
assign deq_val = !empty;
assign deq_data = buffer[rptr];

always @(posedge clk) begin
    if (reset) begin
        wptr <= 0;
        rptr <= 0;
        full <= 0;
    end else begin
        if (enq_fire) begin
            buffer[wptr] <= enq_data;
            wptr <= wptr + 1;
        end
        if (deq_fire) begin
            rptr <= rptr + 1;
        end
        if (enq_fire && !deq_fire && behind) begin
            full <= 1;
        end
        if (!enq_fire && deq_fire) begin
            full <= 0;
        end
    end
end

FIFO_write_when_full:
assert property(
    @(posedge clk) disable iff (reset)
    full |=> $past(wptr) == wptr
)
else   $error("FIFO: writing when full");

FIFO_read_when_empty:
assert property(
    @(posedge clk) disable iff (reset)
    empty |=> $past(rptr) == rptr
)
else   $error("FIFO: reading when empty");

FIFO_reset_zero_rptr:
assert property(
    @(posedge clk)
    reset |=> rptr == 0
)
else   $error("FIFO: reset does not zero rptr");

FIFO_reset_zero_wptr:
assert property(
    @(posedge clk)
    reset |=> wptr == 0
)
else   $error("FIFO: reset does not zero wptr");

FIFO_reset_zero_full:
assert property(
    @(posedge clk)
    reset |=> full == 0
)
else   $error("FIFO: reset does not zero full");

endmodule
