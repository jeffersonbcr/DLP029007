library ieee;
use ieee.std_logic_1164.all;

entity adder_bcd is
	port
	(
		a,b	:	in	std_logic_vector(15 downto 0);
		s	:	out std_logic_vector(19 downto 0)
	);
end entity;

architecture adder_bcd_v1 of adder_bcd is
	signal a_signal	:	std_logic_vector(a'left downto a'right);
	signal b_signal	:	std_logic_vector(b'left downto b'right);
	signal cin	:	std_logic_vector(4 downto 0);

	component adder is
	port
	(
		a,b	: in  std_logic_vector(3 downto 0);
		cin	: in	std_logic;
		s		: out std_logic_vector(3 downto 0);
		cout	: out std_logic
	);
	end component;

begin
	a_signal		<= a;
	b_signal		<= b;
	cin(0)	<= '0';

		add_inputs:
		for i in 0 to 3 generate
			Add : adder
				port map
				(
					a		=>	a_signal((4*i+3) downto 4*i),
					b		=> b_signal((4*i+3) downto 4*i),
					cin	=>	cin(i),

					s		=> s((4*i+3) downto 4*i),
					cout	=> cin(i+1)
				);
		end generate;

		s(19 downto 16) <= (16 => cin(4), others => '0');
end architecture;