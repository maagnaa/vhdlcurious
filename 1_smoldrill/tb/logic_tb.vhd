library IEEE;
use IEEE.std_logic_1164.all;

entity logic_tb is
end entity logic_tb;

architecture tb of logic_tb is

  signal IN0        : std_logic;
  signal IN1        : std_logic;
  signal IN2        : std_logic;
  signal IN3        : std_logic;
  signal OUT0       : std_logic;
  signal OUT1       : std_logic;
  signal OUT2       : std_logic;

begin

  process
  begin
    -- Test K0
    IN2 <= '0';  IN1 <= '0';  IN0 <= '0'; 
    wait for 10 NS;
    -- Test K1
    IN2 <= '0';  IN1 <= '0';  IN0 <= '1'; 
    wait for 10 NS;
    -- Test K2
    IN2 <= '0';  IN1 <= '1';  IN0 <= '0'; 
    wait for 10 NS;
    -- Test K3
    IN2 <= '0';  IN1 <= '1';  IN0 <= '1'; 
    wait for 10 NS;
    -- Test K4
    IN2 <= '1';  IN1 <= '0';  IN0 <= '0'; 
    wait for 10 NS;
    -- Test K5
    IN2 <= '1';  IN1 <= '0';  IN0 <= '1'; 
    wait for 10 NS;
    -- Test K6
    IN2 <= '1';  IN1 <= '1';  IN0 <= '0'; 
    wait for 10 NS;
    -- Test K7
    IN2 <= '1';  IN1 <= '1';  IN0 <= '1'; 
    wait for 10 NS;

    wait;
  end process;

  M: entity work.logic(RTL)
  port map (
    IN0  => IN0,
    IN1  => IN1,
    IN2  => IN2,
    OUT0 => OUT0,
    OUT1 => OUT1,
    OUT2 => OUT2
  );

end architecture tb;
