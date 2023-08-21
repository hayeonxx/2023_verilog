`timescale 1ns/10ps
`define T_CLK 10
module testbench;

reg clk;
reg n_rst;
reg sw_g;
reg [7:0] sw;
reg button;
reg rxd;

wire txd;
wire [6:0] fnd_on1;
wire [6:0] fnd_on2;

uart u_uart(
    .clk(clk),
    .n_rst(n_rst),
    .sw_g(sw_g),
    .sw(sw),
    .button(button),
    .txd(txd),
    .rxd(rxd),
    .fnd_on1(fnd_on1),
    .fnd_on2(fnd_on2)
);

initial begin
    clk = 1'b1;
    n_rst = 1'b0;
    #(`T_CLK) n_rst = 1'b1;
end

always #(`T_CLK/2) clk = ~clk;

initial begin
    wait(n_rst == 1'b1);
end
endmodule