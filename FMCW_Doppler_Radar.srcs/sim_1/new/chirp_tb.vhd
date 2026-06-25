library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity chirp_tb is
end chirp_tb;

architecture sim of chirp_tb is

signal clk : std_logic := '0';
signal rst : std_logic := '1';

signal phase_word : unsigned(31 downto 0);

begin

uut : entity work.chirp_gen
port map(
    clk => clk,
    rst => rst,
    phase_word => phase_word
);

clk <= not clk after 5 ns;

process
begin

    wait for 100 ns;
    rst <= '0';

    wait for 5 ms;

    assert false
    report "Simulation Finished"
    severity failure;

end process;

end sim;