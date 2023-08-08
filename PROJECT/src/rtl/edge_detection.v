`timescale 1ns/1ps

module edge_detection(
	clk,
	n_rst,
	in,
	out
);

input clk, n_rst, in;
output out;
	
reg in_d1, in_d2;

always @(posedge clk or negedge n_rst)
	if(!n_rst) begin
		in_d1 <= 1'b0;
		in_d2 <= 1'b0;
	end
	else begin
		in_d1 <= in;
		in_d2 <= in_d1;
	end

assign out = ((in_d1 == 1'b0)&&(in_d2 == 1'b1))? 1'b1 : 1'b0;
	
endmodule





