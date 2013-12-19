library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity two_two_mux is
port
(
	rs : in std_logic_vector(7 downto 0);
	imm : in std_logic_vector(7 downto 0);
	
	jmp : in std_logic;
	jr : in std_logic;

	jump_addr : out std_logic_vector(7 downto 0)
);
end two_two_mux;

architecture behav of two_two_mux is
	
	signal sel : std_logic_vector(1 downto 0);
begin
 
	sel <= jmp & jr;
	
	WITH sel SELECT
		jump_addr <= imm WHEN "10",
					rs WHEN "01",
					null WHEN OTHERS;
					
end behav;