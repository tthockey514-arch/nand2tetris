// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed,
// the screen should be cleared.

// Pseudo-code algorithm
// (RESET_WHITE)
//      color = 0
//      goto SET_PIXELS
// (RESET_BLACK)
//      color = -1
// (SET_PIXELS)
//      pixels = 16384
// (LOOP)
//      if (KBD <> 0) goto BLACK
//      if (pixels > 24576) goto RESET_WHITE
//      if (color == -1) goto RESET_WHITE
//      goto PAINT
// (BLACK)
//      if (pixels > 24576) goto RESET_BLACK
//      if (color == 0) goto RESET_BLACK
// (PAINT)
//      RAM[pixels] = color
//      pixels = pixels + 1
//      goto LOOP

(RESET_WHITE)
// color = 0
    @color
    M=0
// goto SET_PIXELS
    @SET_PIXELS
    0;JMP
(RESET_BLACK)
// color = -1
    @color
    M=-1
(SET_PIXELS)
// pixels = 16384
    @SCREEN
    D=A
    @pixels
    M=D
(LOOP)
// if (KBD <> 0) goto BLACK
    @KBD
    D=M
    @BLACK
    D;JNE
// if (pixels > 24576) goto RESET_WHITE
    @pixels
    D=M
    @24576
    D=D-A
    @RESET_WHITE
    D;JGT
// if (color == -1) goto RESET_WHITE
    @color
    D=M
    D=D+1
    @RESET_WHITE
    D;JEQ
// goto PAINT
    @PAINT
    0;JMP
(BLACK)
// if (pixels > 24576) goto RESET_BLACK
    @pixels
    D=M
    @24576
    D=D-A
    @RESET_BLACK
    D;JGT
// if (color == 0) goto RESET_BLACK
    @color
    D=M
    @RESET_BLACK
    D;JEQ
(PAINT)
// RAM[pixels] = color
    @color
    D=M
    @pixels
    A=M
    M=D
// pixels = pixels + 1
    @pixels
    M=M+1
// goto LOOP
    @LOOP
    0;JMP
