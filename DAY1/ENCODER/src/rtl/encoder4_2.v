module encoder4_2(
    encoder_in_1,
    encoder_in_2,
    encoder_in_3,
    encoder_in_4,
    encoder_out
);

input encoder_in_1;
input encoder_in_2;
input encoder_in_3;
input encoder_in_4;

output [1:0] encoder_out;

assign encoder_out = (encoder_in_1 == 1) ? 2'b00 :
                    (encoder_in_2 == 1) ? 2'b01 :
                    (encoder_in_3 == 1) ? 2'b10 :
                    (encoder_in_4 == 1) ? 2'b11 : 2'b00 ;


endmodule