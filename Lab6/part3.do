# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog part2.v

#load simulation using mux as the top level simulation module
vsim part2

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}

#Initialize inputs
force {Clock} 0 0 ns, 1 1 ns -repeat 2 ns
force {Go} 0 0ns, 1 3 ns -repeat 6 ns
force {Resetn} 0
force {DataIn} 0
run 4ns

#Load numbers (A, B, C, x)
force {Resetn} 1

force {DataIn} 1
run 4ns

force {DataIn} 10
run 4ns

force {DataIn} 11
run 90ns

#first load: A=1,B=2,C=3,x=3 -> R=18
#second load: A=B=C=x=3 -> R=39
