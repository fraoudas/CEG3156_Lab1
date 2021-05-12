LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY eightBitRegister IS
	PORT ( 	
		i_GReset	: IN	STD_LOGIC;
		i_clock 	: IN	STD_LOGIC;
		i_F		: IN	STD_LOGIC_VECTOR(7 downto 0);
		i_control 	: IN	STD_LOGIC_VECTOR(1 downto 0);
		o_F		: OUT	STD_LOGIC_VECTOR(7 downto 0));
END eightBitRegister;

ARCHITECTURE rtl OF eightBitRegister IS
	SIGNAL int_F	: STD_LOGIC_VECTOR(7 downto 0);
	SIGNAL int_load, int_shift, int_clear : STD_LOGIC;
	SIGNAL int_D	: STD_LOGIC_VECTOR(7 downto 0);

	COMPONENT enARdFF_2
		PORT (	i_resetBar	: IN	STD_LOGIC;
			i_d		: IN	STD_LOGIC;
			i_enable	: IN	STD_LOGIC;
			i_clock		: IN	STD_LOGIC;
			o_q, o_qBar	: OUT	STD_LOGIC);
	END COMPONENT;

--TO BE CHANGED
BEGIN

int_load <= NOT(i_control(1)) AND NOT(i_control(0));
int_shift <= NOT(i_control(1)) AND i_control(0);
int_clear <= i_control(1) AND i_control(0);

int_D(7) <= (int_load AND i_F(7)) OR (int_shift) OR (int_clear AND '0');
int_D(6) <= (int_load AND i_F(6)) OR (int_shift AND int_F(7)) OR (int_clear AND '0');
int_D(5) <= (int_load AND i_F(5)) OR (int_shift AND int_F(6)) OR (int_clear AND '0');
int_D(4) <= (int_load AND i_F(4)) OR (int_shift AND int_F(5)) OR (int_clear AND '0');
int_D(3) <= (int_load AND i_F(3)) OR (int_shift AND int_F(4)) OR (int_clear AND '0');
int_D(2) <= (int_load AND i_F(2)) OR (int_shift AND int_F(3)) OR (int_clear AND '0');
int_D(1) <= (int_load AND i_F(1)) OR (int_shift AND int_F(2)) OR (int_clear AND '0');
int_D(0) <= (int_load AND i_F(0)) OR (int_shift AND int_F(1)) OR (int_clear AND '0');

bit7: enArDFF_2
	PORT MAP ( i_resetBar => i_GReset,
		   i_d => int_D(7),
		   i_enable => '1',
		   i_clock => i_clock,
		   o_q => int_F(7));

bit6: enARdFF_2
	PORT MAP ( i_resetBar => i_GReset,
		   i_d => int_D(6),
		   i_enable => '1',
		   i_clock => i_clock,
		   o_q => int_F(6));

bit5: enARdFF_2
	PORT MAP ( i_resetBar => i_GReset,
		   i_d => int_D(5),
		   i_enable => '1',
		   i_clock => i_clock,
		   o_q => int_F(5));

bit4: enARdFF_2
	PORT MAP ( i_resetBar => i_GReset,
		   i_d => int_D(4),
		   i_enable => '1',
		   i_clock => i_clock,
		   o_q => int_F(4));

bit3: enARdFF_2
	PORT MAP ( i_resetBar => i_GReset,
		   i_d => int_D(3),
		   i_enable => '1',
		   i_clock => i_clock,
		   o_q => int_F(3));

bit2: enARdFF_2
	PORT MAP ( i_resetBar => i_GReset,
		   i_d => int_D(2),
		   i_enable => '1',
		   i_clock => i_clock,
		   o_q => int_F(2));

bit1: enARdFF_2
	PORT MAP ( i_resetBar => i_GReset,
		   i_d => int_D(1),
		   i_enable => '1',
		   i_clock => i_clock,
		   o_q => int_F(1));

bit0: enARdFF_2
	PORT MAP ( i_resetBar => i_GReset,
		   i_d => int_D(0),
		   i_enable => '1',
		   i_clock => i_clock,
		   o_q => int_F(0));
	
	--Output Drivers
	o_F <= int_F;

END rtl;
