module gray_counter(
    input clk,
    input n_rst,
    output reg [3:0] gray
);

reg [3:0] cnt;

always @(posedge clk or negedge n_rst) begin
    if(!n_rst) begin
        cnt <= 4'b0000;
        gray <= 4'b0000;
    end
    else begin
        cnt = cnt + 1'b1;
        gray = cnt ^ (cnt >> 1); //change gray
    end
end

endmodule

