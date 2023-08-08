module booth_multiplier(
    input clk,
    input n_rst,
    input reg start,
    input reg [4:0] M,
    input reg [4:0] Q,
    output reg [7:0] result
);

//reg state;
//reg n_state;
reg [2:0] cnt;
reg [9:0] A;
reg [9:0] S;
reg [9:0] P;
/*
localparam IDLE = 2'h0;
localparam CAL = 2'h1;

always @(posedge clk or negedge n_rst) begin
    if(!n_rst) 
        state <= IDLE;
    else   
        state <= n_state;
end  

always @(*) begin
    case(state)
        IDLE: n_state = (start == 1'b1) ? CAL : state;
        CAL: n_state = (cnt == 3'h4) ? IDLE : state;
        default: n_state = IDLE;
    endcase
end
*/
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
    else begin
        if(start == 1'b1)
            A <= {M, A[4:0]};
        else
            A <= A;
    end
end

always @(posedge clk or negedge n_rst) begin
    if(!n_rst)
        S <= 10'b0_0000_0000_0;
    else begin
        if(start == 1'b1)
            S <= {(~M + 1'b1), A[4:0]};
        else
            S <= S;
    end
end
/*
always @(posedge clk or negedge n_rst) begin
    if(!n_rst)
        P <= 10'b0_0000_0000_0;
    else begin
        if(start == 1'b1)
            P <= 10'b0_0000_0000_0;
        else
            P <= {P[9:6], Q, 1'b0};
    end
end 
*/
reg [1:0] P_LSB;

always @(posedge clk or negedge n_rst) begin
    if(!n_rst) 
        P_LSB <= 2'b00;
    else begin
        if(cnt <= 3'h3) 
            P_LSB <= P[1:0];
        else
            P_LSB <= P_LSB;
    end
end

always @(posedge clk or negedge n_rst) begin
    if(!n_rst) begin
        P <= 10'b0_0000_0000_0;
    end
    else begin
        if (start == 1'b1)
            P <= {P[9:6], Q, 1'b0};
        else if(cnt <= 3'h3)
            P <= P <= {1'b0, P[9:1]};
        else
            P <= P;
    end
end

always @(posedge clk or negedge n_rst) begin
    if(P_LSB == 01)
        P <= P + A;
    else if(P_LSB == 10)
        P <= P + S;
    else 
        P <= P;
    /*case(P_LSB)
        2'b01: P = P + A;
        2'b10: P = P + S;
        default: P = P;
    endcase
    */
end
  

always @(posedge clk or negedge n_rst) begin
    if(!n_rst)
        result <= 8'b0000_0000;
    else begin
        if(cnt <= 3'h4) 
            result <= P[8:1];
        else 
            result <= result;
    end
end

endmodule