//Program that counts consecutive 1's
.global ONES
ONES:
	MOV r0, #0;
LOOP:
	CMP r1, #0; //loop until data contains no more 1's
	BEQ ENDSUB;
	LSR r2,r1,#1; //perform SHIFT, followed by AND
	AND r1,r1,r2;
	ADD r0,#1; //count the string lengths so far
	B LOOP;
ENDSUB:
	MOV PC, LR;
