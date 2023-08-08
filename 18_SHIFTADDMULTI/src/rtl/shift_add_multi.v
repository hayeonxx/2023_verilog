module shift_add_multi(
    input clk,
    input n_rst,
    input start,
    input reg [3:0] M,
    input reg [3:0] Q,
    output reg [7:0] P
);

reg [2:0] cnt;
reg [7:0] M_s;
reg [3:0] Q_s;

always @(posedge clk or negedge n_rst) begin
    if(!n_rst)
        cnt <= 3'h0;
    else if(start == 1'b1)
        cnt <= 3'h0;
    else 
        cnt <= (cnt == 3'h4) ? 3'h0 : cnt + 3'h1;
end
 
always @(posedge clk or negedge n_rst) begin
    if(!n_rst)
        M_s <= 8'b0000_0000;
    else if(start == 1'b1)
        M_s <= M;
    else begin 
        if(cnt <= 3'h3)
            M_s <= M_s << 1;
        else
            M_s <= M;
    end
end

always @(posedge clk or negedge n_rst) begin
    if(!n_rst)
        Q_s <= 4'b0000;
    else if(start == 1'b1)
        Q_s <= Q;
    else begin
        if(cnt <= 3'h3)
            Q_s <= Q_s >> 1;
        else
            Q_s <= Q;
    end
end

always @(posedge clk or negedge n_rst) begin
    if(!n_rst)
        P <= 8'b0000_0000;
    else if(start == 1'b1)
        P <= 8'b0000_0000;
    else begin
        if(cnt <= 3'h4 && cnt >= 3'h0)
            P <= (Q_s[0] == 1'b1) ? P + M_s : P;
        else
            P <= 8'b0000_0000;
    end
end


endmodule
        

            

