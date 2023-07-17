library verilog;
use verilog.vl_types.all;
entity fa is
    port(
        a               : in     vl_logic;
        b               : in     vl_logic;
        c_in            : in     vl_logic;
        p               : out    vl_logic;
        g               : out    vl_logic;
        s               : out    vl_logic
    );
end fa;
