-- Copyright (C) 1991-2009 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II"
-- VERSION		"Version 9.0 Build 235 06/17/2009 Service Pack 2 SJ Web Edition"
-- CREATED ON		"Tue Dec 17 23:49:48 2013"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY reg_file IS 
	PORT
	(
		clk2 :  IN  STD_LOGIC;
		reset :  IN  STD_LOGIC;
		write_enable :  IN  STD_LOGIC;
		LED_reg :  IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		read_reg_rs :  IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		read_reg_rt :  IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
		write_data :  IN  STD_LOGIC_VECTOR(7 DOWNTO 0);
		write_reg_rd :  IN  STD_LOGIC_VECTOR(2 DOWNTO 0);
		display :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		read_data_rs :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0);
		read_data_rt :  OUT  STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END reg_file;

ARCHITECTURE bdf_type OF reg_file IS 

ATTRIBUTE black_box : BOOLEAN;
nATTRIBUTE noopt : BOOLEAN;

COMPONENT \8dffe_0\
	PORT(CLRN : IN STD_LOGIC;
		 D2 : IN STD_LOGIC;
		 D3 : IN STD_LOGIC;
		 D4 : IN STD_LOGIC;
		 D5 : IN STD_LOGIC;
		 D8 : IN STD_LOGIC;
		 D6 : IN STD_LOGIC;
		 D7 : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 ENA : IN STD_LOGIC;
		 D1 : IN STD_LOGIC;
		 PRN : IN STD_LOGIC;
		 Q8 : OUT STD_LOGIC;
		 Q4 : OUT STD_LOGIC;
		 Q6 : OUT STD_LOGIC;
		 Q7 : OUT STD_LOGIC;
		 Q3 : OUT STD_LOGIC;
		 Q2 : OUT STD_LOGIC;
		 Q1 : OUT STD_LOGIC;
		 Q5 : OUT STD_LOGIC);
END COMPONENT;
ATTRIBUTE black_box OF \8dffe_0\: COMPONENT IS true;
ATTRIBUTE noopt OF \8dffe_0\: COMPONENT IS true;

COMPONENT \8dffe_1\
	PORT(CLRN : IN STD_LOGIC;
		 D2 : IN STD_LOGIC;
		 D3 : IN STD_LOGIC;
		 D4 : IN STD_LOGIC;
		 D5 : IN STD_LOGIC;
		 D8 : IN STD_LOGIC;
		 D6 : IN STD_LOGIC;
		 D7 : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 ENA : IN STD_LOGIC;
		 D1 : IN STD_LOGIC;
		 PRN : IN STD_LOGIC;
		 Q8 : OUT STD_LOGIC;
		 Q4 : OUT STD_LOGIC;
		 Q6 : OUT STD_LOGIC;
		 Q7 : OUT STD_LOGIC;
		 Q3 : OUT STD_LOGIC;
		 Q2 : OUT STD_LOGIC;
		 Q1 : OUT STD_LOGIC;
		 Q5 : OUT STD_LOGIC);
END COMPONENT;
ATTRIBUTE black_box OF \8dffe_1\: COMPONENT IS true;
ATTRIBUTE noopt OF \8dffe_1\: COMPONENT IS true;

COMPONENT \8dffe_2\
	PORT(CLRN : IN STD_LOGIC;
		 D2 : IN STD_LOGIC;
		 D3 : IN STD_LOGIC;
		 D4 : IN STD_LOGIC;
		 D5 : IN STD_LOGIC;
		 D8 : IN STD_LOGIC;
		 D6 : IN STD_LOGIC;
		 D7 : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 ENA : IN STD_LOGIC;
		 D1 : IN STD_LOGIC;
		 PRN : IN STD_LOGIC;
		 Q8 : OUT STD_LOGIC;
		 Q4 : OUT STD_LOGIC;
		 Q6 : OUT STD_LOGIC;
		 Q7 : OUT STD_LOGIC;
		 Q3 : OUT STD_LOGIC;
		 Q2 : OUT STD_LOGIC;
		 Q1 : OUT STD_LOGIC;
		 Q5 : OUT STD_LOGIC);
