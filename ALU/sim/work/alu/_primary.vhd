library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        a               : in     vl_logic_vector(15 downto 0);
        b               : in     vl_logic_vector(15 downto 0);
        sel             : in     vl_logic_vector(1 downto 0);
        z               : out    vl_logic_vector(15 downto 0)
    );
end alu;
