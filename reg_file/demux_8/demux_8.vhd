library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity demux_8 is
port 
(
  sel : in std_logic_vector(2 downto 0);
  bitin : in std_logic;

  out0 : out std_logic;
  out1 : out std_logic;
  out2 : out std_logic;
  out3 : out std_logic;
  out4 : out std_logic;
  out5 : out std_logic;
  out6 : out std_logic;
  out7 : out std_logic
);
end demux_8;

architecture Behavioral of demux_8 is
begin
  process(bitin,sel)
  begin
	out0 <= '0';
    out1 <= '0';
    out2 <= '0';
    out3 <= '0';
    out4 <= '0';
    out5 <= '0';
    out6 <= '0';
    out7 <= '0';
    case sel is
      when "001" => out1 <= bitin;
      when "010" => out2 <= bitin;
      when "011" => out3 <= bitin;
      when "100" => out4 <= bitin;
      when "101" => out5 <= bitin;
      when "110" => out6 <= bitin;
      when "111" => out7 <= bitin;
      when others => null;
    end case; 
  end process;
end Behavioral;