END COMPONENT;
ATTRIBUTE black_box OF \8dffe_2\: COMPONENT IS true;
ATTRIBUTE noopt OF \8dffe_2\: COMPONENT IS true;

COMPONENT \8dffe_3\
	PORT(CLRN : IN STD_LOGIC;
		 D2 : IN STD_LOGIC;
		 D3 : IN STD_LOGIC;
		 D4 : IN STD_LOGIC;
		 D5 : IN STD_LOGIC;
		 D8 : IN STD_LOGIC;
		 D6 : IN STD_LOGIC;
		 D7 : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 ENA : IN STD_LOGIC;
		 D1 : IN STD_LOGIC;
		 PRN : IN STD_LOGIC;
		 Q8 : OUT STD_LOGIC;
		 Q4 : OUT STD_LOGIC;
		 Q6 : OUT STD_LOGIC;
		 Q7 : OUT STD_LOGIC;
		 Q3 : OUT STD_LOGIC;
		 Q2 : OUT STD_LOGIC;
		 Q1 : OUT STD_LOGIC;
		 Q5 : OUT STD_LOGIC);
END COMPONENT;
ATTRIBUTE black_box OF \8dffe_3\: COMPONENT IS true;
ATTRIBUTE noopt OF \8dffe_3\: COMPONENT IS true;

COMPONENT \8dffe_4\
	PORT(CLRN : IN STD_LOGIC;
		 D2 : IN STD_LOGIC;
		 D3 : IN STD_LOGIC;
		 D4 : IN STD_LOGIC;
		 D5 : IN STD_LOGIC;
		 D8 : IN STD_LOGIC;
		 D6 : IN STD_LOGIC;
		 D7 : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 ENA : IN STD_LOGIC;
		 D1 : IN STD_LOGIC;
		 PRN : IN STD_LOGIC;
		 Q8 : OUT STD_LOGIC;
		 Q4 : OUT STD_LOGIC;
		 Q6 : OUT STD_LOGIC;
		 Q7 : OUT STD_LOGIC;
		 Q3 : OUT STD_LOGIC;
		 Q2 : OUT STD_LOGIC;
		 Q1 : OUT STD_LOGIC;
		 Q5 : OUT STD_LOGIC);
END COMPONENT;
ATTRIBUTE black_box OF \8dffe_4\: COMPONENT IS true;
ATTRIBUTE noopt OF \8dffe_4\: COMPONENT IS true;

COMPONENT \8dffe_5\
	PORT(CLRN : IN STD_LOGIC;
		 D2 : IN STD_LOGIC;
		 D3 : IN STD_LOGIC;
		 D4 : IN STD_LOGIC;
		 D5 : IN STD_LOGIC;
		 D8 : IN STD_LOGIC;
		 D6 : IN STD_LOGIC;
		 D7 : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 ENA : IN STD_LOGIC;
		 D1 : IN STD_LOGIC;
		 PRN : IN STD_LOGIC;
		 Q8 : OUT STD_LOGIC;
		 Q4 : OUT STD_LOGIC;
		 Q6 : OUT STD_LOGIC;
		 Q7 : OUT STD_LOGIC;
		 Q3 : OUT STD_LOGIC;
		 Q2 : OUT STD_LOGIC;
		 Q1 : OUT STD_LOGIC;
		 Q5 : OUT STD_LOGIC);
END COMPONENT;
ATTRIBUTE black_box OF \8dffe_5\: COMPONENT IS true;
ATTRIBUTE noopt OF \8dffe_5\: COMPONENT IS true;

