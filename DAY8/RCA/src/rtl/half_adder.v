module half_adder(
    input a,
    input b,
    output s,
    output c
);

assign c = a & b;
assign s = a ^ b;

endmodule