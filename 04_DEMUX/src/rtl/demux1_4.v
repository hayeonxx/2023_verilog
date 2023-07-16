module demux1_4 (
    input [2:0] in,
    input [1:0] sel,
    output [2:0] A,
    output [2:0] B,
    output [2:0] C,
    output [2:0] D
);

assign A = (sel == 2'b00) ? in : 3'b0;
assign B = (sel == 2'b01) ? in : 3'b0;
assign C = (sel == 2'b10) ? in : 3'b0;
assign D = (sel == 2'b11) ? in : 3'b0;

endmodule