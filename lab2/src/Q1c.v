module circuit (
    input clk,
    input A,
    output reg X,
    output Y
);
    assign Y = A & X;
    always @(clk) begin
        X <= A;
    end
endmodule
