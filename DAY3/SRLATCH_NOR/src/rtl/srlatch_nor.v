module srlatch_nor(
    input s,
    input r,
    output q,
    output q_bar
);

assign q = ((r == 1'b0) && (q_bar == 1'b0)) ? 1'b1 : 1'b0;
assign q_bar = ((s == 1'b0) && (q == 1'b0)) ? 1'b1 : 1'b0;
//assign q = ~(r | q_bar);
//assign q_bar = ~(s | q);

endmodule
