module booth_multiplier(
    input clk,
    input n_rst,
    input reg start,
    input reg [4:0] M,
    input reg [4:0] Q,
    output reg [7:0] result
);


reg [2:0] cnt;
reg [9:0] A;
reg [9:0] S;
reg [9:0] P;

always@(posedge clk or negedge n_rst) begin
    if(!n_rst)
        cnt <= 3'h0;
    else begin
        if(start == 1'b1)
            cnt <= 3'h0;
        else
            cnt <= (cnt == 3'h4) ? 3'h0 : cnt + 3'h1;
    end
end

always @(posedge clk or negedge n_rst) begin
    if(!n_rst)
        A <= 10'b0_0000_0000_0;
    else if(start == 1'b1)
        A <= {M, A[4:0]};
    else
        A <= A;
    end


always @(posedge clk or negedge n_rst) begin
    if(!n_rst)
        S <= 10'b0_0000_0000_0;
    else if(start == 1'b1)
        S <= {(~M + 1'b1), A[4:0]};
    else 
        S <= S;
end

reg [1:0] P_LSB;

always @(posedge clk or negedge n_rst) begin
    if(!n_rst) 
        P_LSB <= 2'b00;
    else if(start == 1'b1)
        P_LSB <= P[1:0];
    else begin
        if(cnt <= 3'h4)
            P_LSB <= P[1:0];
        else
            P_LSB <= 2'b00;
    end
end

reg [9:0] P_re;

always @(posedge clk or negedge n_rst) begin
    if(!n_rst)
        P_re <= 10'b0_0000_0000_0;
    else if(start == 1'b1)
        P_re <= {P_re[9:6], Q, 1'b0};
    else begin
        if(cnt <= 3'h4 && cnt >= 3'h0) begin
            P_re <= (P_LSB == 2'b01) ? P_re + A : 
                (P_LSB == 2'b10) ? P_re + S : P_re;
        end
        else
            P_re <= 10'b0_0000_0000_0;
    end
end


always @(posedge clk or negedge n_rst) begin
    if(!n_rst)
        P <= 10'b0_0000_0000_0;
    else if(start == 1'b1)
        P <= P_re;
    else begin
        if(cnt <= 3'h4 && cnt >= 3'h0) begin
            P <= {1'b0, P_re[9:1]};
        end 
        else begin
            P <= P;
        end
    end
end


always @(posedge clk or negedge n_rst) begin
    if(!n_rst)
        result <= 8'b0000_0000;
    else if(cnt == 3'h0) 
        result <= 8'b0000_0000;
    else begin
        if(cnt <= 3'h4)
            result <= P[8:1];
        else
            result <= 8'b0000_0000;
    end
end

endmodule