module div(a,b,o_div);

input [15:0] a, b;
output [15:0] o_div;
assign o_div = a / b;

endmodule