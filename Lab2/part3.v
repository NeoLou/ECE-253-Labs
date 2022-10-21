`timescale 1ns / 1ns // `timescale time_unit/time_precision


module part3(HEX0, SW);
    input [3:0] SW;
    output [6:0] HEX0;

    hex_decoder u1(.c(SW), .display(HEX0));
	 
endmodule


module hex_decoder(c, display);
	input [3:0] c;
	output [6:0] display;
	
	assign display[0] = ~((c[3] | c[2] | c[1] | ~c[0])&(c[3] | ~c[2] | c[1] | c[0])&(~c[3] | c[2] | ~c[1] | ~c[0])&(~c[3] | ~c[2] | c[1] | ~c[0]));
	assign display[1] = ~((c[3] | ~c[2] | c[1] | ~c[0])&(c[3] | ~c[2] | ~c[1] | c[0])&(~c[3] | c[2] | ~c[1] | ~c[0])&(~c[3] | ~c[2] | c[1] | c[0])&(~c[3] | ~c[2] | ~c[1] | c[0])&(~c[3] | ~c[2] | ~c[1] | ~c[0]));
	assign display[2] = ~((c[3] | c[2] | ~c[1] | c[0])&(~c[3] | ~c[2] | c[1] | c[0])&(~c[3] | ~c[2] | ~c[1] | c[0])&(~c[3] | ~c[2] | ~c[1] | ~c[0]));
	assign display[3] = ~((c[3] | c[2] | c[1] | ~c[0])&(c[3] | ~c[2] | c[1] | c[0])&(c[3] | ~c[2] | ~c[1] | ~c[0])&(~c[3] | c[2] | ~c[1] | c[0])&(~c[3] | ~c[2] | ~c[1] | ~c[0]));
	assign display[4] = ~((c[3] | c[2] | c[1] | ~c[0])&(c[3] | c[2] | ~c[1] | ~c[0])&(c[3] | ~c[2] | c[1] | c[0])&(c[3] | ~c[2] | c[1] | ~c[0])&(c[3] | ~c[2] | ~c[1] | ~c[0])&(~c[3] | c[2] | c[1] | ~c[0]));
	assign display[5] = ~((c[3] | c[2] | c[1] | ~c[0])&(c[3] | c[2] | ~c[1] | c[0])&(c[3] | c[2] | ~c[1] | ~c[0])&(c[3] | ~c[2] | ~c[1] | ~c[0])&(~c[3] | ~c[2] | c[1] | ~c[0]));
	assign display[6] = ~((c[3] | c[2] | c[1] | c[0])&(c[3] | c[2] | c[1] | ~c[0])&(c[3] | ~c[2] | ~c[1] | ~c[0])&(~c[3] | ~c[2] | c[1] | c[0]));

endmodule