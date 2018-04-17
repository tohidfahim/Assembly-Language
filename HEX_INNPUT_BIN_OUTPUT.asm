.MODEL SAMLL 
.STACK 100H
.DATA
    A DW 0
.CODE

MAIN PROC
    XOR BX, BX
    MOV CX, 4
    
    MOV AH, 1
    INT 21H      
    
    ENTER:
        CMP AL, 0DH
        JE END_FOR_INTPUT2
    
    CMP AL, 39H 
    JG LETTER
    AND AL, 0FH
    JMP SHIFT
    
    LETTER:
        SUB AL, 37H
    SHIFT:
        SHL BX, CL
        OR BL, AL
        
        INT 21H
        JMP ENTER 
        
    
        
    END_FOR_INTPUT2:
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH                               
    INT 21H
    
    MOV CX, 16
    MOV AH, 2
      
    BINARY_OUTPUT1: 
    ROL BX, 1
    JC PRINT_ONE1
    JMP PRINT_ZERO1
    
    PRINT_ONE1:
        MOV DL, '1'
        INT 21H 
        JMP NEXT_21
    PRINT_ZERO1:
        MOV DL, '0'
        INT 21H  
        JMP NEXT_21
        
        NEXT_21:
        LOOP BINARY_OUTPUT1
    
    MOV A, BX
    
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH                               
    INT 21H
    
    XOR BX, BX
    MOV CX, 4
    
    MOV AH, 1
    INT 21H      
    
    ENTER_A:
        CMP AL, 0DH
        JE END_FOR_INTPUT22
    
    CMP AL, 39H 
    JG LETTER_A
    AND AL, 0FH
    JMP SHIFT_A
    
    LETTER_A:
        SUB AL, 37H
    SHIFT_A:
        SHL BX, CL
        OR BL, AL
        
        INT 21H
        JMP ENTER_A 
        
    END_FOR_INTPUT22:
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH                               
    INT 21H
    
    MOV CX, 16
    MOV AH, 2
      
    BINARY_OUTPUT12: 
    ROL BX, 1
    JC PRINT_ONE12
    JMP PRINT_ZERO12
    
    PRINT_ONE12:
        MOV DL, '1'
        INT 21H 
        JMP NEXT_212
    PRINT_ZERO12:
        MOV DL, '0'
        INT 21H  
        JMP NEXT_212
        
        NEXT_212:
        LOOP BINARY_OUTPUT12
        
    ADD  BX, A
    
    END_FOR_OUTPUT:
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH                               
    INT 21H
    ;JMP BINARY_OUTPUT
    
    MOV CX, 16
    MOV AH, 2
     
    BINARY_OUTPUT: 
    ROL BX, 1
    JC PRINT_ONE
    JMP PRINT_ZERO
    
    PRINT_ONE:
        MOV DL, '1'
        INT 21H 
        JMP NEXT_2
    PRINT_ZERO:
        MOV DL, '0'
        INT 21H  
        JMP NEXT_2
        
        NEXT_2:
        LOOP BINARY_OUTPUT
    
    MOV AH, 4CH
    INT 21H
    MAIN ENDP
END MAIN