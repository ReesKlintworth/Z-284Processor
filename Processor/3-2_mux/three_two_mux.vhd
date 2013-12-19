library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity three_two_mux is
port
(
	pc_addr : in std_logic_vector(7 downto 0);
	jump_addr : in std_logic_vector(7 downto 0);
	branch_addr : in std_logic_vector(7 downto 0);

	jump : in std_logic;
	branch : in std_logic;

	out_addr : out std_logic_vector(7 downto 0)
);
end three_two_mux;

architecture behav of three_two_mux is
	
	signal sel : std_logic_vector(1 downto 0);
begin
 
	sel <= jump & branch;
	
	WITH sel SELECT
		out_addr <= jump_addr WHEN "10",
					branch_addr WHEN "01",
					pc_addr WHEN OTHERS;
	
end behav;