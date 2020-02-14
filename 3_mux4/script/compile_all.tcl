
# Author: Magna Karina Nordgard
#
# Søt ModelSim kompileringsscript 

set library_file_list {
                           mylib {
                             ../src/mux4.vhd
                             ../tb/mux4_tb.vhd
                           }
}
set top_level              mylib.mux4
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
