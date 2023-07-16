module testbench;

reg [3:0] a;
reg [3:0] b;
reg c_in;
wire [3:0] s;
wire c_out;

rca u_rca(
    .a(a),
    .b(b),
    .c_in(c_in),
    .s(s),
    .c_out(c_out)
);

initial begin
    c_in = 1'b0;
    a = 4'b1001;
    b = 4'b0110;
    #10;
    a = 4'b1110;
    b = 4'b0100;
    #10;
    c_in = 1'b1;
    a = 4'b0111;
    b = 4'b0011;
    #10;
    a = 4'b0010;
    b = 4'b0101;
    #10;
    $stop;
end
endmodule