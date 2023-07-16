library verilog;
use verilog.vl_types.all;
entity bin_counter is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        \out\           : out    vl_logic_vector(3 downto 0)
    );
end bin_counter;
