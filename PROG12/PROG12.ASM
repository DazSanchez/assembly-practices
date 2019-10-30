.MODEL SMALL

.STACK 64

.DATA
	CAD		DB "Como te llamas?","$"

	ENTRADA LABEL BYTE		; LABEL [TYPE] = AGRUPAR VARIABLES
	MAX 	DB 20			; Número máximo de caracteres que se pueden introducir 
	REAL 	DB ?			; Cuántos caracteres fueron introducidos
	RESERV 	DB 20 DUP(" ")	; N DUP = Duplicar N veces el parámetro

.CODE
PRIN PROC FAR
	MOV AX,@data		; Obtiene la dirección del segmento de datos
	MOV DS,AX			; Asigna la dirección al registro de datos
	
	; LIMPIAR PANTALLA
	MOV AX,0600H	; INT Limpiar pantalla 
	MOV BH,07H		; Color: 7 (Pantalla, Blanco) 1 (Texto, Azul)
	MOV CX,0000H	; Coordenada incial (R,C) RRCCH
	MOV DX,0C4FH	; Coordenada final	(R,C) RRCCH
	INT 10H
	
	; LIMPIAR PANTALLA
	MOV AX,0600H	; INT Limpiar pantalla 
	MOV BH,17H		; Color: 7 (Pantalla, Blanco) 1 (Texto, Azul)
	MOV CX,0613H	; Coordenada incial (R,C) RRCCH
	MOV DX,1239H	; Coordenada final	(R,C) RRCCH
	INT 10H
	
	; POSICIONAR CURSOR
	MOV AH,02H		; INT Mover cursor
	MOV BH,00		; Paginación = 0
	MOV DH,12		; Renglón 5 / 24
	MOV DL,25		; Columna 12 / 79
	INT 10H			; Solicitar interrupción
	
	; MOSTRAR CADENA
	MOV AH,09H
	LEA DX,CAD
	INT 21H
	
	; POSICIONAR CURSOR
	MOV AH,02H		; INT Mover cursor
	MOV BH,00		; Paginación = 0
	MOV DH,13		; Renglón 5 / 24
	MOV DL,25		; Columna 12 / 79
	INT 10H			; Solicitar interrupción
	
	MOV AH,0AH 			; INT Entrada de teclado 
	LEA DX,ENTRADA 		; LEA = APUNTADOR, DX
	INT 21H 			; INT DEL SISTEMA
	
	MOV AX,4C00H	; Salir a MS-DOS
	INT 21H
PRIN ENDP
END PRIN