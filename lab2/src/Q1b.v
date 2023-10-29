module circuit (
    input [1:0] A,
    input [1:0] B,
    output Y
);
    assign Y = ~|A & ~|B;
endmodule
