library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
port(   clk : in std_logic;
        s,t : in std_logic_vector(7 downto 0);
        aluCode : in std_logic_vector(2 downto 0);
        d : out std_logic_vector(7 downto 0)
        --overflow : out std_logic
        );
end alu;

architecture functions of alu is

signal overflow : std_logic;
signal dCopy : std_logic_vector (7 downto 0);

begin
	process(clk)
	begin

		if(rising_edge(clk)) then
			overflow <= '0';
			
			case aluCode is
				when "000" => 
					d <= s and t;  --and
				when "001" => 
					d <= s or t; --or
				when "010" => 
					dCopy <= std_logic_vector(signed(s) + signed(t));  --add
					d <= dCopy;
					
					if (dCopy(7) = '1' AND s(7) = '0' AND t(7) = '0') then
						overflow <= '1';
					elsif (dCopy(7) = '0' AND s(7) = '1' AND t(7) = '1') then
						overflow <= '1';
					end if;
				when "011" => 
					dCopy <=std_logic_vector(signed(s) - signed(t)); --sub 
					d <= dCopy;
					
					if (dCopy(7) = '0' AND s(7) = '1' AND t(7) = '0') then
						overflow <= '1';
					elsif (dCopy(7) = '1' AND s(7) = '0' AND t(7) = '1') then
						overflow <= '1';
					end if;
				when "100" => 
					d <= s xor t; --xor             
				when "101" => 
					if(s < t) then
						d <= s; --slt
					end if;
				when "110" => 
					--d <= s sll t;  --sll   
				when "111" => 
					--d <= s srl t; --srl   
				when others =>
					NULL;
			end case;       
		end if;  
	end process;    
end functions;