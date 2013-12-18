library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
port(   clk : in std_logic;
        s,t : in std_logic_vector(7 downto 0);
        aluFlag : in std_logic;
        immediate : in std_logic_vector(5 downto 0);
        opCode : in std_logic_vector(3 downto 0);
        aluCode : in std_logic_vector(2 downto 0);
        d : out std_logic_vector(7 downto 0);
        overflow : out std_logic
        );
end alu;

architecture functions of alu is

signal dCopy : std_logic_vector(7 downto 0);
signal signedS : signed(7 downto 0);
signal signedT : signed(7 downto 0);

begin
	process(clk)
	begin

		if(aluFlag = '1') then
		
			if(rising_edge(clk)) then
				overflow <= '0';
				
				signedS <= signed(s);
				signedT <= signed(t);
				
				case opCode is
					when "0000" =>
						case aluCode is
							when "000" => 
								d <= s and t;  --and
							when "001" => 
								d <= s or t; --or
							when "010" => 
								dCopy <= std_logic_vector(signedS + signedT);  --add
								d <= dCopy;
								
								if (dCopy(7) = '1' AND s(7) = '0' AND t(7) = '0') then
									overflow <= '1';
								elsif (dCopy(7) = '0' AND s(7) = '1' AND t(7) = '1') then
									overflow <= '1';
								end if;
							when "011" => 
								dCopy <=std_logic_vector(signedS - signedT); --sub 
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
								d <= std_logic_vector(signedS sll to_integer(signedT)); --sll   
							when "111" => 
								d <= std_logic_vector(signedS srl to_integer(signedT)); --srl   
							when others =>
								NULL;
						end case;
					when "0001" =>
						dCopy <= std_logic_vector(unsigned(s) + unsigned(immediate));  --add
						d <= dCopy;
								
						if (dCopy(7) = '1' AND s(7) = '0' AND immediate(5) = '0') then
							overflow <= '1';
						elsif (dCopy(7) = '0' AND s(7) = '1' AND immediate(5) = '1') then
							overflow <= '1';
						end if;
					when "0010" =>
						dCopy <=std_logic_vector(unsigned(s) - unsigned(immediate)); --sub 
						d <= dCopy;
								
						if (dCopy(7) = '0' AND s(7) = '1' AND immediate(5) = '0') then
							overflow <= '1';
						elsif (dCopy(7) = '1' AND s(7) = '0' AND immediate(5) = '1') then
							overflow <= '1';
						end if;
					when "0011" =>
						dCopy <= std_logic_vector(signedS + signed(immediate));  --add
						d <= dCopy;
						
						if (dCopy(7) = '1' AND s(7) = '0' AND immediate(5) = '0') then
							overflow <= '1';
						elsif (dCopy(7) = '0' AND s(7) = '1' AND immediate(5) = '1') then
							overflow <= '1';
						end if;
					when "0100" =>
						dCopy <=std_logic_vector(signedS - signed(immediate)); --sub 
						d <= dCopy;
								
						if (dCopy(7) = '0' AND s(7) = '1' AND immediate(5) = '0') then
							overflow <= '1';
						elsif (dCopy(7) = '1' AND s(7) = '0' AND immediate(5) = '1') then
							overflow <= '1';
						end if;
					when others =>
						NULL;
				end case;       
			end if;  
		end if;
	end process;    
end functions;