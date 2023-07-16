library verilog;
use verilog.vl_types.all;
entity demux1_4 is
    port(
        \in\            : in     vl_logic_vector(2 downto 0);
        sel             : in     vl_logic_vector(1 downto 0);
        A               : out    vl_logic_vector(2 downto 0);
        B               : out    vl_logic_vector(2 downto 0);
        C               : out    vl_logic_vector(2 downto 0);
        D               : out    vl_logic_vector(2 downto 0)
    );
end demux1_4;
