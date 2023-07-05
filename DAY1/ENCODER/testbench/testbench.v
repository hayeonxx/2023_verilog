module testbench;
    reg encoder_in_1;
    reg encoder_in_2;
    reg encoder_in_3;
    reg encoder_in_4;
    wire [1:0] encoder_out;

    encoder4_2 u_encoder4_2(
        .encoder_in_1(encoder_in_1),
        .encoder_in_2(encoder_in_2),
        .encoder_in_3(encoder_in_3),
        .encoder_in_4(encoder_in_4),
        .encoder_out(encoder_out)
    );

    initial begin
        encoder_in_1 = 1;
        encoder_in_2 = 0;
        encoder_in_3 = 0;
        encoder_in_4 = 0;
        #5;
        

        encoder_in_1 = 0;
        encoder_in_2 = 1;
        encoder_in_3 = 0;
        encoder_in_4 = 0;
        #5;
        

        encoder_in_1 = 0;
        encoder_in_2 = 0;
        encoder_in_3 = 1;
        encoder_in_4 = 0;
        #5;
       

        encoder_in_1 = 0;
        encoder_in_2 = 0;
        encoder_in_3 = 0;
        encoder_in_4 = 1;
        #5;
        

        $stop;
    end
endmodule