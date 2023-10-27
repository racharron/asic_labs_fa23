// Implement a vector dot product of a and b
// using a single-port SRAM of 5-bit address width, 16-bit data width

module dot_product #(
  localparam ADDR_WIDTH = 5,
  localparam WIDTH = 32
) (
  input clk,
  input rst,

  input [ADDR_WIDTH:0] len,

  // input vector a
  input [WIDTH-1:0] a_data,
  input a_valid,
  output a_ready,

  // input vector b
  input [WIDTH-1:0] b_data,
  input b_valid,
  output b_ready,

  // dot product result c
  output [WIDTH-1:0] c_data,
  output reg c_valid,
  input c_ready
);

wire a_fire, b_fire, c_fire;
assign a_fire = a_valid && a_ready;
assign b_fire = b_valid && b_ready;
assign c_fire = c_valid && c_ready;

wire we;
wire [3:0] wmask = 4'b1111;
reg [ADDR_WIDTH:0] addr;
reg [WIDTH-1:0] din;
wire [WIDTH-1:0] dout;

sram22_64x32m4w8 sram (
  .clk(clk),
  .we(we),
  .wmask(wmask),
  .addr(addr),
  .din(din),
  .dout(dout)
);

reg [ADDR_WIDTH:0] a_len, b_len;
reg processing, b_stored, initializing;
wire a_collected, b_collected;
reg [WIDTH-1:0] b_cache;
reg [WIDTH-1:0] accumulator;

assign a_collected = a_len >= len;
assign b_collected = b_len >= len;
assign we = a_fire | b_fire;
assign wmask = we ? 4'hF : 4'h0;
assign a_ready = !processing & !a_collected;
assign b_ready = !processing & !b_stored & !b_collected;
assign c_data = accumulator;

always @* begin
  if (processing) begin
    if (b_stored) begin
      addr = {1'b1, a_len[ADDR_WIDTH-1:0]};
    end else begin
      addr = {1'b0, a_len[ADDR_WIDTH-1:0]};
    end
  end else begin
    if (b_stored) begin
      din = b_cache;
      addr = {1'b1, b_len[ADDR_WIDTH-1:0]};
    end else if (a_fire) begin 
      din = a_data;
      addr = {1'b0, a_len[ADDR_WIDTH-1:0]};
    end else if (b_fire) begin
      din = b_data;
      addr = {1'b1, b_len[ADDR_WIDTH-1:0]};
    end
  end
end

always @( posedge clk ) begin
  if (rst) begin
    a_len <= 0;
    b_len <= 0;
    processing <= 0;
    initializing <= 0;
    b_stored <= 0;
    c_valid <= 0;
  end else begin
    if (processing) begin
      if (c_valid) begin
        if (c_fire) begin
          a_len <= 0;
          b_len <= 0;
          processing <= 0;
          initializing <= 0;
          b_stored <= 0;
          c_valid <= 0;
        end
      end else begin
        if (initializing) begin 
          if (!b_stored) begin
            initializing <= 0;
          end
        end else begin
          if (b_stored) begin
            accumulator <= accumulator + dout * b_cache;
            if (a_len == b_len) begin
              c_valid <= 1;
            end
          end
        end
        b_stored <= !b_stored;
        if (!b_stored) begin
          a_len <= a_len + 1;
          b_cache <= dout;
        end
      end
    end else begin 
      if (a_collected & b_collected) begin
        processing <= 1;
        initializing <= 1;
        accumulator <= 0;
        b_stored <= 1;
        a_len <= 0;
        b_len <= len;
      end
      if (b_stored) begin
        b_stored <= 0;
        b_len <= b_len + 1;
      end else begin
        if (a_fire) begin
          a_len <= a_len + 1;
        end
        if (b_fire & !a_fire) begin
          b_len <= b_len + 1;
        end
        if (a_fire & b_fire) begin
          b_stored <= 1;
          b_cache <= b_data;
        end
      end
    end
  end
end

endmodule
