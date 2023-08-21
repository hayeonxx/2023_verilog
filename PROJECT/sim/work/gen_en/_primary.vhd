library verilog;
use verilog.vl_types.all;
entity gen_en is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        sw              : in     vl_logic;
        txen            : out    vl_logic
    );
end gen_en;
