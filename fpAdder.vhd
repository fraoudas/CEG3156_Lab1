LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY fpAdder IS
	PORT ( GClock, GReset           : IN    STD_LOGIC;
	       SignA, SignB 		: IN 	STD_LOGIC;
	       MantissaA, MantissaB     : IN    STD_LOGIC_VECTOR(7 downto 0);
	       ExponentA, ExponentB     : IN    STD_LOGIC_VECTOR(6 downto 0);
	       SignOut                  : OUT   STD_LOGIC;
	       MantissaOut              : OUT   STD_LOGIC_VECTOR(7 downto 0);
	       ExponentOut		: OUT	STD_LOGIC_VECTOR(6 downto 0);
	       Overflow			: OUT 	STD_LOGIC);
END fpAdder;

ARCHITECTURE rtl OF fpAdder IS

COMPONENT sevenBitRegister
	PORT (  i_GReset	: IN	STD_LOGIC;
		i_clock 	: IN	STD_LOGIC;
		i_E		: IN	STD_LOGIC_VECTOR(6 downto 0);
		i_load 		: IN	STD_LOGIC;
		o_E		: OUT	STD_LOGIC_VECTOR(6 downto 0));
END COMPONENT;

COMPONENT sevenBitComplementer
	PORT (	i_A		: IN	STD_LOGIC_VECTOR(6 downto 0);
		i_enable	: IN	STD_LOGIC;
		o_q		: OUT	STD_LOGIC_VECTOR(7 downto 0));
END COMPONENT;

COMPONENT eightBitAdder
	PORT ( 		i_x		: IN STD_LOGIC_VECTOR(7 downto 0);
			i_y		: IN STD_LOGIC_VECTOR(7 downto 0);
			i_cin		: IN STD_LOGIC;
			o_sign		: OUT STD_LOGIC;
			o_s		: OUT STD_LOGIC_VECTOR(6 downto 0));
END COMPONENT;

COMPONENT sevenBitDownCounter
	PORT(
		i_resetBar, i_load, i_countD	: IN	STD_LOGIC;
		i_A				: IN 	STD_LOGIC_VECTOR(6 downto 0);
		i_clock				: IN	STD_LOGIC;
		o_zero				: OUT	STD_LOGIC;
		o_q				: OUT	STD_LOGIC_VECTOR(6 downto 0));
END COMPONENT;

COMPONENT sevenBitComparator
	PORT(
		i_Ai, i_Bi			: IN	STD_LOGIC_VECTOR(6 downto 0);
		o_GT, o_LT, o_EQ		: OUT	STD_LOGIC);
END COMPONENT;

COMPONENT sevenBit2x1MUX
	PORT (
		i_sel		: IN	STD_LOGIC;
		i_A		: IN	STD_LOGIC_VECTOR(6 downto 0);
		i_B		: IN	STD_LOGIC_VECTOR(6 downto 0);
		o_q		: OUT	STD_LOGIC_VECTOR(6 downto 0));
END COMPONENT;

COMPONENT srlatch
	PORT(
		i_set, i_reset		: IN	STD_LOGIC;
		o_q, o_qBar		: OUT	STD_LOGIC);
END COMPONENT;

COMPONENT sevenBitUpCounter
	PORT(
		i_resetBar, i_load, i_countU	: IN	STD_LOGIC;
		i_A				: IN 	STD_LOGIC_VECTOR(6 downto 0);
		i_clock				: IN	STD_LOGIC;
		o_q				: OUT	STD_LOGIC_VECTOR(6 downto 0));
END COMPONENT;

COMPONENT nineBitShiftRegister
	PORT ( 
		i_resetBar, i_clock 			: IN 	STD_LOGIC;	 
		i_load, i_clear, i_shift		: IN	STD_LOGIC;
		i_A					: IN	STD_LOGIC_VECTOR(7 downto 0);
		o_q					: OUT	STD_LOGIC_VECTOR(8 downto 0));
END COMPONENT;

COMPONENT nineBitAdder
	PORT ( 		i_x		: IN STD_LOGIC_VECTOR(8 downto 0);
			i_y		: IN STD_LOGIC_VECTOR(8 downto 0);
			i_cin		: IN STD_LOGIC;
			o_cout		: OUT STD_LOGIC;
			o_s		: OUT STD_LOGIC_VECTOR(8 downto 0));
END COMPONENT;

COMPONENT fpAdderControl
END COMPONENT;

BEGIN
END rtl;
