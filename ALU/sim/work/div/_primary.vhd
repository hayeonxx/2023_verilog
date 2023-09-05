library verilog;
use verilog.vl_types.all;
entity div is
    port(
        a               : in     vl_logic_vector(15 downto 0);
        b               : in     vl_logic_vector(15 downto 0);
        o_div           : out    vl_logic_vector(15 downto 0)
    );
end div;
