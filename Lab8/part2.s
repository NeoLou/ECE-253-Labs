.text
.global _start
.global SWAP
_start:
	LDR R4,= LIST // p
	LDR R5, [R4] // N numbers
	SUB R5, #1 // N-1
	MOV R6, #0 //counter loop 1
	MOV R7, #0 // counter loop2
	ADD R4, #4
	MOV R8, R4 //modifiable address of list
	B LOOP1
INIT:
	ADD R6, #1 //counter1 +1
	MOV R7, R6 //reset counter2 but +1 so it runs one less time
	MOV R8, R4 //reset address
LOOP1: // go through the entire sequence of words, decreasing the number of iterations each time
	CMP R6, R5 // i = N-1
	BEQ END
LOOP2: // go through the each pair and swap when needed
	CMP R7, R5
	BEQ INIT // j = N-1-k
	MOV R0, R8
	BL SWAP
	ADD R8, #4 //iterate through list
	ADD R7, #1 //increment counter
	B LOOP2
END: 
    B END
SWAP:
	LDR R1, [R0] //*x
	LDR R2, [R0, #4] //*y
	CMP R1, R2 //if *y >= *x, subend; else swap
	BLE NOSWAP //no swap
	MOV R3, R1 //int temp = *x
	STR R2, [R0] //*x = *y;
	STR R3, [R0, #4] //*y = temp;
	MOV R0, #1 // return 1 if swapped
	MOV PC, LR
NOSWAP:
	MOV R0, #0
	MOV PC, LR
/*LIST:
	.word 10, 1400, 45, 23, 5, 3, 8, 17, 4, 20, 33
*/

/* C code
int list[11] = 10, 1400, 45, 23, 5, 3, 8, 17, 4, 20, 33;
int *p = list; // p = R1
int N_numbers = *p; // R2
p += 1;
for (int i = 0, i < N_numbers - 1, i++){ // i = R3
	for (int j = 0, j < N_numbers - 1 - i, j++) { // j = R4
		int x = p+j; // x = R5
		int y = p+j+1; // y = R6
		if *y < *x: //*x = R7; *y = R8
			int temp = *x; // temp = R9
			*x = *y;
			*y = temp;
	}
}
return list;
*/
	
