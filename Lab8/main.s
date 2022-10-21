.text
.global _start;
_start:
	LDR r2,=TEST_NUM; //load data word into r2
	MOV r0,#0; //r0 holds counts of 1's in current word
	MOV r5,#0; //r5 will hold the longuest string of 1's
LOOP_LONG:
	LDR r1, [r2];
	ADD r2, #4;
	PUSH {r1, r2};
	CMP r1, #-1; //loop until data contains no more 1's
	BEQ END;
	BL ONES; //r0 holds number of 1's
	POP {r1, r2};
	CMP r5, r0;
	BLT UPDATE;
	B LOOP_LONG;
UPDATE:
	MOV r5, r0;
	B LOOP_LONG;
END:
	B END;
TEST_NUM:
	.word 10, 1, 3, 2, 4, 7, 5, 6, 9 ,8 ,-1;

/*Program that counts consecutive 1's
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
.end
*/