module testbench;
    reg [1:0] sel;
    reg [2:0] in;
    wire [2:0] A;
    wire [2:0] B;
    wire [2:0] C;
    wire [2:0] D;
    
    demux1_4 u_demux1_4(
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .sel(sel),
        .in(in)
    );

    initial begin
        in = 3'd5;

        sel = 2'b00;
        #5;
        sel = 2'b01;
        #5;
        sel = 2'b10;
        #5;
        sel = 2'b11;
        #5;
        $stop;
    end

endmodule