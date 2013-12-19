library ieee;
use ieee.std_logic_1164.all;

entity zero_flag is
port
(
	zero_flag_in : in std_logic;
	in_clk : in std_logic;
	
	zero_flag_out : out std_logic
);
end zero_flag;

architecture behav of zero_flag is
begin
	process(in_clk)
	begin
	if rising_edge(in_clk) then
			if zero_flag_in = '1' then
				zero_flag_out <= '1';
			end if;
	end if;
	end process;
end behav;