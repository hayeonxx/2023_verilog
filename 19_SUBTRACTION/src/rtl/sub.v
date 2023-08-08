module sub(
    input [3:0] a,
    input [3:0] b,
    input c_in,
    output [3:0] s,
    output c_out
);

wire [2:0] c;
wire [3:0] b_s;
assign b_s = (c_in == 1'b1) ? ~b : b;

full_adder u_full_adder1(
    .a(a[0]), 
    .b(b_s[0]), 
    .c_in(c_in), 
    .s(s[0]), 
    .c_out(c[0])
);
full_adder u_full_adder2(
    .a(a[1]), 
    .b(b_s[1]), 
    .c_in(c[0]), 
    .s(s[1]), 
    .c_out(c[1])
);
full_adder u_full_adder3(
    .a(a[2]), 
    .b(b_s[2]), 
    .c_in(c[1]), 
    .s(s[2]), 
    .c_out(c[2])
);
full_adder u_full_adder4(
    .a(a[3]), 
    .b(b_s[3]), 
    .c_in(c[2]), 
    .s(s[3]), 
    .c_out(c_out)
);

endmodule