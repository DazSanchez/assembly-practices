.MODEL SMALL

.STACK 64

.DATA

.CODE
PRIN PROC FAR
	; POSICIONAR CURSOR
	;MOV AH,02H		; INT Mover cursor
	;MOV BH,00		; Paginación = 0
	;MOV DH,05		; Renglón 5 / 24
	;MOV DL,12		; Columna 12 / 79
	;INT 10H		; Solicitar interrupción
	
	; LIMPIAR PANTALLA
	MOV BH,71H		; Color: 7 (Pantalla, Blanco) 1 (Texto, Azul)
	MOV CX,0000H	; Coordenada incial (R,C) RRCCH
	MOV DX,0C27H	; Coordenada final	(R,C) RRCCH
	CALL PRINT
	
	MOV BH,51H		; Color: 7 (Pantalla, Blanco) 1 (Texto, Azul)
	MOV CX,0027H	; Coordenada incial (R,C) RRCCH
	MOV DX,0C4FH	; Coordenada final	(R,C) RRCCH
	CALL PRINT
	
	MOV BH,21H		; Color: 7 (Pantalla, Blanco) 1 (Texto, Azul)
	MOV CX,0C00H	; Coordenada incial (R,C) RRCCH
	MOV DX,1827H	; Coordenada final	(R,C) RRCCH
	CALL PRINT
	
	MOV BH,31H		; Color: 7 (Pantalla, Blanco) 1 (Texto, Azul)
	MOV CX,0C27H	; Coordenada incial (R,C) RRCCH
	MOV DX,184FH	; Coordenada final	(R,C) RRCCH
	CALL PRINT
	
	MOV AX,4C00H	; Salir a MS-DOS
	INT 21H
PRIN ENDP

PROC PRINT NEAR
	MOV AX,0600H	; INT Limpiar pantalla 
	INT 10H
	RET
PRINT ENDP
END PRIN