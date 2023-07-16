`timescale 1ns/10ps
`define T_CLK 10
module testbench;

reg clk;
reg n_rst;
wire [3:0] out;

bin_counter u_bin_counter(
    .clk(clk),
    .n_rst(n_rst),
    .out(out)
);

initial begin
    clk = 1'b1;
    n_rst = 1'b0;
    #(`T_CLK * 2.2) n_rst = 1'b1;
end

always #(`T_CLK/2) clk = ~clk;

initial begin
    #(`T_CLK*20) $stop();
end

endmodule