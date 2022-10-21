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

#Test Case 1 (initialize)
force {clock} 0
force {reset} 1
force {ParallelLoadn} 0
force {RotateRight} 0
force {ASRight} 0
force {Data_IN} 00000000
run 50ns
force {clock} 1
force {reset} 1
force {ParallelLoadn} 0
force {RotateRight} 0
force {ASRight} 0
force {Data_IN} 00000000
run 50ns

#Test Case 2 (parallel load)
force {clock} 0
force {reset} 0
force {ParallelLoadn} 0
force {RotateRight} 0
force {ASRight} 0
force {Data_IN} 00000000
run 50ns
force {clock} 1
force {reset} 0
force {ParallelLoadn} 0
force {RotateRight} 0
force {ASRight} 0
force {Data_IN} 00000101
run 50ns

#Test Case 3 (parallel load2)
force {clock} 0
force {reset} 0
force {ParallelLoadn} 0
force {RotateRight} 0
force {ASRight} 0
force {Data_IN} 00000000
run 50ns
force {clock} 1
force {reset} 0
force {ParallelLoadn} 0
force {RotateRight} 0
force {ASRight} 0
force {Data_IN} 01100101
run 50ns

#Test Case 4 (right shift 1)
force {clock} 0
force {reset} 0
force {ParallelLoadn} 0
force {RotateRight} 0
force {ASRight} 0
force {Data_IN} 00000000
run 50ns
force {clock} 1
force {reset} 0
force {ParallelLoadn} 1
force {RotateRight} 1
force {ASRight} 0
force {Data_IN} 01100101
run 50ns

#Test Case 5 (right shift 2)
force {clock} 0
force {reset} 0
force {ParallelLoadn} 0
force {RotateRight} 0
force {ASRight} 0
force {Data_IN} 00000000
run 50ns
force {clock} 1
force {reset} 0
force {ParallelLoadn} 1
force {RotateRight} 1
force {ASRight} 0
force {Data_IN} 00000000
run 50ns

#Test Case 6 (arithmetic shift right 1)
force {clock} 0
force {reset} 0
force {ParallelLoadn} 0
force {RotateRight} 0
force {ASRight} 0
force {Data_IN} 00000000
run 50ns
force {clock} 1
force {reset} 0
force {ParallelLoadn} 1
force {RotateRight} 1
force {ASRight} 1
force {Data_IN} 00000000
run 50ns

#Test Case 7 (arithmetic shift right 2)
force {clock} 0
force {reset} 0
force {ParallelLoadn} 1
force {RotateRight} 1
force {ASRight} 1
force {Data_IN} 00000000
run 50ns
force {clock} 1
force {reset} 0
force {ParallelLoadn} 1
force {RotateRight} 1
force {ASRight} 1
force {Data_IN} 00000000
run 50ns

#Test Case 8 (rotate left 1)
force {clock} 0
force {reset} 0
force {ParallelLoadn} 1
force {RotateRight} 1
force {ASRight} 0
force {Data_IN} 00000000
run 50ns
force {clock} 1
force {reset} 0
force {ParallelLoadn} 1
force {RotateRight} 0
force {ASRight} 1
force {Data_IN} 00000000
run 50ns

#Test Case 9 (rotate left 2)
force {clock} 0
force {reset} 0
force {ParallelLoadn} 1
force {RotateRight} 1
force {ASRight} 0
force {Data_IN} 00000000
run 50ns
force {clock} 1
force {reset} 0
force {ParallelLoadn} 1
force {RotateRight} 0
force {ASRight} 0
force {Data_IN} 00000000
run 50ns

#Test Case 10 (reset)
force {clock} 0
force {reset} 1
force {ParallelLoadn} 1
force {RotateRight} 1
force {ASRight} 0
force {Data_IN} 00000000
run 50ns
force {clock} 1
force {reset} 1
force {ParallelLoadn} 1
force {RotateRight} 0
force {ASRight} 0
force {Data_IN} 00000000
run 50ns
