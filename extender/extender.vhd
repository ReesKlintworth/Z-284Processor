library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity extender is
port
(
	input : in std_logic_vector(5 downto 0);
	output : out std_logic_vector(7 downto 0)
);
end extender;

architecture behav of extender is
	begin
		output <= '0' & '0' & input;
end behav;