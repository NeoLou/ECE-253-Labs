# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog part3.v

#load simulation using mux as the top level simulation module
vsim part3

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}

#Test Case 1
force {ClockIn} 0 0 ns, 1 1 ns -repeat 2 ns
force {Resetn} 0
force {Start} 0
force {Letter} 000
run 6ns

force {Resetn} 1
force {Start} 1
run 10ns

force {Start} 0
run 4000ns

force {Letter} 001
force {Start} 1
run 10ns

force {Start} 0
run 6000ns

