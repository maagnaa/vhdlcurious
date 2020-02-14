# 2_mux2: 2-vector multiplexer

In this exercise I provide you with the entity for a 2-vector multiplexer.  

What was a multiplexer again? Well...
> In electronics, a multiplexer (or mux), also known as a data selector, is a device that selects between several input signals and forwards it to a single output line.
  
Your job is to implement the architecture with as few lines of code as possible.  
(Hint! You only technically need one.)  
  
When you have done this, you will want to simulate that the multiplexer behaves as expected. This time around, your job is to implement the whole testbench.  

I give you the mux2_tb.vhd file allright, but there are some questions to be asked about the tb entity?  
  
Good luck!

## HOWTO simulate a new design

Simulation should be easy peasy lemon squeezy, just like for 1_smoldrill.  

### General Instructions

1. Start Modelsim.
2. Click on *"Jumpstart"*.
3. Click on *"Create a project"*.
  ..* **Project Name**: `X_sim`
  ..* Where X is the name of the module **entity**.  
  ....* Example: For entity name logic => *logic_sim*. For entity name mux2 => *mux_sim*.  
  ..* **Project Location**: `<path_to_vhdlcurious>/vhdlcurios/<module>/sim`
  ..* **Default Library Name**: `myLib`  
  ..* The rest is right by default methinks.

### ATTENTION

From now on the above information (general instructions for simulation) will always be included as the README.md of the **sim directory** and **NOT** in the README for the vhdlcurios/x_module folder.