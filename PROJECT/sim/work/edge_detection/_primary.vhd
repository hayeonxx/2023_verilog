library verilog;
use verilog.vl_types.all;
entity edge_detection is
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        \in\            : in     vl_logic;
        \out\           : out    vl_logic
    );
end edge_detection;
