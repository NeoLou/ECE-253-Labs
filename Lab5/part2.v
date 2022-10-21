module part2(ClockIn, Reset, Speed, CounterValue);
    input ClockIn, Reset;
	input [1:0] Speed;
    output [3:0] CounterValue;
	wire Enable;
	//wire [10:0] test;
	
	RateDivider u0(ClockIn, Speed, Reset, Enable);
	DisplayCounter u1(ClockIn, Enable, Reset, CounterValue);
endmodule

module RateDivider(clock, speed, reset, enable); // need 11 T flip flops to rep up to 2000 for 0.25Hz
    input clock, reset;
    input [1:0] speed;
    output enable;
	//output [10:0] test;
	reg [10:0] q;
	reg [10:0] d;
    //wire parallel_load = 1'b1;

    always@(posedge clock)
    begin
        case(speed[1:0])
			2'b00: begin d = 11'b00000000001; end // d = 1; 500Hz
			2'b01: begin d = 11'b00111110100; end // d = 500; 1Hz
			2'b10: begin d = 11'b01111101000; end // d = 1000; 0.5 Hz
			2'b11: begin d = 11'b11111010000; end // d = 2000; 0.25 Hz
			default: begin d = 11'b00000000001; end// d = 1; 500Hz
        endcase
		if (reset == 1'b1) //active-high reset
            begin
			q <= (d - 1);
			end
			//parallel_load = 1'0;
        /*else if (parallel_load == 1'b1)
            q <= d - 1;
			parallel_load = 1'b0;
		*/
        else if (q == 11'b00000000000)
			begin
			q <= (d - 1);
			end
			//parallel_load = 1'b0;
		else
            begin
			q <= (q - 1); // counting down
			end
    end
	//assign test = q;
    assign enable = ~(|q); // if q is 0, then enable is 1, otherwise enable is 0
endmodule

module DisplayCounter(clock, EnableDC, reset, q);
    input clock, EnableDC, reset;
    output reg [3:0] q;

    always@(posedge clock)
    begin
        if (reset == 1'b1) begin
			q <= 0;
			end
		else if (EnableDC == 1'b1) begin
			q <= q + 1; // counting up
			end
		else
			begin
			q <= q;
			end
    end
endmodule
