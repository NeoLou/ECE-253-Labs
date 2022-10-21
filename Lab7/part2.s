//Program that counts consecutive 1's
.text
.global _start
_start:
	LDR r2,=TEST_NUM; //load data word into r2
	LDR r1, [r2];
	MOV r0,#0; //r0 will hold the result
LOOP:
	CMP r1, #0; //loop until data contains no more 1's
	BEQ END;
	LSR r2,r1,#1; //perform SHIFT, followed by AND
	AND r1,r1,r2;
	ADD r0,#1; //count the string lengths so far
	B LOOP;
END:
	B END;
TEST_NUM:
	.word 0x103fe00f;
.end
	