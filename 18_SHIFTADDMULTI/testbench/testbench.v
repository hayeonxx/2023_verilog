`timescale 1ns/10ps
`define T_CLK 10
module testbench;

reg clk;
reg n_rst;
reg start;
reg [4:0] M;
reg [4:0] Q;
wire [7:0] result;

booth_multiplier u_booth_multiplier(
    .clk(clk),
    .n_rst(n_rst),
    .start(start),
    .M(M),
    .Q(Q),
    .result(result)  
);

initial begin
    clk = 1'b1;
    n_rst = 1'b0;
    #(`T_CLK) n_rst = 1'b1;
end

always #(`T_CLK/2) clk = ~clk;

initial begin
    M = 5'b1_1000;
    Q = 5'b0_0010;
    start = 1'b0;
    #10
    start = 1'b1;
    #10
    start = 1'b0;
    #100
    $stop;
end
endmodule