COMPONENT \8dffe_6\
	PORT(CLRN : IN STD_LOGIC;
		 D2 : IN STD_LOGIC;
		 D3 : IN STD_LOGIC;
		 D4 : IN STD_LOGIC;
		 D5 : IN STD_LOGIC;
		 D8 : IN STD_LOGIC;
		 D6 : IN STD_LOGIC;
		 D7 : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 ENA : IN STD_LOGIC;
		 D1 : IN STD_LOGIC;
		 PRN : IN STD_LOGIC;
		 Q8 : OUT STD_LOGIC;
		 Q4 : OUT STD_LOGIC;
		 Q6 : OUT STD_LOGIC;
		 Q7 : OUT STD_LOGIC;
		 Q3 : OUT STD_LOGIC;
		 Q2 : OUT STD_LOGIC;
		 Q1 : OUT STD_LOGIC;
		 Q5 : OUT STD_LOGIC);
END COMPONENT;
ATTRIBUTE black_box OF \8dffe_6\: COMPONENT IS true;
ATTRIBUTE noopt OF \8dffe_6\: COMPONENT IS true;

COMPONENT \8dffe_7\
	PORT(CLRN : IN STD_LOGIC;
		 D2 : IN STD_LOGIC;
		 D3 : IN STD_LOGIC;
		 D4 : IN STD_LOGIC;
		 D5 : IN STD_LOGIC;
		 D8 : IN STD_LOGIC;
		 D6 : IN STD_LOGIC;
		 D7 : IN STD_LOGIC;
		 CLK : IN STD_LOGIC;
		 ENA : IN STD_LOGIC;
		 D1 : IN STD_LOGIC;
		 PRN : IN STD_LOGIC;
		 Q8 : OUT STD_LOGIC;
		 Q4 : OUT STD_LOGIC;
		 Q6 : OUT STD_LOGIC;
		 Q7 : OUT STD_LOGIC;
		 Q3 : OUT STD_LOGIC;
		 Q2 : OUT STD_LOGIC;
		 Q1 : OUT STD_LOGIC;
		 Q5 : OUT STD_LOGIC);
END COMPONENT;
ATTRIBUTE black_box OF \8dffe_7\: COMPONENT IS true;
ATTRIBUTE noopt OF \8dffe_7\: COMPONENT IS true;

