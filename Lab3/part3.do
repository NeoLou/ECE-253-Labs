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

# test case 0
force {A} 1110
force {B} 1101
force {Function} 000
run 200ns

# test case 1
force {A} 1011
force {B} 1001
force {Function} 001
run 200ns

# test case 2
force {A} 0010
force {B} 1001
force {Function} 010
run 200ns

# test case 2 B
force {A} 0010
force {B} 0001
force {Function} 010
run 200ns

# test case 3
force {A} 0100
force {B} 0001
force {Function} 011
run 200ns

# test case 3 B
force {A} 0000
force {B} 0000
force {Function} 011
run 200ns

# test case 4
force {A} 1010
force {B} 0101
force {Function} 100
run 200ns

# test case 4 B
force {A} 1111
force {B} 1111
force {Function} 100
run 200ns

# test case 5
force {A} 0010
force {B} 0001
force {Function} 101
run 200ns

# test case 5 B
force {A} 0110
force {B} 1101
force {Function} 101
run 200ns

# test case default
force {A} 0010
force {B} 0001
force {Function} 111
run 200ns