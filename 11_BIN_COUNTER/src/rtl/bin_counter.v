module bin_counter(
    input clk,
    input n_rst,
    output reg [3:0] out
);

always @(posedge clk or negedge n_rst) begin
    if(!n_rst)
        out <= 4'b0000;
    else
        out <= out + 4'b0001;
end

endmodule
