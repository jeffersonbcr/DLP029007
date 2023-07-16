library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity adder is
	port
	(
		a	: in std_logic_vector(13 downto 0);
		b	: in std_logic_vector(13 downto 0);

		s	: out std_logic_vector(15 downto 0)
	);
end entity;

architecture adder_v1 of adder is

begin
	s <= std_logic_vector(resize(unsigned(a), 16) + resize(unsigned(b), 16));

end architecture;