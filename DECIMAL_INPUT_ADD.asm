.MODEL SMALL
.STACK 100H
.DATA
    A DW 0 
    B DW 0
.CODE

MAIN PROC 
    MOV BX, 0
    
    INPUT_DECIMAL:
    
    MOV AH, 1 
    INT 21H
    CMP AL, '*'
    JE OUTPUT_BINARY 
    CMP AL, '/'
    JE EXIT
    AND AX, 0FH
    PUSH AX
    
    MOV AX, 10
    MUL BX
    
    POP BX
    ADD BX, AX  
    LOOP INPUT_DECIMAL
    
    OUTPUT_BINARY:
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH                               
    INT 21H
    
    MOV CX, 16
    MOV AH, 2
      
    BINARY_OUTPUT: 
    ROL BX, 1
    JC PRINT_ONE
    JMP PRINT_ZERO
    
    PRINT_ONE:
        MOV DL, '1'
        INT 21H 
        JMP NEXT
    PRINT_ZERO:
        MOV DL, '0'
        INT 21H  
        JMP NEXT
        
        NEXT:
        LOOP BINARY_OUTPUT 
    
    ADD BX, A   
    MOV A, BX
     
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH                               
    INT 21H 
    
    MOV BX, 0
    JMP INPUT_DECIMAL
    
    EXIT:
    MOV BX, A
    MOV CX, 16 
    MOV AH, 2
    BINARY_OUTPUT1:
    ROL BX, 1
    JC PRINT_ONE1
    JMP PRINT_ZERO1
    
    PRINT_ONE1:
        MOV DL, '1'
        INT 21H 
        JMP NEXT
    PRINT_ZERO1:
        MOV DL, '0'
        INT 21H  
        JMP NEXT
        
        NEXT1:
        LOOP BINARY_OUTPUT1
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN    