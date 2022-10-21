`timescale 1ns / 1ns // `timescale time_unit/time_precision

module part3(A, B, Function, ALUout);
	input [3:0] A;
	input [3:0] B;
	input [2:0] Function;
	output reg [7:0] ALUout;
	wire [4:0] sum;
	part2 u0 (.a(A), .b(B), .c_in(1'b0), .c_out(sum[4]), .s(sum[3:0]));
		always @(*)
			begin
				case (Function[2:0]) // start case statement
					3'b000: ALUout = {3'b000, sum};
							//A + B using the adder from Part II of this Lab
					3'b001: ALUout = A + B;//A + B using the Verilog ‘+’ operator
					3'b010: if (B[3] == 1'b0)
								ALUout = {4'b0000, B};
							else
								ALUout = {4'b1111, B};
							//Sign extension of B to 8 bits // textbook page 167
					3'b011: if (|{A,B} == 1)
								ALUout = 8'b00000001;
							else
								ALUout = 8'b00000000;
								//Output 8’b00000001 if at least 1 of the 8 bits in the two inputs is 1 using a single OR operation
					3'b100: if (&{A, B} == 1)
								ALUout = 8'b00000001;
							else
								ALUout = 8'b00000000;
								//Output 8’b00000001 if all of the 8 bits in the two inputs are 1 using a single AND operation
					3'b101: ALUout = {A, B};//Display A in the most significant four bits and B in the lower four bits
					default: ALUout = 8'b00000000;// default case
				endcase
			end
endmodule

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

	assign c_out = a * b + c_in * a + c_in * b;
	assign sum = c_in ^ a ^ b;
endmodule
