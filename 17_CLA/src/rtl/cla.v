module cla(
    input [3:0] a,
    input [3:0] b,
    input c_in,
    output [3:0] s,
    output pg,
    output gg,
    output c_out
);

wire p0,p1,p2,p3;
wire g0,g1,g2,g3;
wire [3:0] p;
wire [3:0] g;
wire [3:0] cout;

full_adder u_full_adder1(
    .a(a[0]),
    .b(b[0]),
    .c_in(c_in),
    .p(p0),
    .g(g0),
    .s(s[0])
);

full_adder u_full_adder2(
    .a(a[1]), 
    .b(b[1]), 
    .c_in(cout[0]), 
    .p(p1),
    .g(g1),
    .s(s[1])
);

full_adder u_full_adder3(
    .a(a[2]), 
    .b(b[2]), 
    .c_in(cout[1]), 
    .p(p2),
    .g(g2),
    .s(s[2])
);

full_adder u_full_adder4(
    .a(a[3]), 
    .b(b[3]), 
    .c_in(cout[2]),
    .p(p3),
    .g(g3), 
    .s(s[3]) 
);

assign p = {p3,p2,p1,p0};
assign g = {g3,g2,g1,g0};

lookaheadunit_4bit u_lookaheadunit_4bit(
    .c_in(c_in),
    .p(p),
    .g(g),
    .c_out(cout)
);

assign pg = p0&p1&p2&p3;
assign gg = g3|(g2&p3)|(g1&p3&p2)|(g0&p3&p2&p1);
assign c_out = cout[3];

endmodule