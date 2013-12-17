library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity eightBitAdder is
port(   
        s,t : in std_logic_vector(7 downto 0);
        d : out std_logic_vector(7 downto 0);
        e : out std_logic_Vector(7 downto 0);
        overflow1 : out std_logic;
        overflow2 : out std_logic
        );
end eightBitAdder;

architecture functions of eightBitAdder is

--signal overflow : std_logic;
signal dCopy : std_logic_vector (7 downto 0);
signal eCopy : std_logic_vector (7 downto 0);

begin
	process(s,t, dCopy, eCopy)
	begin
		overflow1 <= '0';
		overflow2 <= '0';
				
		dCopy <= std_logic_vector(signed(s) + signed(t));  --add
		d <= dCopy;
		
		if (dCopy(7) = '1' AND s(7) = '0' AND t(7) = '0') then
			overflow1 <= '1';
		elsif (dCopy(7) = '0' AND s(7) = '1' AND t(7) = '1') then
			overflow1 <= '1';
		end if;
		 
		eCopy <=std_logic_vector(signed(s) - signed(t)); --sub 
		e <= eCopy;
		
		if (eCopy(7) = '0' AND s(7) = '1' AND t(7) = '0') then
			overflow2 <= '1';
		elsif (eCopy(7) = '1' AND s(7) = '0' AND t(7) = '1') then
			overflow2 <= '1';
		end if;    
	end process;       
end functions;