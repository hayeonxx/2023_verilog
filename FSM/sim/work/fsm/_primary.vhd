library verilog;
use verilog.vl_types.all;
entity fsm is
    generic(
        IDLE            : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        ACTIVE          : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        FIN             : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        ABORT           : vl_logic_vector(0 to 1) := (Hi1, Hi1)
    );
    port(
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        go              : in     vl_logic;
        kill            : in     vl_logic;
        done            : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of ACTIVE : constant is 1;
    attribute mti_svvh_generic_type of FIN : constant is 1;
    attribute mti_svvh_generic_type of ABORT : constant is 1;
end fsm;
