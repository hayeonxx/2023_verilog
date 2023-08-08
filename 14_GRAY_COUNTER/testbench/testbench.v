`timescale 1ns/10ps
`define T_CLK 10

module testbench();

reg clk;
reg n_rst;
wire [3:0] out;

gray_counter u_gray_counter(
    .clk(clk),
    .n_rst(n_rst),
    .gray(gray)
);

initial begin
    clk = 1'b1;
    n_rst = 1'b0;
    #(`T_CLK * 1.1) n_rst = 1'b1;
end

always #(`T_CLK/2) clk = ~clk;

initial begin
    wait(n_rst == 1'b1);
    #110 
    $stop;
end

endmodule