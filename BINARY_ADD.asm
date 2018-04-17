.MODEL SMALL
.STACK 100H
.DATA 
    A DB 8
    B DB 8
.CODE

MAIN PROC
    
    MOV CX, 8
    XOR BL, BL
    MOV AH, 1
    
    BINARY_INPUT_1:
        SHL BL, 1
        INT 21H
        AND AL, 0FH
        OR BL, AL
        LOOP BINARY_INPUT_1 
        
    MOV A, BL
             
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    
    ;MOV CX, 8
    ;MOV AH, 2
    
    ;BINARY_OUTPUT_1:
     ;   ROL BL, 1
      ;  JC PRINT_ONE_1
       ; JMP PRINT_ZERO_1   
        
        ;PRINT_ONE_1:
        ;MOV DL, '1'
        ;INT 21H 
        ;JMP NEXT_1
        ;PRINT_ZERO_1:
        ;MOV DL, '0'
        ;INT 21H  
        ;JMP NEXT_1
        
        ;NEXT_1:
        ;LOOP BINARY_OUTPUT_1
        
        
    ;MOV AH, 2
    ;MOV DL, 0AH
    ;INT 21H
    ;MOV DL, 0DH
    ;INT 21H    
        
    MOV CX, 8
    XOR BL, BL
    MOV AH, 1
    
    BINARY_INPUT_2:
        SHL BL, 1
        INT 21H
        AND AL, 0FH
        OR BL, AL
        LOOP BINARY_INPUT_2 
        
    ;MOV B, BL
    ADD BL, A
             
    MOV AH, 2
    MOV DL, 0AH
    INT 21H
    MOV DL, 0DH
    INT 21H
    
    MOV CX, 8
    MOV AH, 2
    
    BINARY_OUTPUT_2:
        ROL BL, 1
        JC PRINT_ONE_2
        JMP PRINT_ZERO_2   
        
        PRINT_ONE_2:
        MOV DL, '1'
        INT 21H 
        JMP NEXT_2
        PRINT_ZERO_2:
        MOV DL, '0'
        INT 21H  
        JMP NEXT_2
        
        NEXT_2:
        LOOP BINARY_OUTPUT_2
           
    
        MOV AH, 4CH
        INT 21H
    MAIN ENDP
END MAIN