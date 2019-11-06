; MACROS - Segento de código
; MACROS al inicio de MODEL
;MOSTRAR MACRO
;	MOV AH,09H				; INT Mostrar texto
;	LEA DX,MENSAJE			; Cargar la cadena a mostrar
;	INT 21H	
;ENDM

SET_DATA_SEGMENT MACRO
	MOV AX,@data		; Obtiene la dirección del segmento de datos
	MOV DS,AX			; Asigna la dirección al registro de datos
ENDM

DRAW_BOX MACRO
	; Pintar recuadro
    MOV AX,0600H        ; INT Pintado de pantalla
    MOV BH,5FH          ; Colores 	Púrpura/Blanco
    MOV CX,0C00H        ; Inicio    (12,0)
    MOV DX,1827H        ; Fin       (24,39)
    INT 10H             ; Realizar interrupción
ENDM

MOVE_CURSOR_TITLE MACRO
	; Mover el cursor para colocar ITO
	MOV AH,02H			; INT Mover cursor
	MOV BH,00			; Paginación 0
	MOV DH,13			; Fila
	MOV DL,16			; Columna
	INT 10H				; Realizar interrupción
ENDM

DRAW_TITLE MACRO
	; Mostrar ITO
	MOV AH,09H			; INT Mostrar texto
	LEA DX,ITO			; Cargar la cadena a mostrar
	INT 21H				; Realizar interrupción
ENDM

MOVE_CURSOR_STUDENT_INPUT MACRO
	; Mover el cursor para colocar STUDENT
	MOV AH,02H			; INT Mover cursor
	MOV BH,00			; Paginación 0
	MOV DH,15			; Fila
	MOV DL,02			; Columna
	INT 10H				; Realizar interrupción
ENDM

DRAW_STUDENT_LABEL MACRO
	; Mostrar STUDENT
	MOV AH,09H			; INT Mostrar texto
	LEA DX,STUDENT		; Cargar la cadena a mostrar
	INT 21H				; Realizar interrupción
ENDM

DRAW_STUDENT_INPUT MACRO
	; Pintar INPUT STUDENT
    MOV AX,0600H        ; INT Pintado de pantalla
    MOV BH,70H          ; Colores 	Blanco/Negro
    MOV CX,0F0CH        ; Inicio    (15,12)
    MOV DX,0F25H        ; Fin       (15,35)
    INT 10H             ; Realizar interrupción
ENDM

MOVE_CURSOR_SEMESTER_INPUT MACRO
	; Mover el cursor para colocar SEMESTER
	MOV AH,02H			; INT Mover cursor
	MOV BH,00			; Paginación 0
	MOV DH,17			; Fila
	MOV DL,02			; Columna
	INT 10H				; Realizar interrupción
ENDM

DRAW_SEMESTER_LABEL MACRO
	; Mostrar SEMESTER
	MOV AH,09H			; INT Mostrar texto
	LEA DX,SEMESTER		; Cargar la cadena a mostrar
	INT 21H				; Realizar interrupción
ENDM

DRAW_SEMESTER_INPUT MACRO
	; Pintar INPUT SEMESTER
    MOV AX,0600H        ; INT Pintado de pantalla
    MOV BH,70H          ; Colores 	Blanco/Negro
    MOV CX,110CH        ; Inicio    (17,12)
    MOV DX,1125H        ; Fin       (17,35)
    INT 10H             ; Realizar interrupción
ENDM

MOVE_CURSOR_NOTE_INPUT MACRO
	; Mover el cursor para colocar NOTE
	MOV AH,02H			; INT Mover cursor
	MOV BH,00			; Paginación 0
	MOV DH,19			; Fila
	MOV DL,02			; Columna
	INT 10H				; Realizar interrupción
ENDM

DRAW_NOTE_LABEL MACRO
	; Mostrar NOTE
	MOV AH,09H			; INT Mostrar texto
	LEA DX,NOTE			; Cargar la cadena a mostrar
	INT 21H				; Realizar interrupción
ENDM

DRAW_NOTE_INPUT MACRO
	; Pintar INPUT NOTE
    MOV AX,0600H        ; INT Pintado de pantalla
    MOV BH,70H          ; Colores 	Blanco/Negro
    MOV CX,1310H        ; Inicio    (19,16)
    MOV DX,1325H        ; Fin       (19,35)
    INT 10H             ; Realizar interrupción
ENDM

MOVE_CURSOR_REQUEST_STUDENT MACRO
	; Mover el cursor para colocar STUDENT
	MOV AH,02H			; INT Mover cursor
	MOV BH,00			; Paginación 0
	MOV DH,15			; Fila
	MOV DL,13			; Columna
	INT 10H				; Realizar interrupción
