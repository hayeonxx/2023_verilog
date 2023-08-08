module fnd(
  number,
  fnd_on
);

input [3:0] number;
output [6:0] fnd_on;

reg a,b,c,d,e,f,g;

always @(number)
begin
   case(number)
     4'h0: begin a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b1; end
     4'h1: begin a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b1; e = 1'b1; f = 1'b1; g = 1'b1; end
     4'h2: begin a = 1'b0; b = 1'b0; c = 1'b1; d = 1'b0; e = 1'b0; f = 1'b1; g = 1'b0; end
     4'h3: begin a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b1; f = 1'b1; g = 1'b0; end
     4'h4: begin a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b1; e = 1'b1; f = 1'b0; g = 1'b0; end
     4'h5: begin a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b0; e = 1'b1; f = 1'b0; g = 1'b0; end
     4'h6: begin a = 1'b0; b = 1'b1; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b0; end
     4'h7: begin a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1; e = 1'b1; f = 1'b0; g = 1'b1; end
     4'h8: begin a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b0; end
     4'h9: begin a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b1; f = 1'b0; g = 1'b0; end
     4'hA: begin a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b1; e = 1'b0; f = 1'b0; g = 1'b1; end
     4'hB: begin a = 1'b1; b = 1'b1; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b0; end
     4'hC: begin a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b1; end
     4'hD: begin a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b0; f = 1'b1; g = 1'b0; end
     4'hE: begin a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b0; e = 1'b0; f = 1'b0; g = 1'b0; end
     4'hF: begin a = 1'b0; b = 1'b1; c = 1'b1; d = 1'b1; e = 1'b0; f = 1'b0; g = 1'b0; end
     4'h10: begin a = 1'b0; b = 1'b0; c = 1'b0; d = 1'b0; e = 1'b1; f = 1'b0; g = 1'b0; end
     4'h11: begin a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b1; e = 1'b0; f = 1'b0; g = 1'b0; end
     4'h12: begin a = 1'b1; b = 1'b0; c = 1'b0; d = 1'b1; e = 1'b1; f = 1'b1; g = 1'b1; end
     default: begin a = 1'b1; b = 1'b1; c = 1'b1; d = 1'b1; e = 1'b1; f = 1'b1; g = 10'b1; end
   endcase
end

assign fnd_on = {g,f,e,d,c,b,a}; 

endmodule



