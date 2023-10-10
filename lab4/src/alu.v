`include "alu_op.vh"

module alu(
    input [31:0] a, b,
    input [3:0] alu_op,
    output reg [31:0] out
);

reg [31:0] shifted [3:0];

always @* begin
    case (alu_op)
        `ALU_ADD: out <= a + b;
        `ALU_SUB: out <= a - b;
        `ALU_AND: out <= a & b;
        `ALU_OR: out <= a | b;
        `ALU_XOR: out <= a ^ b;
        `ALU_SLT: out <= ((a + 32'h80000000) < (b + 32'h80000000)) ? 1 : 0;
        `ALU_SLTU: out <= (a < b) ? 1 : 0;
        `ALU_SLL: begin
            shifted[0] = b[0] ? (a << 1) : a;
            shifted[1] = b[1] ? (shifted[0] << 2) : shifted[0];
            shifted[2] = b[2] ? (shifted[1] << 4) : shifted[1];
            shifted[3] = b[3] ? (shifted[2] << 8) : shifted[2];
            out <= b[4] ? (shifted[3] << 16) : shifted[3];
        end
        `ALU_SRA: begin
            shifted[0] = b[0] ? (a >>> 1) : a;
            shifted[1] = b[1] ? (shifted[0] >>> 2) : shifted[0];
            shifted[2] = b[2] ? (shifted[1] >>> 4) : shifted[1];
            shifted[3] = b[3] ? (shifted[2] >>> 8) : shifted[2];
            out <= b[4] ? (shifted[3] >>> 16) : shifted[3];
        end
        `ALU_SRL: begin
            shifted[0] = b[0] ? (a >> 1) : a;
            shifted[1] = b[1] ? (shifted[0] >> 2) : shifted[0];
            shifted[2] = b[2] ? (shifted[1] >> 4) : shifted[1];
            shifted[3] = b[3] ? (shifted[2] >> 8) : shifted[2];
            out <= b[4] ? (shifted[3] >> 16) : shifted[3];
        end
        `ALU_COPY_B: out <= b;
        `ALU_XXX: out <= 32'b0;
    endcase
end

endmodule
