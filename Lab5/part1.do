# set the working dir, where all compiled verilog goes
vlib work

# compile all verilog modules in mux.v to working dir
# could also have multiple verilog files
vlog part1.v

#load simulation using mux as the top level simulation module
vsim part1

#log all signals and add some signals to waveform window
log {/*}
# add wave {/*} would add all items in top level simulation module
add wave {/*}

#Test Case 1 (0)
force {Clock} 0
force {Enable} 0
force {Clear_b} 0
run 20ns
force {Clock} 1
force {Enable} 0
force {Clear_b} 0
run 20ns
force {Clock} 0
force {Enable} 0
force {Clear_b} 0
run 20ns

#Test Case 2 (0)
force {Clock} 1
force {Enable} 0
force {Clear_b} 1
run 20ns
force {Clock} 0
force {Enable} 0
force {Clear_b} 1
run 20ns

#Test Case 3 (1)
force {Clock} 1
force {Enable} 1
force {Clear_b} 1
run 20ns
force {Clock} 0
force {Enable} 1
force {Clear_b} 1
run 20ns

#Test Case 4 (2)
force {Clock} 1
force {Enable} 1
force {Clear_b} 1
run 20ns
force {Clock} 0
force {Enable} 1
force {Clear_b} 1
run 20ns

#Test Case 5 (2)
force {Clock} 1
force {Enable} 0
force {Clear_b} 1
run 20ns
force {Clock} 0
force {Enable} 1
force {Clear_b} 1
run 20ns

#Test Case 6 (3 - 0)
force {Clock} 1
force {Enable} 1
force {Clear_b} 1
run 20ns
force {Clock} 0
force {Enable} 1
force {Clear_b} 0
run 20ns



