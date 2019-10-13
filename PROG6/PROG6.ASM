; SUB op1,op2 => op1 - op2 = op1
.MODEL SMALL	; Modelo de memoria SMALL = 1 Segmento de memoria por registro

.STACK 64		; Definición del segmento de pila

.DATA			; Definición del segmento de datos
VAR DW ?
VAR2 DW ?
X DW ?

.CODE			; Definición del segmento de código
PRIN PROC FAR	; PROC = Define un procedimiento
MOV AX,@data	; Obtiene la dirección del segmento de datos
MOV DS,AX		; Asigna la dirección al registro de datos

; 600 - 5 = VAR (REG,INM)
MOV AX,600
SUB AX,5
MOV VAR,AX

; (1000 - 60 - 80) - 17 = REG (MEM,REG)
MOV AX,1000
SUB AX,60
SUB AX,80
MOV VAR,AX
MOV BX,17
SUB VAR,BX
MOV CX,VAR

; 15 - 10 = DL (REG,REG)
MOV DL,15
MOV DH,10
SUB DL,DH

; VAR - VAR = VAR (REG,INM)
MOV VAR,200
MOV AX,VAR
MOV VAR2,100
SUB AX,100
MOV VAR,AX

; DX - VAR = X (MEM,INM)
MOV DX,200
MOV VAR,DX
MOV VAR2,100
SUB VAR,100
MOV DX,VAR
MOV X,DX

MOV AX,4C00H	; Salir a MS-DOS
INT 21H

PRIN ENDP		; ENDP = Directiva para finalizar procedimiento
END PRIN		; END = Directiva para terminar programa
				; Sólo con el procedimiento principal