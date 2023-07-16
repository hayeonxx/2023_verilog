`timescale 1ns/100ps
`define T_CLK 10
module testbench;
    reg clk;
    reg T;
    wire Q;
    wire Q_bar;

    t_ff u_t_ff(
        .clk(clk),
        .T(T),
        .Q(Q),
        .Q_bar(Q_bar)
    );

    initial begin
        clk = 1'b1;
    end

    always #(`T_CLK/2) clk = ~clk;

    initial begin
        T = 0;
        #10
        T = 1 ;
        #10
        T = 0;
        #10
        T = 1 ;
        #10
        T = 0;
        #10
        T = 1 ;
        #10
        T = 0;
        #10
        T = 1 ;
        #10
        
        $stop;
    end

endmodule
