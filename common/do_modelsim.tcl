puts {
  ModelSimSE general compile script
  }
puts "  $this_script_name"
proc r  {} "uplevel #0 source $this_script_name"
proc rr {} {global last_compile_time
            set last_compile_time 0
            r                            }
proc q  {} {quit -force                  }

# Prefer a fixed point font for the transcript
set PrefMain(font) {Courier 10 roman normal}

# Compile out of date files
set time_now [clock seconds]
if [catch {set last_compile_time}] {
  set last_compile_time 0
}
foreach {library file_list} $library_file_list {
  vlib $library
  vmap work $library
  foreach file $file_list {
    set file [subst $file]
    if { $last_compile_time < [file mtime $file] } {
      if [regexp -nocase {\.(vhdl|vhd|vho)$} $file] {
        vcom -2008 $file
      } else {
        vlog $file
      }
      set last_compile_time 0
    }
  }
}
set last_compile_time $time_now

# Load the simulation
regsub -all {\s+} $top_level { } top_level ;# Remove linebreaks
eval vsim -voptargs=+acc $top_level

# If waves are required
if [llength $wave_patterns] {
  noview wave
  foreach pattern $wave_patterns {
    add wave $pattern
  }
  configure wave -signalnamewidth 1
  foreach {radix signals} $wave_radices {
    foreach signal $signals {
      catch {property wave -radix $radix $signal}
    }
  }
}

# Run the simulation
run -all

# If waves are required
if [llength $wave_patterns] {
  wave zoomfull
}

puts -nonewline {\
Commands:  r = Recompile changed and dependent files
           rr = Recompile everything
            q = Quit without confirmation}

# How long since project began?
if {[file isfile start_time.txt] == 0} {
  set f [open start_time.txt w]
  puts $f "Start time was [clock seconds]"
  close $f
} else {
  set f [open start_time.txt r]
  set line [gets $f]
  close $f
  regexp {\d+} $line start_time
  set total_time [expr ([clock seconds]-$start_time)/60]
  puts "    ($total_time minutes elapsed)"
}
