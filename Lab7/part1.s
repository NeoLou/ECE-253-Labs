.text
.global _start
_start:
	LDR r0,=TEST_NUM;
LOOP:
	LDR r1, [r0];
	CMP r1, #-1;
	BEQ END;
	ADD r7,r7,r1;
	ADD r8,r8,#1;
	ADD r0,r0,#4;
	B LOOP;
END:
	B END;
.end
	