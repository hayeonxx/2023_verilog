module testbench;
    reg s;
    reg r;
    wire q;
    wire q_bar;

    srlatch_nor u_srlatch_nor(
        .s(s),
        .r(r),
        .q(q),
        .q_bar(q_bar)
    );

    initial begin
        s = 0; 
        r = 0;
        #5;
        s = 0;
        r = 1;
        #5;
        s = 1;
        r = 0;
        #5;
        s = 1;
        r = 1;
        #5;
        s = 0; 
        r = 0;
        #5;
        s = 1;
        r = 1;
        #50;
        $stop;
    end

endmodule
