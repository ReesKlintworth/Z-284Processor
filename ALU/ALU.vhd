library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
port(   clk : in std_logic;
        s,t : in signed(7 downto 0);
        aluCode : in unsigned(2 downto 0);
        d : out signed(7 downto 0)
        );
end alu;

architecture functions of alu is
begin
	process(clk)
	begin

		if(rising_edge(clk)) then
			case aluCode is
				when "000" => 
					d <= s and t;  --and
				when "001" => 
					d <= s or t; --or
				when "010" => 
					d <= s + t;  --add
				when "011" => 
					d <= s - t; --sub 
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