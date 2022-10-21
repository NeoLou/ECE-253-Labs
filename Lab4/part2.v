module part2(Clock, Reset_b, Data, Function, ALUout);
	input Clock, Reset_b;
	input [3:0] Data;
	input [2:0] Function;
	output reg [7:0] ALUout;
	wire [4:0] sum;
	adder u0( .a(Data),  .b(ALUout[3:0]), .c_in(1'b0), .c_out(sum[4]), .s(sum[3:0]));
	always@(posedge Clock)
	begin
		if (Reset_b == 1'b0)
			ALUout <= 8'b00000000;
		else
			case(Function[2:0])
			3'b000: ALUout <= {3'b000, sum}; 	// A + B using the adder from Part II of Lab 3
			3'b001: ALUout <= Data+ALUout[3:0];  // A + B using the Verilog `+' operator
			3'b010: if (ALUout[3] == 1'b0) 		// Sign extension of B to 8 bits
						ALUout <= {4'b0000, ALUout[3:0]};
					else
						ALUout <= {4'b1111, ALUout[3:0]}; 
			3'b011: if (|{Data,ALUout[3:0]} == 1)	// Output 8'b00000001 if at least 1 of the 8 bits in
													// the two inputs is 1 using a single OR operation
						ALUout <= 8'b00000001;
					else
						ALUout <= 8'b00000000;
			3'b100: if(&{Data,ALUout[3:0]} == 1)	//Output 8'b00000001 if all of the 8 bits in the
													//two inputs are 1 using a single AND operation
						ALUout <= 8'b00000001;
					else
						ALUout <= 8'b00000000;
						
			3'b101: ALUout <= ALUout[3:0] << Data;	// Left shift B by A bits using the Verilog shift operator
			3'b110: ALUout <= Data*ALUout[3:0]; 		// A X B using the Verilog `*' operator
			3'b111: ALUout <= ALUout; 				// register value does not change
			default: ALUout <= 8'b00000000;
			endcase
	end	
endmodule
	
module adder(a, b, c_in, s, c_out);
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


