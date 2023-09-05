module sub(a,b,o_sub);

input [15:0] a, b;
output [15:0] o_sub;
assign o_sub = a - b;

endmodule