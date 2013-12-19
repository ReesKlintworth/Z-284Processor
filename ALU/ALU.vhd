library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity alu is
port(
        clk : in std_logic;
        s,t,dIn : in std_logic_vector(7 downto 0);
        aluFlag : in std_logic;
        immediate : in std_logic_vector(7 downto 0);
        opCode : in std_logic_vector(3 downto 0);
        aluCode : in std_logic_vector(2 downto 0);
        d : out std_logic_vector(7 downto 0);
        overflow : out std_logic;
        zero : out std_logic
        );
end alu;

architecture functions of alu is

signal dCopy : std_logic_vector(7 downto 0);
signal signedS : signed(7 downto 0);
signal signedT : signed(7 downto 0);
signal signedD : signed(7 downto 0);

begin
	process(clk)
	begin

		if(aluFlag = '1') then
			overflow <= '0';
			zero <= '0';
			
			signedS <= signed(s);
			signedT <= signed(t);
			signedD <= signed(dIn);
			
			case opCode is
				when "0000" =>
					case aluCode is
						when "000" => 
							d <= s and t;  --and
						when "011" => 
							d <= s or t; --or
						when "001" => 
							dCopy <= std_logic_vector(signedS + signedT);  --add
							d <= dCopy;
							
							if (dCopy(7) = '1' AND s(7) = '0' AND t(7) = '0') then
								overflow <= '1';
							elsif (dCopy(7) = '0' AND s(7) = '1' AND t(7) = '1') then
								overflow <= '1';
							end if;
							
							if (dCopy = "00000000") then
								zero <= '1';
							end if;
						when "101" => 
							dCopy <=std_logic_vector(signedS - signedT); --sub 
							d <= dCopy;
							
							if (dCopy(7) = '0' AND s(7) = '1' AND t(7) = '0') then
								overflow <= '1';
							elsif (dCopy(7) = '1' AND s(7) = '0' AND t(7) = '1') then
								overflow <= '1';
							end if;
							
							if (dCopy = "00000000") then
								zero <= '1';
							end if;
						when "010" => 
							d <= s xor t; --xor             
						when "100" => 
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
							
					if (dCopy(7) = '1' AND s(7) = '0' AND immediate(7) = '0') then
						overflow <= '1';
					elsif (dCopy(7) = '0' AND s(7) = '1' AND immediate(7) = '1') then
						overflow <= '1';
					end if;
					
					if (dCopy = "00000000") then
						zero <= '1';
					end if;
				when "0010" =>
					dCopy <=std_logic_vector(unsigned(s) - unsigned(immediate)); --sub 
					d <= dCopy;
							
					if (dCopy(7) = '0' AND s(7) = '1' AND immediate(7) = '0') then
						overflow <= '1';
					elsif (dCopy(7) = '1' AND s(7) = '0' AND immediate(7) = '1') then
						overflow <= '1';
					end if;
					
					if (dCopy = "00000000") then
						zero <= '1';
					end if;
				when "0011" =>
					dCopy <= std_logic_vector(signedS + signed(immediate));  --add
					d <= dCopy;
					
					if (dCopy(7) = '1' AND s(7) = '0' AND immediate(7) = '0') then
						overflow <= '1';
					elsif (dCopy(7) = '0' AND s(7) = '1' AND immediate(7) = '1') then
						overflow <= '1';
					end if;
					
					if (dCopy = "00000000") then
						zero <= '1';
					end if;
				when "0100" =>
					dCopy <=std_logic_vector(signedS - signed(immediate)); --sub 
					d <= dCopy;
							
					if (dCopy(7) = '0' AND s(7) = '1' AND immediate(7) = '0') then
						overflow <= '1';
					elsif (dCopy(7) = '1' AND s(7) = '0' AND immediate(7) = '1') then
						overflow <= '1';
					end if;
					
					if (dCopy = "00000000") then
						zero <= '1';
					end if;
				when "1000" =>
					dCopy <= std_logic_vector(signedD - signedS);
					d <= dCopy;
					
					if (dCopy = "00000000") then
						zero <= '1';
					end if;
				when "1001" =>
					dCopy <= std_logic_vector(signedD - signedS);
					d <= dCopy;
					
					if (dCopy = "00000000") then
						zero <= '1';
					end if;
				when others =>
					NULL;
			end case;        
		end if;
	end process;    
end functions;