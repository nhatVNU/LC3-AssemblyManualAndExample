.ORIG x3000
LD R4, ADDRESS
LDR R1, R4, #0
LDR R2, R4, x1
NOT R3, R2
ADD R3, R3, #1
ADD R5, R1, R3	;R5=R1-R2
STR R5, R4, x2

ADD R1, R1, #0
BRzp	POSITIVE1
NOT R1, R1
ADD R1, R1, #1
POSITIVE1 ADD R1, R1, #0
STR R1, R4, x3

ADD R2, R2, #0
BRzp	POSITIVE2
NOT R2, R2
ADD R2, R2, #1
POSITIVE2 ADD R2, R2, #0
STR R2, R4, x4


NOT R5, R2
ADD R5, R5, #1
ADD R6, R1, R5	;R6=ABS(R1)-ABS(R2)
BRp	R1_LARGER
BRz	EQUAL
AND R3, R3, #0
ADD R3, R3, #2
STR R3, R4, x5
BR NEXT
R1_LARGER
AND R3, R3, #0
ADD R3, R3, #1
STR R3, R4, x5
BR NEXT
EQUAL	
AND R3, R3, #0
STR R3, R4, x5
NEXT	HALT

ADDRESS .FILL x3120
.END