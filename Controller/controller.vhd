library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity controller is
port(
        clk : in std_logic;
        opCode : in std_logic_vector(3 downto 0);   
        jump : out std_logic;
        jumpReg : out std_logic;
        bne : out std_logic;
        beq : out std_logic;
        memRead : out std_logic;
        memToReg : out std_logic;
        memWrite : out std_logic;
        regWrite : out std_logic;
        aluFlag : out std_logic
        );
end controller;

architecture functions of controller is

begin
        process(clk)
        begin
			aluFlag <= '0';
			jump <= '0';
			jumpReg <= '0';
			beq <= '0';
			bne <= '0';
			memRead <= '0';
			memToReg <= '0';
			memWrite <= '0';
			regWrite <= '0';
			
			if(opCode = "0000" or opCode = "0001" OR opCode = "0010" OR opCode = "0011" OR opCode = "0100") then
				aluFlag <= '1';
				regWrite <= '1';
			elsif opCode = "0101" then
				jump <= '1';
			elsif opCode <= "0110" then
				jumpReg <= '1';
			elsif opCode = "1000" then
				beq <= '1';
				aluFlag <= '1';
			elsif opCode = "1001" then
				bne <= '1';
				aluFlag <= '1';
			elsif(opCode = "1010") then
				memRead <= '1';
				memToReg <= '1';
				regWrite <= '1';
			elsif(opCode = "1011") then
				memWrite <= '1';
			end if;
  
        end process;    
end functions;