%include "io.inc"
extern _system, _printf, _scanf, _getchar, _puts

section .data
clrscr db "cls",0


formatFloat db "%g", 0
eulerMessage db "e^x = ", 0
approx db "Approximations: ", 0
inputMsg db "Input a number: ", 0
number dd 0.0

section .text
global _main
_main:
    mov ebp, esp
    
    push inputMsg
    call _printf
    add esp , 4
    
    
    push number
    push formatFloat 
    call _scanf
    add esp, 8
    
    push formatFloat 
    call _printf 
    add esp, 4
    
    xor eax, eax
    ret
