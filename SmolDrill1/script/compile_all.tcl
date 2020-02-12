
# Author: Magna Karina Nordgard
#
# Søt ModelSim kompileringsscript for SmolDrill1 

set library_file_list {
                           mylib {
                             ../src/logic.vhd
                             ../tb/logic_tb.vhd
                           }
}
set top_level              mylib.logic_tb
set wave_patterns {
                           /*
}
set wave_radices {
                           hexadecimal *
}
set this_script_name       ./compile_all.tcl


# The following line is for testing

# Now source the general compile script:
source ../../common/do_modelsim.tcl
