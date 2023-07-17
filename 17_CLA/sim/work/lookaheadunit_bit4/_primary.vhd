library verilog;
use verilog.vl_types.all;
entity lookaheadunit_bit4 is
    port(
        c_in            : in     vl_logic;
        p               : in     vl_logic_vector(3 downto 0);
        g               : in     vl_logic_vector(3 downto 0);
        c_out           : out    vl_logic_vector(3 downto 0)
    );
end lookaheadunit_bit4;
