`timescale 1ns/10ps
`define T_CLK 10
module testbench;
    reg clk;
    reg n_rst;
    reg J;
    reg K;
    wire Q;
    wire Q_bar;

    jk_ff u_jk_ff(
        .clk(clk),
        .n_rst(n_rst),
        .J(J),
        .K(K),
        .Q(Q),
        .Q_bar(Q_bar)
    );

    always #(`T_CLK/2) clk = ~clk;

    initial begin
        clk = 1'b1;
        n_rst = 1'b0;
        #(`T_CLK*1.1)n_rst = 1'b1;
    end
 
    initial begin
        wait(n_rst == 1'b1);
        J = 0;
        K = 0;
        #10;
        J = 0;
        K = 1;
        #10;
        J = 1;
        K = 0;
        #10;
        J = 1;
        K = 1;
        #10;
        J = 0;
        K = 0;
        #10;
        J = 1;
        K = 1;
        #10;
        J = 0;
        K = 0;
        #10;
        $stop;
    end

endmodule