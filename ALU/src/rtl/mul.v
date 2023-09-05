module mul(a,b,o_mul);

input [15:0] a, b;
output [15:0] o_mul;
assign o_mul = a * b;

endmodule