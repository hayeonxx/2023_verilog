module decoder2_4(
    input [1:0] in,
    output reg out1,
    output reg out2,
    output reg out3,
    output reg out4
);

always @(*) begin
    if(in == 2'b00)
        out1 = 1'b1;
    else
        out1 = 1'b0;
    if(in == 2'b01)
        out2 = 1'b1;
    else
        out2 = 1'b0;
    if(in == 2'b10)
        out3 = 1'b1;
    else
        out3 = 1'b0;
    if(in == 2'b11)
        out4 = 1'b1;
    else
        out4 = 1'b0;
end       

endmodule