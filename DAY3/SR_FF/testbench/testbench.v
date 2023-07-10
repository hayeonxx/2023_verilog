`timescale 1ns/100ps
`define T_CLK 10
module testbench;
    reg clk;
    reg S;
    reg R;
    wire Q;
    wire Q_bar;

    sr_ff u_sr_ff(
        .clk(clk),
        .S(S),
        .R(R),
        .Q(Q),
        .Q_bar(Q_bar)
    );

    initial begin
        clk = 1'b1;
    end
    always #(`T_CLK/2) clk = ~clk;

    initial begin
        S = 0; 
        R = 0;
        #10;
        S = 0;
        R = 1;
        #10;
        S = 1;
        R = 0;
        #10;
        S = 1;
        R = 1;
        #10;
        S = 0; 
        R = 0;
        #10;
        S = 1;
        R = 1;
        #10;
        S = 1;
        R = 0;
        #10;
        S = 0;
        R = 1;
        #10;
        
        $stop;
    end

endmodule
