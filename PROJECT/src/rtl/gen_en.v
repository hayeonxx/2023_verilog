module gen_en(
  clk,
  n_rst,
  sw_g,
  txen
);

input clk;
input n_rst;
input sw_g;

output txen; 

localparam MAX9600 = 13'd5208;
localparam MAX19200 = 13'd2604;
wire MAX;

assign MAX = (sw_g === 1'b0) ? MAX9600 : MAX19200;

reg [12:0] cnt; 

always @(posedge clk or negedge n_rst)
  if(!n_rst) begin 
    cnt <= 13'h0000;
  end
  else begin
    cnt <= (cnt == MAX) ? 13'h0000 : cnt + 13'h0001;
  end

assign txen = (cnt == MAX) ? 1'b1 : 1'b0;

endmodule
