`timescale 1ns/10ps
`define T_CLK 10

module testbench();

reg clk;
reg n_rst;
reg start;
reg [3:0] M;
reg [3:0] Q;
wire [7:0] P;

shift_add_multi u_shift_add_multi(
    .clk(clk),
    .n_rst(n_rst),
    .start(start),
    .M(M),
    .Q(Q),
    .P(P)
);

initial begin
    clk = 1'b1;
    n_rst = 1'b0;
    #(`T_CLK*1.1) n_rst = 1'b1;
end

always #(`T_CLK/2) clk = ~clk;

initial begin
    start = 1'b0;
    M = 4'b1011;
    Q = 4'b0110;
    wait(n_rst == 1'b1);
    start = 1'b1;
    #10
    start = 1'b0;
    #50
    M = 4'b0011;
    Q = 4'b1011;
    start = 1'b1;
    #10
    start = 1'b0;
    #50
    $stop;
end

endmodule