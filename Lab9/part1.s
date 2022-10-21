.global _start
_start:

LDR R0, = 0xFF200000 //RED LEDS
LDR R1, = 0xFFFEC600 // TIMER BASED ADDRESS
LDR R2, = 50000000 // LOAD VALUE -> 50M FOR 0.25 SEC
STR R2, [R1]
LDR R2, = 0b011
STR R2, [R1, #8] // SET A = 1, E = 1
MOV R3, #0b1 // INITIALIZE PATTERN 1... starting from right
MOV R4, #0b1000000000 // initialize pattern 2 ...starting from left
MOV R9, #0b0 // check 1 .... start or stop?
MOV R10, #0b0 // check 2 ... have we seen 10 pattern
MOV R11, #0b0 // check 3 .. previous


LOOP:
        ORR R5, R3, R4 // R5 IS THE ACTUAL PATTERN
        STR R5, [R0] // PATTERN -> LEDRS
TIMER: 
        LDR R6, [R1, #12] // LOAD F BIT
        CMP R6, #0 // CHECK IF 0
        BEQ TIMER //BRANCH IF 0
        STR R6, [R1, #12] // RESTART THE TIMER

        BL KEY_CHECK
        CMP R10, #0b10 // is Check2 = 2
        BEQ SWITCH_STATE

INNER:
        CMP R9, #0b0
        BEQ TIMER
        LSL R3, R3, #1 // SHIFT PATTERN LEFT
        LSR R4, R4, #1
        CMP R3, #0b10000000000 // CHECK FOR SPILL OVER
        BNE LOOP // NO SPILL OVER
        MOV R3, #0b0000000001 // IF SPILLED OVER
        MOV R4, #0b1000000000 

KEY_CHECK:
        LDR R7, = 0xFF200050 // LINKING TO SWITCHES
        LDR R8, [R7]
        AND R8, R8, #0b1000 // dont care about the other switches
        CMP R8, #0b1000
        BEQ CHANGED_1
        B CHANGED_0

CHANGED_1:
        CMP R11, #0b0
        BNE SUBEND
        ADD R10, #1 // check 2++
        MOV PC, LR

CHANGED_0:
        CMP R11, #0b1
        BNE SUBEND
        ADD R10, #1 // check 2++
        MOV PC, LR

SWITCH_STATE:
        EOR R9, R9, #0b1
        MOV R10, #0b0
        B INNER

SUBEND:
    MOV PC, LR