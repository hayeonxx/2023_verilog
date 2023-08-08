library verilog;
use verilog.vl_types.all;
entity booth_multiplier is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        start           : in     vl_logic;
        M               : in     vl_logic_vector(4 downto 0);
        Q               : in     vl_logic_vector(4 downto 0);
        result          : out    vl_logic_vector(7 downto 0)
    );
end booth_multiplier;
