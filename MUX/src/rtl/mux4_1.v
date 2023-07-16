module mux4_1 (
    input [3:0] A,
    input [3:0] B,
    input [3:0] C,
    input [3:0] D,
    input [1:0] sel,
    output reg [3:0] out
);

always @(*) begin
    if (sel == 2'b00)
        out = A;
    else if (sel == 2'b01)
        out = B;
    else if (sel == 2'b10)
        out = C;
    else
        out = D;
end


endmodule