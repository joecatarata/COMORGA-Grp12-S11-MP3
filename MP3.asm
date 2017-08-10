extern _system, _printf, _scanf, _getchar, _puts

zeropower:
   
    fld1 
    fst qword[exponentAnswer]
    emms
    jmp Factorial

section .data
clrscr db "cls",0


formatFloat db "%lf", 0
formatOut db "The value of x is %lg  ",13,10,0
term db "Term #%d: ", 13,10,0
expCounter dd 0
termNum dd 0
eulerMessage db "e^x = ", 0
approx db "Approximations: ", 0
inputMsg db "Input x for the function e^x: ", 0
testCtr db "Ctr is %d", 0
partialString db "Partial Answer #%d is %lg, ",0
runningString db "The total Answer so far is %0.30lg", 13, 10, 0
conclusion db "The exponential function e^x is approximately equal to %0.30lg.", 13,10,0
testString db "%lg",13,10, 0
temp dd 0
tempEx dd 0
orig dd 0
total dq 0.0
inputFloat dq 0.0
facCtr dd 0
floatFacCtr dq 0.0
originalInput dq 0.0
exponentAnswer dq 0.0
factorialAnswer dq 1.0
partialAnswer dq 0.0
runningAnswer dq 0.0
FacAnswer dd 0
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
    mov dword[expCounter], 0x0 ;Initialize Counter
    mov dword[termNum], 0x1
    fld qword[inputFloat]
    fst qword[originalInput]
    emms
    
Taylor:
    fld qword[originalInput]
    fst qword[inputFloat]
    emms
    
    mov ebx, dword[expCounter]
    
    mov dword[facCtr], ebx
    
    mov dword[orig], ecx
    mov esi, dword[expCounter]
    ;x^n
    cmp dword[expCounter], 0x0
    jz zeropower
    Exponent:
      cmp esi, 0x1
      jz reset
      
      fld qword[originalInput]
      fld qword[inputFloat]
      fmul st0,st1
      fst qword[inputFloat]
      emms
     
      sub esi, 0x1
      jmp Exponent


    reset: 
        fld qword[inputFloat]
        fst qword[exponentAnswer]
        emms
        mov ecx, dword[expCounter]
        
    ;n!
    Factorial:

        cmp dword[facCtr], 0x1
        jle Divide
        
        fld qword[factorialAnswer]
        fimul dword[facCtr]
        fst qword[factorialAnswer]
        emms
        
    
        sub dword[facCtr], 0x1
        jmp Factorial
        
        
       
    Divide:
    ;div
    
    fld qword[exponentAnswer]
    fld qword[factorialAnswer]
    fdivr st0, st1 ;reverse for it to be stored at st0
    fst qword[partialAnswer]
    emms 
    
    fld qword[partialAnswer]
    fld qword[runningAnswer]
    fadd st0, st1
    fst qword[runningAnswer]
    emms
    

    push dword[partialAnswer+4]
    push dword[partialAnswer]
    push dword[termNum]
    push partialString
    call _printf
    add esp, 0x10
    
     push dword[runningAnswer+4]
    push dword[runningAnswer]
    push runningString
    call _printf
    add esp, 0xC
    
    
    

    fld1 
    fst qword[factorialAnswer]
    emms
    
    fldz
    fst qword[partialAnswer]
    emms
    
    mov ecx, dword[orig]
    inc dword[termNum]
    inc dword[expCounter]
    
    dec ecx
    
    jnz Taylor ;loop end
    
    
    push dword[runningAnswer+4]
    push dword[runningAnswer]
    push conclusion
    call _printf
    add esp, 0xC
    
    xor eax, eax
    ret
