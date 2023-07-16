module parity_check(
    input clk,
    input n_rst,
    input [3:0] in,
    output reg out
);

always @(posedge clk or negedge n_rst) begin
    if(!n_rst)
        out <= 1'b0;
    else
        out <= (in[0] ^ in[1] ^ in[2] ^ in[3]);
end
//even = 0 odd = 1
endmodule