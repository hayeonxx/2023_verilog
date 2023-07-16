library verilog;
use verilog.vl_types.all;
entity encoder4_2 is
    port(
        encoder_in_1    : in     vl_logic;
        encoder_in_2    : in     vl_logic;
        encoder_in_3    : in     vl_logic;
        encoder_in_4    : in     vl_logic;
        encoder_out     : out    vl_logic_vector(1 downto 0)
    );
end encoder4_2;
