library verilog;
use verilog.vl_types.all;
entity jk_ff is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        J               : in     vl_logic;
        K               : in     vl_logic;
        Q               : out    vl_logic;
        Q_bar           : out    vl_logic
    );
end jk_ff;
