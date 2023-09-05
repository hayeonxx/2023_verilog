library verilog;
use verilog.vl_types.all;
entity fsm_ex1 is
    generic(
        IDLE            : vl_logic_vector(0 to 1) := (Hi0, Hi0);
        STATE0          : vl_logic_vector(0 to 1) := (Hi0, Hi1);
        STATE1          : vl_logic_vector(0 to 1) := (Hi1, Hi0);
        STATE2          : vl_logic_vector(0 to 1) := (Hi1, Hi1)
    );
    port(
        state_out       : out    vl_logic_vector(1 downto 0);
        done            : out    vl_logic;
        clk             : in     vl_logic;
        n_rst           : in     vl_logic;
        start           : in     vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of IDLE : constant is 1;
    attribute mti_svvh_generic_type of STATE0 : constant is 1;
    attribute mti_svvh_generic_type of STATE1 : constant is 1;
    attribute mti_svvh_generic_type of STATE2 : constant is 1;
end fsm_ex1;
