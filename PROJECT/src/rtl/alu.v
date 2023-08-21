module alu(
    input [15:0] a,
    input [15:0] b,
    input data_type,
    input [1:0] op,
    input parser_done,
    output [31:0] cal_result,
    output alu_done
);

wire [31:0] a_out;
wire [31:0] s_out;
wire [31:0] m_out;
wire [31:0] d_out;

assign a_out = a + b;
assign s_out = a - b;
assign m_out = a * b;
assign d_out = a / b;

reg [31:0] alu_out;

assign alu_done = (paser_done == 1'b1) ? 1'b1 : 1'b0;

always @(*) begin
    if(parser_done == 1'b1) begin
        if(op == 2'b00)
            alu_out = a_out;
        else if(op == 2'b01)
            alu_out = s_out;
        else if(op == 2'b10)
            alu_out = m_out;
        else   
            alu_out = d_out;
    end
    else
        alu_out = 31'h0;
end

assign cal_result = alu_out;

endmodule