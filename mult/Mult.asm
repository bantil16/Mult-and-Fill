// Mult.asm by Luke Bantis

@2	//Call on R2
M=0	//M means most recent ram called. Set equal to 0

@0
D=M
@END
D;JEQ	//This is if D=0

@1
D=M
@END	//Go to end
D;JEQ	//If D=0

@0	//Go to R0
D=M	//Makes D=R0
@3	//Go to R3
M=D	//Set R3 to D


(LOOP)
@1	//Go to R1
D=M	//Set D equal to R1

@2	//Go to R2
M=D+M	//Add D, which is equal to R1, to the present value

@3	//Go to R3
M=M-1	//Subtract 1 from the current value

D=M	//Set D to M so that JGT can be performed
@LOOP	//Proceed with loop
D;JGT	//If R3 > 0, jump to loop. But, if R3 is 0, go to end


(END)
@END
0;JMP	//This makes it a forever loop