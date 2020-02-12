----------------------------------------------------
-- Frisk Opp: Context Clause
----------------------------------------------------
-- Hva er en context clause i VHDL?
-- Definisjon: 
-- " Used to name a library and make library units visible
--   to the design unit that immediately follows.
--
-- a. Hvilke biblioteker må alltid legges ved i context clausen og hvorfor?
-- b. Hvilke andre VHDL biblioteker kan være nyttige? I hvilke sammenheng?
library IEEE;
use IEEE.Std_logic_1164.all;
----------------------------------------------------
-- Frisk Opp: Entity Declaration
----------------------------------------------------
-- a.  Hva er en "entity"? Hva er "entity declaration"?
-- b.  Hvilke typer porter kan du ha?
-- c.  Hva er std_logic?
-- d.  Hva er std_logic_vector?
entity logic is
  port (
    IN0 : in  std_logic;
    IN1 : in  std_logic;
    IN2 : in  std_logic;
    OUT0: out std_logic;
    OUT1: out std_logic;
    OUT2: out std_logic
  );
end entity logic;

----------------------------------------------------
-- Frisk Opp: Architecture
----------------------------------------------------
-- a. Hva er architechture?
-- b. Hva står "RTL" for?
-- c. Hvor og hvordan kan man deklarere signaler og konstanter? 
architecture RTL of logic is
----------------------------------------------------
-- TODO: Make some stuff!
----------------------------------------------------
-- Finn på noe å gjøre dine input IN0-IN2, slik at du får noe spennende outputs OUT2-OUT0
--        => AND them, OR them, AND+OR them, MASH them, PUT em in a STEW!!
--           BBY u can do whatever u want.
--
-- Etter at du har implementert funksjonaliteten du ønsker, skal du fylle ut
-- tabellen nedenfor med forventede output for alle kombinasjoner av input.
-- +----+-----+-----+-----+------+------+------+
-- |    | IN2 | IN1 | IN0 | OUT2 | OUT1 | OUT0 |
-- +----+-----+-----+-----+------+------+------+
-- | K0 |  0  |  0  |  0  |      |      |      |
-- +----+-----+-----+-----+------+------+------+
-- | K1 |  0  |  0  |  1  |      |      |      |
-- +----+-----+-----+-----+------+------+------+
-- | K2 |  0  |  1  |  0  |      |      |      |
-- +----+-----+-----+-----+------+------+------+
-- | K3 |  0  |  1  |  1  |      |      |      |
-- +----+-----+-----+-----+------+------+------+
-- | K4 |  1  |  0  |  0  |      |      |      |
-- +----+-----+-----+-----+------+------+------+
-- | K5 |  1  |  0  |  1  |      |      |      |
-- +----+-----+-----+-----+------+------+------+
-- | K6 |  1  |  1  |  0  |      |      |      |
-- +----+-----+-----+-----+------+------+------+
-- | K8 |  1  |  1  |  1  |      |      |      |
-- +----+-----+-----+-----+------+------+------+
-- K1 står for "kombinasjon 1", osv.

begin




end architecture RTL;
