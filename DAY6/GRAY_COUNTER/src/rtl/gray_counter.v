module(
    input clk;
    input n_rst;
    output reg [3:0] out;

    reg q0, q1, q2;
    reg [3:0] count;

    always @(posedge clk or negedge n_rst) begin
        if(!n_rst)
            count = 4'b0;
            out = 4'b0;
        else
            count = count + 1'b1;
            q2 = count[3] * 

);
endmodule