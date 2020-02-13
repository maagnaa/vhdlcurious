SmolDrill1 is live! Dette er en oppfriskning i basic VHDL.    

# Instruksjoner
## Part 1: Modde logic.vhd

- Gå inn på:    `src/logic.vhd ` 

- Alle instruksjoner ligger inne som kommentarer i filen.   

- Når du har fylt alt ut er du klar for steg 2!

## Part 2: Simulering av logic.vhd
Last ned hele vhdlcurious repo og kopier den lokalt hos deg. Det er viktig at du beholder mappestrukturen. :)

*** MEN BRUK DEN VERSJONEN AV `logic.vhd` SOM DU MODDET!

1. Spark ModelSim i gang.
2. Trykk på *"Jumpstart".*
3. Trykk på *"Create a project"*.  
   Oppgi følgende:
    - **Project Name**: `logic_sim`
    - **Project Location**: `<path_to_vhdlcurious>/vhdlcurios/SmolDrill/sim `   
       => Eg. `C:/Users/magna.nordgard/Documents/GitHub/vhdlcurious/SmolDrill1/sim`
    - **Default Library Name**: `myLib`  
    - Resten skal være riktig by default.
4. Lukk *"Add items to the project"*-fanen.
5. Husk at jeg er glad i deg.
6. Nederst på transcript/konsolen vil du se at det står:  
  `ModelSim > `
7. Skriv inn følgende på kosolen:  
   `ModelSim > do ../script/compile_all.tcl`
8. Check simuleringens waveform. Stemmer resultatet overens med tabellen din for Del 1?
  
  ## Part 3: Legg til assertions i logic_tb.vhd
  
  ###### (Del 3 er ikke så basic egentlig men *jævlig nyttig* og allright å ta i bruk).

  Det er litt kjedelig - eller ihvertfall  **uoversiktlig** -  dersom vi alltid trenger å undersøke alle waveforms manuelt og rassonere oss frem til om disse stemmer eller ikke med ønsket resultat.
  Det er mye greiere om vi kan bygge noe form for sjekk inn i testbenk, slik at vi automatisk får beskjed når noe ikke stemmer.
  
  ### Enter... **ASSERTIONS!**
  
  **Syntax:** `assert CONDITION report MESSAGE severity LEVEL`  
  
  Dersom **CONDITION** ikke stemmer (aka. returns FALSE), kommer simulatoren printe ut følgende:
  - At en "assertion violation" har skjedd, la oss si at violation == overtreddelse på norsk
  - Det man har oppgitt som **MESSAGE** og **LEVEL** 
      - **LEVEL** må være av type `SEVERITY_LEVEL`, som har følgende gyldige verdier: `NOTE, WARNING, ERROR, FAILURE`.   
  - Timestamp på når overtreddelsen skjedde
  - Navnet på design unit
  
  Eksempelsyntax
<!-- START VHDL BLOCK -->  
```vhdl 
   assert not ( enable = '1') report "Enable flag is not set, the module is disabled!" severity ERROR;
``` 
<!-- STOP VHDL BLOCK -->  
  ### Brukseksempel
  La oss anta at vi har implementert følgende funksjonalitet i `logic.vhd`:  
<!-- START VHDL BLOCK -->  
```vhdl 
   out0 <= not in0;     
   out1 <= not in1;   
   out2 <= not in2;    
``` 
<!-- STOP VHDL BLOCK -->

  Vi ønsker å sjekke at følgende stemmer, men vi gidder ikke å lete i simuleringen:
  
|    | IN2 | IN1 | IN0 | OUT2 | OUT1 | OUT0 |
|:--:|:---:|:---:|:---:|:----:|:----:|:----:|
| K0 |  0  |  0  |  0  |   1  |   1  |   1  |
| K8 |  1  |  1  |  1  |   0  |   0  |   0  |

  Dette fikser vi lett i testbenken på følgende måte:  
<!-- START VHDL BLOCK -->  
```vhdl 

  -- Test K0   
  IN2 <= '0';  IN1 <= '0';  IN0 <= '0';   
  wait for 10 NS;   
  assert not (OUT2 = '1') report "OUT2 is not 1 when IN2 is 0";   
  assert not (OUT1 = '1') report "OUT1 is not 1 when IN1 is 0";   
  assert not (OUT0 = '1') report "OUT0 is not 1 when IN0 is 0"; 
   -- Test K8   
  IN2 <= '1';  IN1 <= '1';  IN0 <= '1';   
  wait for 10 NS;   
  assert not (OUT2 = '0') report "OUT2 is not 0 when IN2 is 1";   
  assert not (OUT1 = '0') report "OUT1 is not 0 when IN1 is 1";   
  assert not (OUT0 = '0') report "OUT0 is not 0 when IN0 is 1"; 

```  
<!-- STOP VHDL BLOCK --> 

### Oppgaver Del 3

0. Hvorfor blir følgende også riktig @ brukseksempelet ovenfor? 
<!-- START VHDL BLOCK -->  
```vhdl 

  -- Test K0   
  IN2 <= '0';  IN1 <= '0';  IN0 <= '0';   
  wait for 10 NS;   
  assert  (OUT2 = '0') report "OUT2 is not 1 when IN2 is 0";   
  assert  (OUT1 = '0') report "OUT1 is not 1 when IN1 is 0";   
  assert  (OUT0 = '0') report "OUT0 is not 1 when IN0 is 0"; 
   -- Test K8   
  IN2 <= '1';  IN1 <= '1';  IN0 <= '1';   
  wait for 10 NS;   
  assert  (OUT2 = '1') report "OUT2 is not 0 when IN2 is 1";   
  assert  (OUT1 = '1') report "OUT1 is not 0 when IN1 is 1";   
  assert  (OUT0 = '1') report "OUT0 is not 0 when IN0 is 1"; 

```  
<!-- STOP VHDL BLOCK --> 

1. Legg inn sjekk for alle kombinasjoner i `logic_tb.vhd` med bruk av assertions og kjør simuleringen på nytt.
      - Trykk på "Simulate" -> "End Simulation" for å avslutte forrige simulering
      - Kjør tcl scriptet på nytt :)
     
2. **[Valgfritt]** Se for deg at vi lever i en verden hvor ingen har funnet opp assertions enda.  
      - Implementer sjekk tilsvarende de du lagde i 3.a, men uten å bruke assertions. 
      - Gjør det kun for to kombinasjoner, proof of concept lissom
3. Kan du komme på noe måte å komprimere testbenken din (v3.1) så den blir mer oversiktlig?
      - Hints: concatenation operator `&`  , interne signaler.
      - Spør hvis du ikke har noen ideer etter å ha funnet ut av hva `&` gjør.
      - **Vil ikke at du skal bli stresset! Hvis du blir stresset, TA PAUSE!!!**   
         - Si ifra om at du ble stuck, og i hvilken oppgave, så reiser du deg opp og går en tur elns. 
         - Da bryter jeg bare oppggaven opp i mindre biter, evt. gir deg et kommentert løsningsforslag.
      

     

