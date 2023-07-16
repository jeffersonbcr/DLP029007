-- Testbench created online at:
--   https://www.doulos.com/knowhow/perl/vhdl-testbench-creation-using-perl/
-- Copyright Doulos Ltd

library IEEE;
use IEEE.Std_logic_1164.all;
use IEEE.Numeric_Std.all;

entity adder_bcd_tb is
end;

architecture bench of adder_bcd_tb is

  component adder_bcd
  	port
  	(
  		a,b	:	in	std_logic_vector(15 downto 0);
  		s	:	out std_logic_vector(19 downto 0)
  	);
  end component;

  constant sleep: time := 30 ns;

  signal a,b: std_logic_vector(15 downto 0);
  signal s: std_logic_vector(19 downto 0) ;

begin

  uut: adder_bcd port map ( a => a,
                            b => b,
                            s => s );

  stimulus: process
  begin
		-- Put initialisation code here
		a <= "0001000100010001";
		b <= "0001000100010001";

		wait for sleep;

		assert (S = "00000010001000100010");
		report "Error for adding: 1+1" severity error;

		a <= "1001100110011001";

		wait for sleep;

		assert (S = "00010000000000000000");
		report "Error for adding: 9 + 1" severity error;

		a <= "0001000100010001";
		b <= "1001100110011001";

		wait for sleep;

		assert (S = "00010000000000000000");
		report "Error for adding: 1 + 9" severity error;

		a <= "1001100110011001";

		wait for sleep;

		assert (S = "00011001100110011000");
		report "Error for adding: 9 + 9" severity error;

    -- Put test bench stimulus code here

    wait;
  end process;


end;