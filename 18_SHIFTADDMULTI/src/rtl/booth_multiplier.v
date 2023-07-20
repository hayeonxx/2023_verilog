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
reg [3:0] cnt;
reg [9:0] A;
reg [9:0] S;
reg [9:0] P;

localparam IDLE = 1'h0;
localparam CAL = 1'h1;

always @(posedge clk or negedge n_rst) begin
    if(!n_rst) 
        state <= IDLE;
    else   
        state <= n_state;
end  

always @(*) begin
    case(state)
        IDLE: begin
            n_state = (start == 1'b1) ? CAL : state;
        end
        CAL: begin
            n_state = (cnt == 4'h0) ? IDLE : state;
        default: n_state = IDLE;
    endcase
end

always@(posedge clk or negedge n_rst) begin
    if(!n_rst)
        cnt <= 4'h3;
    else begin
        if(state == IDLE)
            cnt <= 4'h3;
        else
            cnt <= cnt - 1'b1;
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
            P <= {P[9:5], Q, 1'b0};
    end
end
reg [9:0] P_re;
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
    if(!n_rst)
        P_re <= P;
    else begin
        if(state == CAL) begin
            if(P_LSB == 01)
                P_re <= P + A;
            else if(P_LSB == 10)
                P_re <= P + S;
            else
                P_re <= P;
        end
        P_re <= P_re >> 1;
    end
end

always @(posedge clk or negedge n_rst) begin
    if(!n_rst)
        result <= 8'b0000_0000;
    else begin
        if(state == CAL) 
            result <= P_re[8:1];
        else 
            result <= result;
    end
end

endmodule