library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity oneBitAdder is
	port (
		a, b, cin : in std_logic;
		sum, cout : out std_logic
	);
end oneBitAdder;

architecture summing of oneBitAdder is
begin
	sum <= a xor b xor cin;
	cout <= (a and b) or (a and cin) or (b and cin);
end summing;