module full_adder(
    input a,
    input b,
    input c_in,
    output s,
    output c_out
);

wire c1;
wire c2;
wire sum;

half_adder u_half_adder1(
    .a(a),
    .b(b),
    .s(sum),
    .c(c1)
);

half_adder u_half_adder2(
    .a(sum),
    .b(c_in),
    .s(s),
    .c(c2)
);

assign c_out = c1 | c2; 

endmodule