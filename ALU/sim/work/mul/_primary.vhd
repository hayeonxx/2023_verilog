library verilog;
use verilog.vl_types.all;
entity mul is
    port(
        a               : in     vl_logic_vector(15 downto 0);
        b               : in     vl_logic_vector(15 downto 0);
        o_mul           : out    vl_logic_vector(15 downto 0)
    );
end mul;
