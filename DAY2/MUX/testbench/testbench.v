module testbench;
    reg [3:0] A;
    reg [3:0] B;
    reg [3:0] C;
    reg [3:0] D;
    reg [1:0] sel;
    wire [3:0] out;
    
    mux4_1 u_mux4_1(
        .A(A),
        .B(B),
        .C(C),
        .D(D),
        .sel(sel),
        .out(out)
    );

    initial begin
        A = 4'd4;
        B = 4'd5;
        C = 4'd8;
        D = 4'd15;

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