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

#Test Case 1
force {ClockIn} 0 0 ns, 1 1 ns -repeat 2 ns
force {Reset} 1
force {Speed} 00
run 5ns

force {ClockIn} 1 0 ns, 0 1 ns -repeat 2 ns
force {Reset} 0
run 6ns

force {Speed} 01
force {ClockIn} 1 0 ns, 0 1 ns -repeat 2 ns
run 1100ns

force {Speed} 10
force {ClockIn} 1 0 ns, 0 1 ns -repeat 2 ns
run 6200ns

force {Speed} 11
force {ClockIn} 1 0 ns, 0 1 ns -repeat 2 ns
run 6200ns

force {Reset} 1
run 1000ns



