module lookaheadunit_4bit(
    input c_in,
    input [3:0] p,
    input [3:0] g,
    output [3:0] c_out
);

assign c_out[0] = g[0] | (p[0] & c_in);
assign c_out[1] = g[1] | (p[1] & c_out[0]);
assign c_out[2] = g[2] | (p[2] & c_out[1]);
assign c_out[3] = g[3] | (p[3] & c_out[2]);

endmodule