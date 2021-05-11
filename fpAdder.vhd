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

END rtl;
