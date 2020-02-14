library IEEE; 
use IEEE.std_logic_1164.all;

entity mux2 is
  port(in0, in1     : in  std_logic_vector(3 downto 0);
       sel          : in  std_logic;
       muxed_output : out std_logic_vector(3 downto 0));
end;

-- The architecture for mux2 sure is empty. Fix it!
architecture synth of mux2 is

begin

end;
