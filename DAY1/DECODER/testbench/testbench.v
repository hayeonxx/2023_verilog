module testbench;
    reg [1:0] in;
    wire out1;
    wire out2;
    wire out3;
    wire out4;

    decoder2_4 u_decoder2_4(
        .in(in),
        .out1(out1),
        .out2(out2),
        .out3(out3),
        .out4(out4)
    );

    initial begin
        in = 2'b00;
        #5;
        in = 2'b01;
        #5;
        in = 2'b10;
        #5;
        in = 2'b11;
        #5;
        $stop;
    end
endmodule