# HOWTO simulate a new design

Simulation should be easy peasy lemon squeezy, just like for 1_smoldrill.  
### General Instructions

1. Start Modelsim.
2. Click on *"Jumpstart"*.
3. Click on *"Create a project"*, and fill out the following parameters:
    * **Project Name**: `entityx_sim`
    * Where entityx is a placeholder for the name of the modules **entity**.  
        * Example: For a module with entity name *logic* => Use project name *logic_sim*. 
        * For a module with entity name *mux2* => Use project name *mux_sim*.  osv osv osv
    * **Project Location**: `<path_to_vhdlcurious>/vhdlcurios/<module>/sim`
    * **Default Library Name**: `myLib`  
    * The rest is right by default methinks.
