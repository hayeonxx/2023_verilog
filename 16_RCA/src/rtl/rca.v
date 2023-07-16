module rca(
    input [3:0] a,
    input [3:0] b,
    input c_in,
    output [3:0] s,
    output c_out
);

wire c1, c2, c3;

full_adder u_full_adder1(
    .a(a[0]), 
    .b(b[0]), 
    .c_in(c_in), 
    .s(s[0]), 
    .c_out(c1)
);
full_adder u_full_adder2(
    .a(a[1]), 
    .b(b[1]), 
    .c_in(c1), 
    .s(s[1]), 
    .c_out(c2)
);
full_adder u_full_adder3(
    .a(a[2]), 
    .b(b[2]), 
    .c_in(c2), 
    .s(s[2]), 
    .c_out(c3)
);
full_adder u_full_adder4(
    .a(a[3]), 
    .b(b[3]), 
    .c_in(c3), 
    .s(s[3]), 
    .c_out(c_out)
);
endmodule