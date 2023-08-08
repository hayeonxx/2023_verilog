library verilog;
use verilog.vl_types.all;
entity shift_add_multi is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        start           : in     vl_logic;
        M               : in     vl_logic_vector(3 downto 0);
        Q               : in     vl_logic_vector(3 downto 0);
        P               : out    vl_logic_vector(7 downto 0)
    );
end shift_add_multi;
