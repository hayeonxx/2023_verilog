module fsm_ex1(
    output [1:0] state_out,
    output reg done,
    input clk,
    input n_rst,
    input start
);

parameter IDLE = 2'd0;
parameter STATE0 = 2'd1;
parameter STATE1 = 2'd2;
parameter STATE2 = 2'd3;

reg [1:0] state;
reg [3:0] count;

assign state_out = state;

always @ (posedge clk) begin
    if (!n_rst) begin
        state <= 3'b0;
        done  <= 1'b0;
        count <= 4'b0;
    end
    else if (start == 1'b1) begin
        count <= count + 4'b1;
        
        if (count == 4'd0) begin
            state <= IDLE;
        end
        else if (count == 4'd4) begin
            state <= STATE0;
        end
        else if (count == 4'd8) begin
            state <= STATE1;
        end
        else if (count == 4'd12) begin
            state <= STATE2;
            done <= 1'b1;
        end
    end
    else begin
        state <= 2'b0;
        count <= 4'b0;
        done  <= 1'b0;
    end
end

endmodule