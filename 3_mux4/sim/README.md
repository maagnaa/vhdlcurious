# HOWTO simulate a new design

Simulation should be easy peasy lemon squeezy, just like for 1_smoldrill.  

## General Instructions

1. Start Modelsim.
2. Click on *"Jumpstart"*.
3. Click on *"Create a project"*.
  ..* **Project Name**: `X_sim`
  ..* Where X is the name of the module **entity**.  
  ....* Example: For entity name logic => *logic_sim*. For entity name mux2 => *mux_sim*.  
  ..* **Project Location**: `<path_to_vhdlcurious>/vhdlcurios/<module>/sim`
  ..* **Default Library Name**: `myLib`  
  ..* The rest is right by default methinks.