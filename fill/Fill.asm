@24576
D=A
@MXSCREEN
M=D


// This defines the screen pointer
@SCREEN
D=A
@POINTER
M=D


(LOOP)     //Making it an infinite loop
  //If there is a keyboard input, jump to FILL
  @KBD
  D=M
  @FILL
  D; JGT

  //Else, jump to UNFILL
  @UNFILL
  0; JMP


(UNFILL)
  //This makes it so that if POINTER = SCREEN, do nothing
  @SCREEN
  D=A
  @POINTER
  D=D-M
  @LOOP
  D; JEQ

  //This unfills the screen
  D=0
  @POINTER
  A=M
  M=D

  //Dimunition of the POINTER
  D=1
  @POINTER
  D=M-D
  @POINTER
  M=D

  //Revert back to main loop
  @LOOP
  0; JMP


(FILL)
  //This makes it so that it'll do nothing if the screen is full
  @MXSCREEN
  D=M
  @POINTER
  D=D-M
  @LOOP
  D; JEQ


  //This is probably the most relevant part,
  //it fills in the pixel that POINTER points to.
  //@-1
  D=-1
  @POINTER
  A=M
  M=D

  //This iterates the pointer by 1
  D=1
  @POINTER
  D=D+M
  @POINTER
  M=D

  //Makes it jump back to main loop
  @LOOP
  0; JMP

//This new iteration of my fill.asm was taken in part from Duke
//University version.