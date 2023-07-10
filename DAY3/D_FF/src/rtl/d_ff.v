module d_ff(
    input clk,
    input D,
    output reg Q,
    output reg Q_bar
);

always @(posedge clk) begin
    if(D == 0) begin
        Q <= 0;
        Q_bar <= 1;
    end
    else begin
        Q <= 1;
        Q_bar <= 0;
    end
end

endmodule