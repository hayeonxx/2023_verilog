module alu(
    input [3:0] a,
    input [3:0] b,
    input data_type,
    input [1:0] op,
    input parser_done,
    output [3:0] result,
    output alu_done,
    output reg [3:0] alu_out
);

wire [3:0] a_out;
wire [3:0] s_out;
wire [3:0] m_out;
wire [3:0] d_out;

assign a_out = a + b;
assign s_out = a - b;
assign m_out = a * b;
assign d_out = a / b;

always @(*) begin
    if(op == 2'b00)
        alu_out = a_out;
    else if(op == 2'b01)
        alu_out = s_out;
    else if(op == 2'b10)
        alu_out = m_out;
    else   
        alu_out = d_out;
end

assign result = alu_out;

endmodule