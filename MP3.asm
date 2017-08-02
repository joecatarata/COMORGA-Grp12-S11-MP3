%include "io.inc"
extern _system, _printf, _scanf, _getchar, _puts

section .data
clrscr db "cls",0


formatFloat db "%lg", 0
formatOut db "Input is %lg  ",0
term db "Term #%d: ", 13,10,0
expCounter db 0
termNum db 0
eulerMessage db "e^x = ", 0
approx db "Approximations: ", 0
inputMsg db "Input a number: ", 0
testCtr db "Ctr is %d", 0
temp dd 0
orig dd 0
number dq 0.0
factorialDivisor dd 0.0
; try manipulation equation: x^n
; solved new expression: x^n = 2^(n*log2(x))
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
    mov dword[expCounter], 0x0 ;Initialize Counter
    mov dword[termNum], 0x1 ;Initialize Term Number
    
Taylor:
    mov dword[orig], ecx
    mov ecx, dword[expCounter]
    ;x^n
    Exponent:
      cmp ecx, 0x0
      jz reset
      
      fld qword[number]
      fld qword[number]
      fmul st0, st1
      fst qword[number]
      emms
      
      jmp Exponent


    reset: 
        mov ecx, dword[expCounter]
        
    ;n!
    Factorial:
        
    Divide:
    ;div
    
    
    
    
    
    
    
    mov dword[temp], ecx
    
    push dword[termNum]
    push term
    call _printf
    add esp, 8
    
    mov ecx, dword[temp]
    inc dword[termNum]
    
    loop Taylor
    
    xor eax, eax
    ret
