module part3(clock, reset, ParallelLoadn, RotateRight, ASRight, Data_IN, Q);
	input clock, reset, ParallelLoadn, RotateRight, ASRight;
	input [7:0] Data_IN;
	output [7:0] Q;
	wire left_end = ((RotateRight & ASRight) ? Q[7] : Q[0]);
	
	subcct M7(
		.left(left_end),
		.right(Q[6]),
		.LoadLeft(RotateRight),
		.data_D(Data_IN[7]),
		.parallel_loadn(ParallelLoadn),
		.clock(clock),
		.reset(reset),
		.out_Q(Q[7])
		);
	subcct M6(
		.left(Q[7]),
		.right(Q[5]),
		.LoadLeft(RotateRight),
		.data_D(Data_IN[6]),
		.parallel_loadn(ParallelLoadn),
		.clock(clock),
		.reset(reset),
		.out_Q(Q[6])
		);
	subcct M5(
		.left(Q[6]),
		.right(Q[4]),
		.LoadLeft(RotateRight),
		.data_D(Data_IN[5]),
		.parallel_loadn(ParallelLoadn),
		.clock(clock),
		.reset(reset),
		.out_Q(Q[5])
		);
	subcct M4(
		.left(Q[5]),
		.right(Q[3]),
		.LoadLeft(RotateRight),
		.data_D(Data_IN[4]),
		.parallel_loadn(ParallelLoadn),
		.clock(clock),
		.reset(reset),
		.out_Q(Q[4])
		);
	subcct M3(
		.left(Q[4]),
		.right(Q[2]),
		.LoadLeft(RotateRight),
		.data_D(Data_IN[3]),
		.parallel_loadn(ParallelLoadn),
		.clock(clock),
		.reset(reset),
		.out_Q(Q[3])
		);
	subcct M2(
		.left(Q[3]),
		.right(Q[1]),
		.LoadLeft(RotateRight),
		.data_D(Data_IN[2]),
		.parallel_loadn(ParallelLoadn),
		.clock(clock),
		.reset(reset),
		.out_Q(Q[2])
		);
	subcct M1(
		.left(Q[2]),
		.right(Q[0]),
		.LoadLeft(RotateRight),
		.data_D(Data_IN[1]),
		.parallel_loadn(ParallelLoadn),
		.clock(clock),
		.reset(reset),
		.out_Q(Q[1])
		);
	subcct M0(
		.left(Q[1]),
		.right(Q[7]),
		.LoadLeft(RotateRight),
		.data_D(Data_IN[0]),
		.parallel_loadn(ParallelLoadn),
		.clock(clock),
		.reset(reset),
		.out_Q(Q[0])
		);
endmodule

module subcct(left, right, LoadLeft, data_D, parallel_loadn, out_Q, clock, reset);
	input left, right, LoadLeft, data_D, parallel_loadn, clock, reset;
	output out_Q;
	wire datato_dff, rotatedata;
	
	mux2to1 M0( //instantiates first multiplexer
		.y(left), //left bit
		.x(right), //right bit
		.s(LoadLeft), //if 1, rotates right; if 0, rotates left
		.m(rotatedata) //outputs to 2nd mux
		);
	mux2to1 M1( //instantiates 2nd multiplexer
		.y(rotatedata), //output from left most multiplexer
		.x(data_D), //data D coming in
		.s(parallel_loadn), //selects input D or rotate
		.m(datato_dff) //outputs to flip flop
		);
	flipflop F0( //instantiates flip flop
		.d(datato_dff), //input to flip flop
		.q(out_Q), //output from flip flop
		.clock(clock), //clock signal
		.reset(reset) //synchronous active high reset
		);
endmodule

module flipflop(d, q, clock, reset);
	input d, clock, reset;
	output reg q;
	always @(posedge clock) // triggered every time clock rises
		begin
			if (reset == 1'b1) // when reset is 1 (note this is tested on every rising clock edge)
				q <= 1'b0; // q is set to 0. Note that the assignment uses <=
			else // when reset is 0
				q <= d; // value of d passes through to output q
		end
endmodule

module mux2to1(x, y, s, m);
    input x; //select 0
    input y; //select 1
    input s; //select signal
    output m; //output

    assign m = s ? y : x;
endmodule

