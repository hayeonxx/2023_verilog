module jk_ff(
    input clk,
    input n_rst,
    input J,
    input K,
    output reg Q,
    output reg Q_bar
);

always @(posedge clk or negedge n_rst) begin
    if(!n_rst) 
    begin
        Q <= 1'b0;
        Q_bar <= 1'b0;
    end
    else 
    begin
        if(J == 0 && K == 0) begin
            Q <= Q;
            Q_bar <= Q_bar;
        end
        else if (J == 0 && K == 1) begin
            Q <= 0;
            Q_bar <= 1;
        end
        else if (J == 1 && K == 0) begin
            Q <= 1;
            Q_bar <= 0;
        end
        else begin
            Q <= ~Q;
            Q_bar <= ~Q_bar;
        end
    end
end

endmodule