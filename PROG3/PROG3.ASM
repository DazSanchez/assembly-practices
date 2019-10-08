; ADD op1,op2 => op2 + op1
.MODEL SMALL	; Modelo de memoria SMALL = 1 Segmento de memoria por registro

.STACK 64		; Definición del segmento de pila

.DATA			; Definición del segmento de datos
VAR DB	?		; DB = Define Byte = 256
VAR2 DB 10
VAR3 DB 20
VAR4 DB ?
VAR5 DW ?

.CODE			; Definición del segmento de código
PRIN PROC FAR	; PROC = Define un procedimiento
MOV AX,@data	; Obtiene la dirección del segmento de datos
MOV DS,AX		; Asigna la dirección al registro de datos

; 100 + 22 = DL (REG,REG)
MOV AL,100		; AL = 100
MOV AH,22		; AH = 22
ADD AH,AL		; AL + AH
MOV DL,AH		; DL = AL + AH

; 200 + 30 = VAR (REG,REG)
MOV AH,200		; AH = 200
MOV AL,30		; AL = 30
ADD AL,AH		; AH + AL
MOV VAR,AH		; VAR = AH

; VAR2 + VAR3 = VAR4 (REG,REG)
MOV AH,VAR2
MOV AL,VAR3
ADD AL,AH	; VAR2 + VAR3
MOV VAR4,AL	; VAR4 = VAR2 + VAR3

; BH + 190 = AH
MOV BH,10		; BH = 10
MOV BL,190		; BL = 190
ADD BL,BH		; BH + BL
MOV AH,BL		; AH = BH + BL

; 800 + 3 = VAR5
MOV CX,800		; CX = 800
MOV DX,3		; DX = 3
ADD DX,CX		; CX + DX
MOV VAR5,DX		; VAR5 = CX + DX

; 14 + 500 = DX
MOV AX,14		; AL = 14
MOV BX,500		; BX = 500
ADD BX,AX		; AX + BX
MOV DX,BX		; DX = AX + BX

MOV AX,4C00H	; Salir a MS-DOS
INT 21H

PRIN ENDP		; ENDP = Directiva para finalizar procedimiento
END PRIN		; END = Directiva para terminar programa
				; Sólo con el procedimiento principal