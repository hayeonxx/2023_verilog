module cla(
    input [3:0] a,
    input [3:0] b,
    output c_in,
    output [3:0] s,
    output pg,
    output gg,
    output c_out
);

wire [3:0] p;
wire [3:0] g;
wire c1, c2, c3;

full_adder u_full_adder1(
    .a(a[0]), 
    .b(b[0]), 
    .c_in(c_in), 
    .p(p[0]),
    .g(g[0]),
    .s(s[0]) 
);
full_adder u_full_adder2(
    .a(a[1]), 
    .b(b[1]), 
    .c_in(c1), 
    .p(p[1]),
    .g(g[1]),
    .s(s[1])
);
full_adder u_full_adder3(
    .a(a[2]), 
    .b(b[2]), 
    .c_in(c2), 
    .p(p[2]),
    .g(g[2]),
    .s(s[2])
);
full_adder u_full_adder4(
    .a(a[3]), 
    .b(b[3]), 
    .c_in(c3),
    .p(p[3]),
    .g(g[3]), 
    .s(s[3]) 
);

lookaheadunit_4bit u_lookaheadunit_4bit(
    .c_in(c_in),
    .p(p),
    .g(g),
    .c_out(c_out)
);

assign pg = p;
assign gg = g;

endmodule