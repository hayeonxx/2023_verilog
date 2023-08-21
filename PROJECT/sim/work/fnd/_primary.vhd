library verilog;
use verilog.vl_types.all;
entity fnd is
    port(
        number          : in     vl_logic_vector(3 downto 0);
        fnd_on          : out    vl_logic_vector(6 downto 0)
    );
end fnd;
