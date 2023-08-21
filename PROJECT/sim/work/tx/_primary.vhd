library verilog;
use verilog.vl_types.all;
entity tx is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        tx_data         : in     vl_logic_vector(7 downto 0);
        load            : in     vl_logic;
        txen            : in     vl_logic;
        txd             : out    vl_logic
    );
end tx;
