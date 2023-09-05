`timescale 1ns/10ps
`define T_CLK 10

module testbench();

reg clk;
reg n_rst;
reg start;
wire [1:0] state_out;
wire done;

fsm u_fsm(
    .clk(clk),
    .n_rst(n_rst),
    .start(start),
    .done(done),
    .state_out(state_out)
);

initial begin
    clk = 1'b1;
    n_rst = 1'b0;
    #(`T_CLK*1.1) n_rst = 1'b1;
end

always #(`T_CLK/2) clk = ~clk;

initial begin
    start = 1'b0;
    wait(n_rst == 1'b1);
    start = 1'b1;
    #50
    $stop;
end

endmodule