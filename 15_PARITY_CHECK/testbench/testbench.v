`timescale 1ns/10ps
`define T_CLK 10
module testbench;

reg clk;
reg n_rst;
reg [3:0] in;
wire out;

parity_check u_parity_check(
    .clk(clk),
    .n_rst(n_rst),
    .in(in),
    .out(out)
);

initial begin
    clk = 1'b1;
    n_rst = 1'b0;
    #(`T_CLK) n_rst = 1'b1;
end

always #(`T_CLK/2) clk = ~clk;

initial begin
    in = 4'b0000;
    #20
    in = 4'b0100;
    #10
    in = 4'b0110;
    #10
    in = 4'b0111;
    #10
    in = 4'b1111;
    #10
    $stop();
end

endmodule