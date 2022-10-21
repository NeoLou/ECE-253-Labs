`timescale 1ns / 1ns // `timescale time_unit/time_precision

//SW[2:0] data inputs
//SW[9] select signals

//LEDR[0] output display

/*
module mux(LEDR, SW);
    input [9:0] SW;
    output [9:0] LEDR;

    part1 u0(
      .Input[0](SW[0]),
      .Input[1](SW[1]),
		.Input[2](SW[2]),
		.Input[3](SW[3]),
		.Input[4](SW[4]),
		.Input[5](SW[5]),
		.Input[6](SW[6]),
      .MuxSelect[0](SW[7]),
		.MuxSelect[1](SW[8]),
		.MuxSelect[2](SW[9]),
      .Out(LEDR[0])
        );
endmodule
*/

module part2(a, b, c_in, s, c_out);
    input [3:0] a;
	input [3:0] b;
    input c_in;
    output c_out;
	output [3:0] s;
    wire c1, c2, c3;

    fulladder u0(a[0], b[0], c_in, s[0], c1);
	fulladder u1(a[1], b[1], c1, s[1], c2);
	fulladder u2(a[2], b[2], c2, s[2], c3);
	fulladder u3(a[3], b[3], c3, s[3], c_out);

endmodule

module fulladder(a,b,c_in,sum,c_out);
	input a,b,c_in;
    output c_out, sum;
	//output reg c_out,sum;
	
	assign c_out = a * b + c_in * a + c_in * b;
	assign sum = c_in ^ a ^ b;
    /*
	always @(*)
	begin
		case (a+b+c_in) // start case statement
			2'b00: c_out = 0, sum = 0; // case 0
			2'b01: c_out = 0, sum = 1; // case 1
			2'b10: c_out = 1, sum = 0; // case 2
			2'b11: c_out = 1, sum = 1; // case 3
			default: Out = 2'b00;
		endcase
	end
	*/
endmodule