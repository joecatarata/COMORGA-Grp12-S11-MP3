%include "io.inc"
extern _system, _printf, _scanf, _getchar, _puts

section .data
clrscr db "cls",0


formatFloat db "%lg", 0
formatOut db "Input is %lg  ",0
term db "Term #%d", 13,10,0
counter db 0
termNum db 0
eulerMessage db "e^x = ", 0
approx db "Approximations: ", 0
inputMsg db "Input a number: ", 0
testCtr db "Ctr is %d", 0
number dq 0.0

section .text
global _main
_main:
    mov ebp, esp
    emms
    

    push inputMsg
    call _printf
    add esp , 0x4
    
    
    push number
    push formatFloat 
    call _scanf
    add esp, 0x8
    
    push dword[number+4]
    push dword[number]
    push formatOut 
    call _printf 
    add esp, 0xC
    
    ;make loop for Taylor Series    
    mov ecx, 0x14   
    mov dword[counter], 0x0 ;Initialize Counter   
    mov dword[termNum], 0x1 ;Initialize Term Number
    
    ret
