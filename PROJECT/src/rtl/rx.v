module rx(
    clk,
    n_rst,
    rxd,
    rx_data
);

input clk;
input n_rst;
input rxd;

output [7:0] rx_data;
reg [7:0] rx_data;

reg [1:0] state; 
reg [1:0] next_state; 

localparam IDLE = 2'h0; 
localparam START = 2'h1; 
localparam WRITE= 2'h2; 
localparam STOP = 2'h3; //4state => 2bit

localparam FLG1 = 16'h5208; 
localparam FLG2 = 4'ha; //start 0-15 middle => a 

reg [15:0] c_cnt1;
reg [15:0] n_cnt1; 

reg [3:0] c_cnt2; 
reg [3:0] n_cnt2; 

always @(posedge clk or negedge n_rst) begin
  if (!n_rst) begin
    state <= IDLE;
    c_cnt1 <= 16'h0001;
    c_cnt2 <= 4'h1;
  end
  else begin
    state <= next_state;
    c_cnt1 <= n_cnt1;
    c_cnt2 <= n_cnt2;
  end
end

always @(rxd or n_cnt2) begin
  case(state)
    IDLE: next_state = (rxd == 1'b1) ? IDLE : START;
    START: next_state = (n_cnt2 == 4'h2) ? WRITE : state;
    WRITE: next_state = (n_cnt2 == FLG2) ? STOP : state;
    STOP: next_state = (n_cnt2 == 4'h1) ? IDLE : state;
    default: next_state = IDLE;
  endcase
end 

reg sclk;
   
always @(posedge clk or negedge n_rst) begin
  if (!n_rst)
      sclk <= 1'b1;
  else begin
      if (c_cnt1 < 16'h0A2D)
          sclk <= 1'b1;
      else
          sclk <= 1'b0;
  end
end
    
always @(state or c_cnt1) 
  case (state)
    IDLE: n_cnt1 = 16'h0001;
    default: begin
       if (c_cnt1 == FLG1)
          n_cnt1 = 16'h0001;
       else
          n_cnt1 = c_cnt1 + 16'h0001;
    end
  endcase

 
always @(posedge clk or negedge n_rst) 
  if (!n_rst)
    sclk <= 1'b1;
  else begin
    if (c_cnt1 < 16'h0A2D)
        sclk <= 1'b1;
    else
        sclk <= 1'b0;
  end

reg sclk_delay; 
wire falling_sclk; 

//before sclk vs current sclk => falling edge gamzi
always @(posedge clk or negedge n_rst)
  if (!n_rst)
    sclk_delay <= 1'b1;
  else
    sclk_delay <= sclk;

assign falling_sclk = ((sclk == 1'b0) && (sclk_delay == 1'b1)) ? 1'b1 : 1'b0;

always @(state or falling_sclk)
  case (state)
    IDLE: n_cnt2 = 4'h1;
    default: begin
        if (falling_sclk == 1'b0)
            n_cnt2 = c_cnt2;
        else begin
            if (c_cnt2 == FLG2)
                n_cnt2 = 4'h1;
            else
                n_cnt2 = c_cnt2 + 4'h1;
        end
    end
endcase

always @(posedge clk or negedge n_rst)
  if (!n_rst)
    rx_data <= 8'h00;
  else if (state == WRITE) begin
    rx_data <= (falling_sclk == 1'b1) ? {rxd, rx_data[7:1]} : rx_data; //falingsclk = 1 -> right shift -> new rx_data
  end
  else
    rx_data <= rx_data;

endmodule

