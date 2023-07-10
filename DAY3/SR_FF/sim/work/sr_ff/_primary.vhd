library verilog;
use verilog.vl_types.all;
entity sr_ff is
    port(
        clk             : in     vl_logic;
        S               : in     vl_logic;
        R               : in     vl_logic;
        Q               : out    vl_logic;
        Q_bar           : out    vl_logic
    );
end sr_ff;
