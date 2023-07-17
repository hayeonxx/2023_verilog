library verilog;
use verilog.vl_types.all;
entity cla is
    port(
        a               : in     vl_logic_vector(3 downto 0);
        b               : in     vl_logic_vector(3 downto 0);
        c_in            : in     vl_logic;
        s               : out    vl_logic_vector(3 downto 0);
        pg              : out    vl_logic;
        gg              : out    vl_logic;
        c_out           : out    vl_logic
    );
end cla;
