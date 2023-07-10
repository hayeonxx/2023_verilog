library verilog;
use verilog.vl_types.all;
entity d_ff is
    port(
        clk             : in     vl_logic;
        D               : in     vl_logic;
        Q               : out    vl_logic;
        Q_bar           : out    vl_logic
    );
end d_ff;