COMPONENT mux_8
	PORT(reg_0 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 reg_1 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 reg_2 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 reg_3 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 reg_4 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 reg_5 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 reg_6 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 reg_7 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT demux_8
	PORT(bitin : IN STD_LOGIC;
		 sel : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 out0 : OUT STD_LOGIC;
		 out1 : OUT STD_LOGIC;
		 out2 : OUT STD_LOGIC;
		 out3 : OUT STD_LOGIC;
		 out4 : OUT STD_LOGIC;
		 out5 : OUT STD_LOGIC;
		 out6 : OUT STD_LOGIC;
		 out7 : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	clrn :  STD_LOGIC;
SIGNAL	enbl0 :  STD_LOGIC;
SIGNAL	enbl1 :  STD_LOGIC;
SIGNAL	enbl2 :  STD_LOGIC;
SIGNAL	enbl3 :  STD_LOGIC;
SIGNAL	enbl4 :  STD_LOGIC;
SIGNAL	enbl5 :  STD_LOGIC;
SIGNAL	enbl6 :  STD_LOGIC;
SIGNAL	enbl7 :  STD_LOGIC;
SIGNAL	reg_0_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	reg_1_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	reg_2_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	reg_3_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	reg_4_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	reg_5_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	reg_6_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	reg_7_out :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_0 <= '1';
SYNTHESIZED_WIRE_1 <= '1';
SYNTHESIZED_WIRE_2 <= '1';
SYNTHESIZED_WIRE_3 <= '1';
SYNTHESIZED_WIRE_4 <= '1';
SYNTHESIZED_WIRE_5 <= '1';
SYNTHESIZED_WIRE_6 <= '1';
SYNTHESIZED_WIRE_7 <= '1';



b2v_inst : mux_8
PORT MAP(reg_0 => reg_0_out,
		 reg_1 => reg_1_out,
		 reg_2 => reg_2_out,
		 reg_3 => reg_3_out,
		 reg_4 => reg_4_out,
		 reg_5 => reg_5_out,
		 reg_6 => reg_6_out,
		 reg_7 => reg_7_out,
		 sel => read_reg_rs,
		 output => read_data_rs);


b2v_inst1 : demux_8
PORT MAP(bitin => write_enable,
		 sel => write_reg_rd,
		 out0 => enbl0,
		 out1 => enbl1,
		 out2 => enbl2,
		 out3 => enbl3,
		 out4 => enbl4,
		 out5 => enbl5,
		 out6 => enbl6,
		 out7 => enbl7);


b2v_inst10 : 8dffe_0
PORT MAP(CLRN => clrn,
		 D2 => write_data(1),
		 D3 => write_data(2),
		 D4 => write_data(3),
		 D5 => write_data(4),
		 D8 => write_data(7),
		 D6 => write_data(5),
		 D7 => write_data(6),
		 CLK => clk2,
		 ENA => enbl4,
		 D1 => write_data(0),
		 PRN => SYNTHESIZED_WIRE_0,
		 Q8 => reg_4_out(7),
		 Q4 => reg_4_out(3),
		 Q6 => reg_4_out(5),
		 Q7 => reg_4_out(6),
		 Q3 => reg_4_out(2),
		 Q2 => reg_4_out(1),
		 Q1 => reg_4_out(0),
		 Q5 => reg_4_out(4));


b2v_inst11 : 8dffe_1
PORT MAP(CLRN => clrn,
		 D2 => write_data(1),
		 D3 => write_data(2),
		 D4 => write_data(3),
		 D5 => write_data(4),
		 D8 => write_data(7),
		 D6 => write_data(5),
		 D7 => write_data(6),
		 CLK => clk2,
		 ENA => enbl5,
		 D1 => write_data(0),
		 PRN => SYNTHESIZED_WIRE_1,
		 Q8 => reg_5_out(7),
		 Q4 => reg_5_out(3),
		 Q6 => reg_5_out(5),
		 Q7 => reg_5_out(6),
		 Q3 => reg_5_out(2),
		 Q2 => reg_5_out(1),
		 Q1 => reg_5_out(0),
		 Q5 => reg_5_out(4));


b2v_inst12 : 8dffe_2
PORT MAP(CLRN => clrn,
		 D2 => write_data(1),
		 D3 => write_data(2),
		 D4 => write_data(3),
		 D5 => write_data(4),
		 D8 => write_data(7),
		 D6 => write_data(5),
		 D7 => write_data(6),
		 CLK => clk2,
		 ENA => enbl6,
		 D1 => write_data(0),
		 PRN => SYNTHESIZED_WIRE_2,
		 Q8 => reg_6_out(7),
		 Q4 => reg_6_out(3),
		 Q6 => reg_6_out(5),
		 Q7 => reg_6_out(6),
		 Q3 => reg_6_out(2),
		 Q2 => reg_6_out(1),
		 Q1 => reg_6_out(0),
		 Q5 => reg_6_out(4));


b2v_inst13 : 8dffe_3
PORT MAP(CLRN => clrn,
		 D2 => write_data(1),
		 D3 => write_data(2),
		 D4 => write_data(3),
		 D5 => write_data(4),
		 D8 => write_data(7),
		 D6 => write_data(5),
		 D7 => write_data(6),
		 CLK => clk2,
		 ENA => enbl7,
		 D1 => write_data(0),
		 PRN => SYNTHESIZED_WIRE_3,
		 Q8 => reg_7_out(7),
		 Q4 => reg_7_out(3),
		 Q6 => reg_7_out(5),
		 Q7 => reg_7_out(6),
		 Q3 => reg_7_out(2),
		 Q2 => reg_7_out(1),
		 Q1 => reg_7_out(0),
		 Q5 => reg_7_out(4));








b2v_inst2 : mux_8
PORT MAP(reg_0 => reg_0_out,
		 reg_1 => reg_1_out,
		 reg_2 => reg_2_out,
		 reg_3 => reg_3_out,
		 reg_4 => reg_4_out,
		 reg_5 => reg_5_out,
		 reg_6 => reg_6_out,
		 reg_7 => reg_7_out,
		 sel => read_reg_rt(2 DOWNTO 0),
		 output => read_data_rt);


clrn <= NOT(reset);



b2v_inst3 : mux_8
PORT MAP(reg_0 => reg_0_out,
		 reg_1 => reg_1_out,
		 reg_2 => reg_2_out,
		 reg_3 => reg_3_out,
		 reg_4 => reg_4_out,
		 reg_5 => reg_5_out,
		 reg_6 => reg_6_out,
		 reg_7 => reg_7_out,
		 sel => LED_reg,
		 output => display);




b2v_inst6 : 8dffe_4
PORT MAP(CLRN => clrn,
		 D2 => write_data(1),
		 D3 => write_data(2),
		 D4 => write_data(3),
		 D5 => write_data(4),
		 D8 => write_data(7),
		 D6 => write_data(5),
		 D7 => write_data(6),
		 CLK => clk2,
		 ENA => enbl0,
		 D1 => write_data(0),
		 PRN => SYNTHESIZED_WIRE_4,
		 Q8 => reg_0_out(7),
		 Q4 => reg_0_out(3),
		 Q6 => reg_0_out(5),
		 Q7 => reg_0_out(6),
		 Q3 => reg_0_out(2),
		 Q2 => reg_0_out(1),
		 Q1 => reg_0_out(0),
		 Q5 => reg_0_out(4));


b2v_inst7 : 8dffe_5
PORT MAP(CLRN => clrn,
		 D2 => write_data(1),
		 D3 => write_data(2),
		 D4 => write_data(3),
		 D5 => write_data(4),
		 D8 => write_data(7),
		 D6 => write_data(5),
		 D7 => write_data(6),
		 CLK => clk2,
		 ENA => enbl1,
		 D1 => write_data(0),
		 PRN => SYNTHESIZED_WIRE_5,
		 Q8 => reg_1_out(7),
		 Q4 => reg_1_out(3),
		 Q6 => reg_1_out(5),
		 Q7 => reg_1_out(6),
		 Q3 => reg_1_out(2),
		 Q2 => reg_1_out(1),
		 Q1 => reg_1_out(0),
		 Q5 => reg_1_out(4));


b2v_inst8 : 8dffe_6
PORT MAP(CLRN => clrn,
		 D2 => write_data(1),
		 D3 => write_data(2),
		 D4 => write_data(3),
		 D5 => write_data(4),
		 D8 => write_data(7),
		 D6 => write_data(5),
		 D7 => write_data(6),
		 CLK => clk2,
		 ENA => enbl2,
		 D1 => write_data(0),
		 PRN => SYNTHESIZED_WIRE_6,
		 Q8 => reg_2_out(7),
		 Q4 => reg_2_out(3),
		 Q6 => reg_2_out(5),
		 Q7 => reg_2_out(6),
		 Q3 => reg_2_out(2),
		 Q2 => reg_2_out(1),
		 Q1 => reg_2_out(0),
		 Q5 => reg_2_out(4));


b2v_inst9 : 8dffe_7
PORT MAP(CLRN => clrn,
		 D2 => write_data(1),
		 D3 => write_data(2),
		 D4 => write_data(3),
		 D5 => write_data(4),
		 D8 => write_data(7),
		 D6 => write_data(5),
		 D7 => write_data(6),
		 CLK => clk2,
		 ENA => enbl3,
		 D1 => write_data(0),
		 PRN => SYNTHESIZED_WIRE_7,
		 Q8 => reg_3_out(7),
		 Q4 => reg_3_out(3),
		 Q6 => reg_3_out(5),
		 Q7 => reg_3_out(6),
		 Q3 => reg_3_out(2),
		 Q2 => reg_3_out(1),
		 Q1 => reg_3_out(0),
		 Q5 => reg_3_out(4));


END bdf_type;