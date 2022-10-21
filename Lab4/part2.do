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

#Test Case 1 (FIRST CASE, RESET = 0, CLOCK = 0 -> ALUOUT = 0)
force {Function} 000
force {Data} 1111
force {Reset_b} 0
force {Clock} 1
run 200ns 

#Test Case 2 (FIRST CASE, RESET = 1, CLOCK = 0 -> ALUOUT = 0)
# CLOCK NOT RISING EDGE...NOTHING SHOULD HAPPEN
force {Function} 000
force {Data} 1111
force {Reset_b} 1
force {Clock} 0
run 200ns 

#Test Case 3 (FIRST CASE, RESET = 1, CLOCK = 1 -> ALUOUT = 0000 1111, B = 1111)
force {Function} 000
force {Data} 1111
force {Reset_b} 1
force {Clock} 1
run 200ns 

#Test Case 4 (FIRST CASE, RESET = 0, CLOCK = 0 -> ALUOUT = 0000 1111)
force {Function} 000
force {Data} 1111
force {Reset_b} 1
force {Clock} 0
run 200ns 

#Test Case 5 (FIRST CASE, RESET = 0, CLOCK = 1 -> ALUOUT = 0, B = 0000)
force {Function} 000
force {Data} 1111
force {Reset_b} 1
force {Clock} 1
run 200ns

#Test Case 6 (FIRST CASE, RESET = 0, CLOCK = 1 -> ALUOUT = 0, B = 0000)
force {Function} 001
force {Data} 1111
force {Reset_b} 1
force {Clock} 0
run 200ns

force {Function} 001
force {Data} 1101
force {Reset_b} 1
force {Clock} 1
run 200ns

#Test Case 7 (FIRST CASE, RESET = 0, CLOCK = 1 -> ALUOUT = 0, B = 0000)
force {Function} 010
force {Data} 1111
force {Reset_b} 1
force {Clock} 0
run 200ns

force {Function} 010
force {Data} 1101
force {Reset_b} 1
force {Clock} 1
run 200ns

#Test Case 8 (FIRST CASE, RESET = 0, CLOCK = 1 -> ALUOUT = 0, B = 0000)
force {Function} 011
force {Data} 1111
force {Reset_b} 1
force {Clock} 0
run 200ns

force {Function} 011
force {Data} 1101
force {Reset_b} 1
force {Clock} 1
run 200ns

#Test Case 7 (FIRST CASE, RESET = 0, CLOCK = 1 -> ALUOUT = 0, B = 0000)
force {Function} 100
force {Data} 1111
force {Reset_b} 1
force {Clock} 0
run 200ns

force {Function} 100
force {Data} 1101
force {Reset_b} 1
force {Clock} 1
run 200ns

#Test Case 7 (FIRST CASE, RESET = 0, CLOCK = 1 -> ALUOUT = 0, B = 0000)
force {Function} 001
force {Data} 1111
force {Reset_b} 1
force {Clock} 0
run 200ns

force {Function} 001
force {Data} 0101
force {Reset_b} 1
force {Clock} 1
run 200ns

#Test Case 7 (FIRST CASE, RESET = 0, CLOCK = 1 -> ALUOUT = 0, B = 0000)
force {Function} 101
force {Data} 1111
force {Reset_b} 1
force {Clock} 0
run 200ns

force {Function} 101
force {Data} 0011
force {Reset_b} 1
force {Clock} 1
run 200ns


#Test Case 7 (FIRST CASE, RESET = 0, CLOCK = 1 -> ALUOUT = 0, B = 0000)
force {Function} 110
force {Data} 1111
force {Reset_b} 1
force {Clock} 0
run 200ns

force {Function} 110
force {Data} 1101
force {Reset_b} 1
force {Clock} 1
run 200ns

#Test Case 7 (FIRST CASE, RESET = 0, CLOCK = 1 -> ALUOUT = 0, B = 0000)
force {Function} 111
force {Data} 1111
force {Reset_b} 1
force {Clock} 0
run 200ns

force {Function} 111
force {Data} 1101
force {Reset_b} 1
force {Clock} 1
run 200ns

#Test Case 7 (FIRST CASE, RESET = 0, CLOCK = 1 -> ALUOUT = 0, B = 0000)
force {Function} 111
force {Data} 1111
force {Reset_b} 0
force {Clock} 0
run 200ns

force {Function} 111
force {Data} 1101
force {Reset_b} 0
force {Clock} 1
run 200ns


