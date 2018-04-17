.MODEL SMALL
.STACK 100H                  
.DATA 
     ARR DB 'F', 'Y', 'E', 'V', 'U', 'W', 'Q', 'N', 'R', 'V'
     LEN DW $-ARR
.CODE 
    ASSUME DS:DATA CS:CODE


MAIN PROC
    
      MOV AX,@DATA
      MOV DS,AX
             
      MOV CX,LEN-1   
OUTER:
      LEA SI,ARR
      MOV BX,0       
INNER:
      INC BX
      MOV AL,ARR[SI]
      INC SI
      CMP ARR[SI],AL
      JB SKIP
     
      XCHG AL,ARR[SI]
      MOV ARR[SI-1],AL
     
SKIP:
      CMP BX,CX
      JL  INNER
                
      LOOP OUTER
             
             
    MOV CX, 10   
    LEA SI, ARR
    
    PRINT:

    MOV BL, ARR[SI] 
    MOV DL, BL

    MOV AH, 2
    INT 21H
    INC SI
    LOOP PRINT  
    
      MOV AH,4CH
      INT 21H     
    MAIN ENDP
END MAIN