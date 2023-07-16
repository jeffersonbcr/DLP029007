library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
	port
	(
		a,b	: in  std_logic_vector(3 downto 0);
		cin	: in	std_logic;
		s		: out std_logic_vector(3 downto 0);
		cout	: out std_logic
	);
end entity;

architecture adder_v1 of adder is
	 signal a_signal, b_signal : unsigned(4 downto 0);
    signal cin_signal : unsigned(4 downto 0);
    signal s_signal : unsigned(4 downto 0);
	 signal result : unsigned(4 downto 0);
begin

	a_signal <= resize(unsigned(a), 5);
	b_signal <= resize(unsigned(b), 5);

	cin_signal(0) <= cin;
	cin_signal(1) <= '0';
	cin_signal(2) <= '0';
	cin_signal(3) <= '0';
	cin_signal(4) <= '0';

	result <= a_signal + b_signal + cin_signal;

	cout <= '1' when result > 9 else '0';

	s_signal <= result + "0101" when result > 9 else result;

	s <= std_logic_vector(resize(s_signal, 4));

end architecture;