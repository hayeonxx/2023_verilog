module testbench();

reg [15:0] a,b;
reg [1:0] sel;
wire [15:0] z;

alu u_alu(.a(a), .b(b), .sel(sel), .z(z));

initial begin
    a = 16'b0000_0100_1000_0101;
    b = 16'b0100_1000_0000_1101;
    sel = 0;
end
always begin
    #100
    sel = sel + 1;
end
endmodule