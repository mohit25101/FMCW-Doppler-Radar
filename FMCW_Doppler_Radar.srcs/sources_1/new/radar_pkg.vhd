library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package radar_pkg is

constant CLK_FREQ      : integer := 100000000;
constant CHIRP_TIME_MS : integer := 1;
constant PHASE_WIDTH   : integer := 32;

constant CHIRP_STEPS : integer :=
    (CLK_FREQ/1000)*CHIRP_TIME_MS;

end package;

package body radar_pkg is
end package body;