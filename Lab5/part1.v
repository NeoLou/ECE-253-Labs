module part1(Clock, Enable, Clear_b, CounterValue);
    input Clock, Enable, Clear_b;
    output [7:0] CounterValue;

    wire Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8; //output values from the 8 T flip flops
    wire E1, E2, E3, E4, E5, E6, E7; // outputs from ANDing Q and Enable (becomes the new enable)
    assign E1 = Enable & Q1; // assigning the wires entering at T
    assign E2 = E1 & Q2;
    assign E3 = E2 & Q3;
    assign E4 = E3 & Q4;
    assign E5 = E4 & Q5;
    assign E6 = E5 & Q6;
    assign E7 = E6 & Q7;

    tFF u1(.enable(Enable), .clock(Clock), .Q(Q1), .clear_b(Clear_b));
    tFF u2(.enable(E1), .clock(Clock), .Q(Q2), .clear_b(Clear_b)); // the enable for the next = E of the previous
    tFF u3(.enable(E2), .clock(Clock), .Q(Q3), .clear_b(Clear_b));
    tFF u4(.enable(E3), .clock(Clock), .Q(Q4), .clear_b(Clear_b));
    tFF u5(.enable(E4), .clock(Clock), .Q(Q5), .clear_b(Clear_b));
    tFF u6(.enable(E5), .clock(Clock), .Q(Q6), .clear_b(Clear_b));
    tFF u7(.enable(E6), .clock(Clock), .Q(Q7), .clear_b(Clear_b));
    tFF u8(.enable(E7), .clock(Clock), .Q(Q8), .clear_b(Clear_b)); // last Q value = CounterValue

    assign CounterValue = {Q8, Q7, Q6, Q5, Q4, Q3, Q2, Q1};

endmodule

module tFF(enable, clock, Q, clear_b);
    input enable, clock, clear_b;
    output reg Q;
    always@(posedge clock, negedge clear_b)
    begin
        if(clear_b == 1'b0) //active-low
            Q <= 1'b0; // reset it back to 0
        else if (enable == 1'b1)
            Q <= ~Q; // value only changes when enable/T is at 1;
        else
            Q <= Q; // when clear = 1 and enable = 0 (all the T's = 0), nothing changes
    end
endmodule