ENDM

REQUEST_STUDENT MACRO	
	; Ingresar STUDENT
	MOV AH,0AH 			; INT Entrada de teclado 
	LEA DX,INPUT_STUDENT
	INT 21H 			; Realizar interrupción
ENDM

MOVE_CURSOR_REQUEST_SEMESTER MACRO
	; Mover el cursor para colocar SEMESTER
	MOV AH,02H			; INT Mover cursor
	MOV BH,00			; Paginación 0
	MOV DH,17			; Fila
	MOV DL,13			; Columna
	INT 10H				; Realizar interrupción
ENDM

REQUEST_SEMESTER MACRO
	; Ingresar SEMESTER
	MOV AH,0AH 			; INT Entrada de teclado 
	LEA DX,INPUT_SEMESTER
	INT 21H 			; Realizar interrupción
ENDM

MOVE_CURSOR_REQUEST_NOTE MACRO
	; Mover el cursor para colocar NOTE
	MOV AH,02H			; INT Mover cursor
	MOV BH,00			; Paginación 0
	MOV DH,19			; Fila
	MOV DL,17			; Columna
	INT 10H				; Realizar interrupción
ENDM

REQUEST_NOTE MACRO
	; Ingresar NOTE
	MOV AH,0AH 			; INT Entrada de teclado 
	LEA DX,INPUT_NOTE
	INT 21H 			; Realizar interrupción
ENDM

MOVE_CURSOR_EXIT MACRO
	; Mover el cursor al final de la pantalla
	MOV AH,02H			; INT Mover cursor
	MOV BH,00			; Paginación 0
	MOV DH,00			; Fila
	MOV DL,23			; Columna
	INT 10H				; Realizar interrupción
ENDM

EXIT MACRO
	MOV AX,4C00H	; Salir a MS-DOS
	INT 21H
ENDM

INSERT_DATA MACRO
	DRAW_BOX
	
	MOVE_CURSOR_TITLE
	DRAW_TITLE
	
	MOVE_CURSOR_STUDENT_INPUT
	DRAW_STUDENT_LABEL
	DRAW_STUDENT_INPUT
	
	MOVE_CURSOR_SEMESTER_INPUT
	DRAW_SEMESTER_LABEL
	DRAW_SEMESTER_INPUT
	
	MOVE_CURSOR_NOTE_INPUT
	DRAW_NOTE_LABEL
	DRAW_NOTE_INPUT
	
	MOVE_CURSOR_REQUEST_STUDENT
	REQUEST_STUDENT
	
	MOVE_CURSOR_REQUEST_SEMESTER
	REQUEST_SEMESTER
	
	MOVE_CURSOR_REQUEST_NOTE
	REQUEST_NOTE
ENDM

.MODEL SMALL

.STACK 64

.DATA
	ITO			DB	"ITO","$"
    STUDENT		DB  "Nombre:","$"
    SEMESTER 	DB  "Semestre:","$"
    NOTE 		DB  "Calificacion:","$"

	INPUT_STUDENT			LABEL BYTE		; Nombre de estudiante
	STUDENT_MAX_LENGTH		DB 23			; Número máximo de caracteres que se pueden introducir 
	STUDENT_CURRENT_LENGTH	DB ?			; Cuántos caracteres fueron introducidos
	STUDENT_BUFFER			DB 23 DUP(" ")	; N DUP = Duplicar N veces el parámetro
	
	INPUT_SEMESTER			LABEL BYTE		; Semestre de estudiante
	SEMESTER_MAX_LENGTH		DB 3			; Número máximo de caracteres que se pueden introducir 
	SEMESTER_CURRENT_LENGTH	DB ?			; Cuántos caracteres fueron introducidos
	SEMESTER_BUFFER			DB 3 DUP(" ")	; N DUP = Duplicar N veces el parámetro
	
	INPUT_NOTE				LABEL BYTE		; Calificación de estudiante
	NOTE_MAX_LENGTH			DB 4			; Número máximo de caracteres que se pueden introducir 
	NOTE_CURRENT_LENGTH		DB ?			; Cuántos caracteres fueron introducidos
	NOTE_BUFFER				DB 4 DUP(" ")	; N DUP = Duplicar N veces el parámetro
.CODE
PRIN PROC FAR
	SET_DATA_SEGMENT
	
	INSERT_DATA
	
	INSERT_DATA
	
	INSERT_DATA
	
	MOVE_CURSOR_EXIT
	EXIT
PRIN ENDP
END PRIN