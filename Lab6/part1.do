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

#Output: z=1 when w=1111 or w=1101

#Initialize inputs
force {Clock} 0 0 ns, 1 1 ns -repeat 2 ns
force {Resetn} 0
force {w} 0
run 5ns

#Test 1: z=0, CurState=A(0000), since reset=0
force {w} 1
run 3ns

#Test 2: z=1, CurState=F(0101) at the end of 4 clock cycles cuz w=1111 and reset=1
# (for first 3 cycles: z=0, CurState=A(0000),B(0001),C(0010),D(0011))
force {Resetn} 1
run 8ns

#Test 3: z=1, CurState=G(0110) at end of 2 more clock cycles (w=11 previously and now w=01 so w=1101)
# (for first cycle: z=0, CurState=E(0100))
force {w} 0
run 2ns
force {w} 1
run 2ns

#Test 4: z=1, CurState=F(0101) at end of 3 more cycles (w=1 previously and now w=111 so w=1111)
# (for first 2 cycles: z=0, CurState=C(0010),D(0011))
force {w} 1
run 6ns

#Test5: z=0, CurState=A(0000) after 3 cycles (w=1 prev, w=010 so w=1010)
# (for first 2 cycles: z=0,1; CurState=E(0100),G(0110))
force {w} 0 
run 2ns
force {w} 1
run 2ns
force {w} 0
run 2ns

#Test 6: z=0, CurState=A(0000); w=0000
force {w} 0
run 10ns

#Test 7: z=1, CurState=F(0101); w=1111 (to test for reset)
force {w} 1
run 10ns

#Test n: z = 0, CurState = 0000, since reset is 0
force {Resetn} 0
run 10ns