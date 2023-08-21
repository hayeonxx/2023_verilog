module uart(
  clk,
  n_rst,
  sw_g,
  sw,
  button,
  txd,
  rxd,
  fnd_on1,
  fnd_on2
);

input clk;
input n_rst;
input sw_g;
input [7:0] sw;
input button;
input rxd;

output txd;
output [6:0] fnd_on1;
output [6:0] fnd_on2;

wire txen;
wire in_txd;
wire falling;
wire out_rxd;
wire [7:0] rx_data;

gen_en u_gen_en(
  .clk(clk),
  .n_rst(n_rst),
  .sw(sw),
  .txen(txen)
);

edge_detection u_edge_detection(
  .clk(clk),
  .n_rst(n_rst),
  .in(!button),
  .out(falling)
);

tx u_tx(
  .clk(clk),
  .n_rst(n_rst),
  .tx_data(sw),
  .load(falling),
  .txen(txen),
  .txd(in_txd)
);

assign txd = !in_txd;

rx u_rx(
  .clk(clk), 
	.n_rst(n_rst),
	.rxd(out_txd),
  .rx_data(sw)
);

assign rxd = !out_rxd;

fnd u_fnd1(
  .number(rx_data[3:0]),
  .fnd_on(fnd_on1)
);

fnd u_fnd2(
  .number(rx_data[7:4]),
  .fnd_on(fnd_on2)
);

endmodule
  
  

