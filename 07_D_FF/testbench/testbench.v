`timescale 1ns/100ps
`define T_CLK 10
module testbench;
    reg clk;
    reg D;
    wire Q;
    wire Q_bar;

    d_ff u_d_ff(
        .clk(clk),
        .D(D),
        .Q(Q),
        .Q_bar(Q_bar)
    );

    initial begin
        clk = 1'b1;
    end

    always #(`T_CLK/2) clk = ~clk;

    initial begin
        D = 0;
        #10
        D = 1 ;
        #10
        D = 0;
        #10
        D = 1 ;
        #10
        D = 0;
        #10
        D = 1 ;
        #10
        D = 0;
        #10
        D = 1 ;
        #10
        
        $stop;
    end

endmodule
