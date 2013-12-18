library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity addOne is
port
(
        input : in std_logic_vector(7 downto 0);
        output : out std_logic_vector(7 downto 0)
);
end addOne;

architecture behav of addOne is
	begin
       output <= input + 1;
	end behav;