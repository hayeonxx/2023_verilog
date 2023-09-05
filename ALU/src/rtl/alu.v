module alu(a,b,sel,z);

input [15:0] a, b;
input [1:0] sel;
output [15:0] z;

wire [15:0] n0,n1,n2,n3;

add u_add(.a(a), .b(b), .o_add(n0));
sub u_sub(.a(a), .b(b), .o_sub(n1));
mul u_mul(.a(a), .b(b), .o_mul(n2));
div u_div(.a(a), .b(b), .o_div(n3));

mux4to1 u_mux4to1(.in0(n0), .in1(n1), .in2(n2), .in3(n3), .out(z), .sel(sel));

endmodule
