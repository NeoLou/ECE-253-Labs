module part3(ClockIn, Resetn, Start, Letter, DotDashOut);
	input ClockIn, Resetn, Start;
	input [2:0] Letter; // we need 3 bits to represent A-H 
	output reg DotDashOut;
	reg [11:0] shift_register; 
	reg [7:0] Counter; // 8 bits needed to count up to 250 (2^8 = 256)
	// setting the inputs that will be used to select the different letters
	parameter A = 3'b000, B = 3'b001, C = 3'b010, D = 3'b011,
		E = 3'b100, F = 3'b101, G = 3'b110, H = 3'b111;
	
	initial begin
		shift_register <= 0;
		Counter <= 0;
	end
	
	always @(posedge ClockIn, negedge Resetn) begin
		if (Resetn == 1'b0) begin
			shift_register <= 0;
			DotDashOut <= 0;
			Counter <= 250-1; // 250Hz for 0.5s delays (for a 500Hz clock)
		end

		else if (Start == 1'b1) begin	// fill the shift register with the codes for each letter
			case (Letter)
				A: shift_register <= 12'b101110000000;
				B: shift_register <= 12'b111010101000;
				C: shift_register <= 12'b111010111010;
				D: shift_register <= 12'b111010100000;
				E: shift_register <= 12'b100000000000;
				F: shift_register <= 12'b101011101000;
				G: shift_register <= 12'b111011101000;
				H: shift_register <= 12'b101010100000;
			endcase
			
			if (Counter == 0) begin		// below are non-blocking assignments, which means they all happen simultaneously, without order
				shift_register <= shift_register << 1; 		// left shift by 1
				shift_register[0] <= shift_register[11]; 	// last digit becomes first digit (loop around)
				DotDashOut <= shift_register[11];			// morse code is output
				Counter <= 250-1;	// Counter is reset
			end
			
			else
				Counter <= Counter - 1;	// Counter keeps counting
		end

		else if (Counter == 0) begin			// Counter reached 0 but Start is 0
			shift_register <= shift_register << 1; 		// left shift by 1
			shift_register[0] <= shift_register[11];
			DotDashOut <= shift_register[11]; 	// morse code is output
			Counter <= 250-1;					// reset counter
		end
		
		else
			Counter <= Counter - 1;		// Counter keeps counting 
	end
endmodule