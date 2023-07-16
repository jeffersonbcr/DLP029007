library ieee;
use ieee.std_logic_1164.all;

entity adder_bin is
	port
	(
		a,b	: in std_logic_vector(13 downto 0);
		clk, rst : in std_logic;
		s0, s1, s2, s3, s4	: out std_logic_vector(3 downto 0)
	);
end entity;

architecture adder_bin_v1 of adder_bin is
	signal s_signal : std_logic_vector(15 downto 0);

	component adder is
	port
	(
		a	: in std_logic_vector(13 downto 0);
		b	: in std_logic_vector(13 downto 0);
		s	: out std_logic_vector(15 downto 0)
	);
	end component;

	component bin2bcd is
		generic(N: positive := 16);
		port(
		  clk, reset: in std_logic;
		  binary_in: in std_logic_vector(15 downto 0);
		  bcd0, bcd1, bcd2, bcd3, bcd4: out std_logic_vector(3 downto 0)
		);
end component;
begin

	Adder_bin : adder
		port map
		(
			a	=> a,
			b	=> b,
			s	=> s_signal
		);

	Bin_2_bcd : bin2bcd
		port map(
		  clk 		=> clk,
		  reset		=> rst,
		  binary_in	=> s_signal,

		  bcd0		=> s0,
		  bcd1		=> s1,
		  bcd2		=> s2,
		  bcd3		=> s3,
		  bcd4		=> s4
		);

end architecture;
