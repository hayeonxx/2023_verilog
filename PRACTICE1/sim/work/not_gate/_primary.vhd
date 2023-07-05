library verilog;
use verilog.vl_types.all;
entity not_gate is
    port(
        a               : in     vl_logic;
        \out\           : out    vl_logic
    );
end not_gate;
