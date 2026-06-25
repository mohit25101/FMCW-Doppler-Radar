library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.radar_pkg.all;

entity chirp_gen is
port(
    clk         : in std_logic;
    rst         : in std_logic;
    phase_word  : out unsigned(31 downto 0)
);
end chirp_gen;

architecture rtl of chirp_gen is

signal cnt      : integer range 0 to CHIRP_STEPS;
signal phaseacc : unsigned(31 downto 0);

signal step     : unsigned(31 downto 0) :=
                  to_unsigned(1000,32);

signal dir      : std_logic := '1';

begin

process(clk)
begin

if rising_edge(clk) then

    if rst='1' then

        cnt <= 0;
        phaseacc <= (others=>'0');
        dir <= '1';

    else

        if dir='1' then
            phaseacc <= phaseacc + step;
        else
            phaseacc <= phaseacc - step;
        end if;

        if cnt = CHIRP_STEPS then
            cnt <= 0;
            dir <= not dir;
        else
            cnt <= cnt + 1;
        end if;

    end if;

end if;

end process;

phase_word <= phaseacc;

end rtl;