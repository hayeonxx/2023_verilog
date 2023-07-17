module full_adder(
    input a,
    input b,
    input c_in,
    output p,
    output g,
    output s
);

assign p = a ^ b;
assign g = a & b;
assign s = p ^ c_in;

endmodule