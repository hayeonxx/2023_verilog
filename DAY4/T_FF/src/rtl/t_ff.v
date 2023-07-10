module t_ff(
    input clk,
    input T,
    output reg Q,
    output reg Q_bar
);

always @(posedge clk) begin
    if(T == 0) begin
        Q <= 1;
        Q_bar <= 0;
    end
    else begin
        Q <= 0;
        Q_bar <= 1;
    end
end

endmodule