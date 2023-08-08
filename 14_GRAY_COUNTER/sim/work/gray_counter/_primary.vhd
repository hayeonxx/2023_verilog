library verilog;
use verilog.vl_types.all;
entity gray_counter is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        gray            : out    vl_logic_vector(3 downto 0)
    );
end gray_counter;
