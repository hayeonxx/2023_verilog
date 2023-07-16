library verilog;
use verilog.vl_types.all;
entity t_ff is
    port(
        clk             : in     vl_logic;
        T               : in     vl_logic;
        Q               : out    vl_logic;
        Q_bar           : out    vl_logic
    );
end t_ff;
