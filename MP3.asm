
extern _system, _printf, _scanf, _getchar, _puts

Zero:

    
    jmp reset

ZeroFactorial:



section .data
clrscr db "cls",0


formatFloat db "%lf", 0
formatOut db "Input is %lf  ",0
term db "Term #%d: ", 13,10,0
expCounter dd 0
termNum dd 0
eulerMessage db "e^x = ", 0
approx db "Approximations: ", 0
inputMsg db "Input a number: ", 0
testCtr db "Ctr is %d", 0
testString db "%lg",13,10, 0
temp dd 0
tempEx dd 0
orig dd 0
total dq 0.0
inputFloat dq 0.0
factorialDivisor dd 0.0
originalInput dq 0.0
exponentAnswer dq 0.0
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


    push inputFloat
    push formatFloat
    call _scanf
    add esp, 0x8

    push dword[inputFloat+4]
    push dword[inputFloat]
    push formatOut
    call _printf
    add esp, 0xC

    ;make loop for Taylor Series
    mov ecx, 0x14
    mov dword[expCounter], 0x20 ;Initialize Counter
    mov dword[termNum], 0x1 ;Initialize Term Number
    
    fld qword[inputFloat]
    fst qword[originalInput]
    emms
    
Taylor:
    fld qword[originalInput]
    fst qword[inputFloat]
    emms
    
    mov dword[orig], ecx
    mov esi, dword[expCounter]
    ;x^n
    Exponent:
      cmp esi, 0x0
      jz reset
      
      fld qword[originalInput]
      fld qword[inputFloat]
      fmul st0,st1
      fst qword[inputFloat]
      emms
      
      push dword[inputFloat+4]
      push dword[inputFloat]
      push testString
      call _printf
      add esp, 0xC


      sub esi, 1
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
    
    ;loop Taylor
    
    xor eax, eax
    ret
