module booth_multiplier(
    input clk,
    input n_rst,
    input reg start,
    input reg [4:0] M,
    input reg [4:0] Q,
    output reg [7:0] result
);

reg state;
reg n_state;
reg [2:0] cnt;
reg [9:0] A;
reg [9:0] S;
reg [9:0] P;

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

always@(posedge clk or negedge n_rst) begin
    if(!n_rst)
        cnt <= 3'h0;
    else begin
        if(state == IDLE)
            cnt <= 3'h0;
        else
            cnt <= (cnt == 3'h4) ? 3'h0 : cnt + 3'h1;
    end
end

always @(posedge clk or negedge n_rst) begin
    if(!n_rst)
        A <= 10'b0_0000_0000_0;
    else begin
        if(state == IDLE)
            A <= 10'b0_0000_0000_0;
        else
            A <= {M, A[4:0]};
    end
end

always @(posedge clk or negedge n_rst) begin
    if(!n_rst)
        S <= 10'b0_0000_0000_0;
    else begin
        if(state == IDLE)
            S <= 10'b0_0000_0000_0;
        else
            S <= {(~M + 1'b1), A[4:0]};
    end
end

always @(posedge clk or negedge n_rst) begin
    if(!n_rst)
        P <= 10'b0_0000_0000_0;
    else begin
        if(state == IDLE)
            P <= 10'b0_0000_0000_0;
        else
            P <= {P[9:6], Q, 1'b0};
    end
end 

reg [1:0] P_LSB;

always @(posedge clk or negedge n_rst) begin
    if(!n_rst) 
        P_LSB <= P[1:0];
    else begin
        if(state == CAL) 
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
        if(state == IDLE) begin
            P <= 10'b0_0000_0000_0;
        else begin
            case(P_LSB)
                2'b01: P = P + A;
                2'b10: P = P + S;
                default: P = P;
            endcase
        end
    end
    P <= {1'b0, P[9:1]};
    end
end



always @(posedge clk or negedge n_rst) begin
    if(!n_rst)
        result <= 8'b0000_0000;
    else begin
        if(state == CAL) 
            result <= P[8:1];
        else 
            result <= result;
    end
end

endmodule