library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity display_buddy is
port
(
	in_clk : in std_logic;
	ram_data : in std_logic_vector(7 downto 0);
	ram_addr : in std_logic_vector(7 downto 0);
	w_e : in std_logic;
	btn1 : in std_logic;
	btn2 : in std_logic;
	dip : in std_logic_vector(7 downto 0);
	
	hw_datasource : out std_logic;
	decimal_1 : out std_logic;
	decimal_2 : out std_logic;
	display_addr : out std_logic_vector(13 downto 0);
	data_out : out std_logic_vector(7 downto 0)
);
end display_buddy;

architecture behav of display_buddy is
	
	signal left_digit : std_logic_vector(6 downto 0);
	signal right_digit : std_logic_vector(6 downto 0);
	
begin
	process (ram_addr)
	begin
		if (ram_addr < "00000011") then
			hw_datasource <= '1';
		else
			hw_datasource <= '0';
		end if;
	end process; 
	
	process (in_clk)
	begin
	
	if rising_edge(in_clk) then
		if w_e = '1' then
			if ram_addr = "00000000" then 
				case ram_data(7 downto 4) is
					when "0000" => 
						left_digit <= "0000001";
					when "0001" =>
						left_digit <= "1001111";
					when "0010" =>
						left_digit <= "0010010";
					when "0011" =>
						left_digit <= "0000110";
					when "0100" =>
						left_digit <= "1001100";
					when "0101" =>
						left_digit <= "0100100";
					when "0110" =>
						left_digit <= "0100000";
					when "0111" =>
						left_digit <= "0001111";
					when "1000" =>
						left_digit <= "0000000";
					when "1001" =>
						left_digit <= "0001100";
					when "1010" =>
						left_digit <= "0001000";
					when "1011" =>
						left_digit <= "1100000";
					when "1100" =>
						left_digit <= "0110001";
					when "1101" =>
						left_digit <= "1000010";
					when "1110" =>
						left_digit <= "0110000";
					when "1111" =>
						left_digit <= "0111000";
					when others => null;
				end case;
					
				case ram_data(3 downto 0) is
					when "0000" => 
						right_digit <= "0000001";
					when "0001" =>
						right_digit <= "1001111";
					when "0010" =>
						right_digit <= "0010010";
					when "0011" =>
						right_digit <= "0000110";
					when "0100" =>
						right_digit <= "1001100";
					when "0101" =>
						right_digit <= "0100100";
					when "0110" =>
						right_digit <= "0100000";
					when "0111" =>
						right_digit <= "0001111";
					when "1000" =>
						right_digit <= "0000000";
					when "1001" =>
						right_digit <= "0001100";
					when "1010" =>
						right_digit <= "0001000";
					when "1011" =>
						right_digit <= "1100000";
					when "1100" =>
						right_digit <= "0110001";
					when "1101" =>
						right_digit <= "1000010";
					when "1110" =>
						right_digit <= "0110000";
					when "1111" =>
						right_digit <= "0111000";
					when others => null;
				end case;
				
			elsif ram_addr = "00000001" then
				
				if ram_data = "00000000" then
					decimal_1 <= '1';
				else
					decimal_1 <= '0';
				end if;
				
			elsif ram_addr = "00000010" then
				
				if ram_data = "00000000" then
					decimal_2 <= '1';
				else
					decimal_2 <= '0';
				end if;
			end if;
			
			display_addr <= left_digit & right_digit;
		else 
			if ram_addr = "00000000" then
				data_out <= not dip;
			elsif ram_addr = "00000001" then
				data_out <= "0000000" & not btn1;
			elsif ram_addr = "00000010" then
				data_out <= "0000000" & not btn2;
			end if;
		end if;
		
	end if;
	end process;
end behav;