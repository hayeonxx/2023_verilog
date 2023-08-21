library verilog;
use verilog.vl_types.all;
entity uart is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        sw_g            : in     vl_logic;
        sw              : in     vl_logic_vector(7 downto 0);
        button          : in     vl_logic;
        txd             : out    vl_logic;
        rxd             : in     vl_logic;
        fnd_on1         : out    vl_logic_vector(6 downto 0);
        fnd_on2         : out    vl_logic_vector(6 downto 0)
    );
end uart;
