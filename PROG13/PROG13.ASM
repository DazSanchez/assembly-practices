; Mostrar recuadro con inputs de nombre, semestre y calificacion
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
	SEMESTER_MAX_LENGTH		DB 2			; Número máximo de caracteres que se pueden introducir 
	SEMESTER_CURRENT_LENGTH	DB ?			; Cuántos caracteres fueron introducidos
	SEMESTER_BUFFER			DB 2 DUP(" ")	; N DUP = Duplicar N veces el parámetro
	
	INPUT_NOTE				LABEL BYTE		; Calificación de estudiante
	NOTE_MAX_LENGTH			DB 4			; Número máximo de caracteres que se pueden introducir 
	NOTE_CURRENT_LENGTH		DB ?			; Cuántos caracteres fueron introducidos
	NOTE_BUFFER				DB 4 DUP(" ")	; N DUP = Duplicar N veces el parámetro

.CODE
PRIN PROC FAR
	MOV AX,@data		; Obtiene la dirección del segmento de datos
	MOV DS,AX			; Asigna la dirección al registro de datos
    
    ; Pintar recuadro
    MOV AX,0600H        ; INT Pintado de pantalla
    MOV BH,5FH          ; Colores 	Púrpura/Blanco
    MOV CX,0C00H        ; Inicio    (12,0)
    MOV DX,1827H        ; Fin       (24,39)
    INT 10H             ; Realizar interrupción
	
	; Mover el cursor para colocar ITO
	MOV AH,02H			; INT Mover cursor
	MOV BH,00			; Paginación 0
	MOV DH,13			; Fila
	MOV DL,16			; Columna
	INT 10H				; Realizar interrupción
	
	; Mostrar ITO
	MOV AH,09H			; INT Mostrar texto
	LEA DX,ITO			; Cargar la cadena a mostrar
	INT 21H				; Realizar interrupción
	
	; Mover el cursor para colocar STUDENT
	MOV AH,02H			; INT Mover cursor
	MOV BH,00			; Paginación 0
	MOV DH,15			; Fila
	MOV DL,02			; Columna
	INT 10H				; Realizar interrupción
	
	; Mostrar STUDENT
	MOV AH,09H			; INT Mostrar texto
	LEA DX,STUDENT		; Cargar la cadena a mostrar
	INT 21H				; Realizar interrupción
	
	; Mover el cursor para colocar SEMESTER
	MOV AH,02H			; INT Mover cursor
	MOV BH,00			; Paginación 0
	MOV DH,17			; Fila
	MOV DL,02			; Columna
	INT 10H				; Realizar interrupción
	
	; Mostrar SEMESTER
	MOV AH,09H			; INT Mostrar texto
	LEA DX,SEMESTER		; Cargar la cadena a mostrar
	INT 21H				; Realizar interrupción
	
	; Mover el cursor para colocar NOTE
	MOV AH,02H			; INT Mover cursor
	MOV BH,00			; Paginación 0
	MOV DH,19			; Fila
	MOV DL,02			; Columna
	INT 10H				; Realizar interrupción
	
	; Mostrar NOTE
	MOV AH,09H			; INT Mostrar texto
	LEA DX,NOTE			; Cargar la cadena a mostrar
	INT 21H				; Realizar interrupción
	
	; Pintar INPUT STUDENT
    MOV AX,0600H        ; INT Pintado de pantalla
    MOV BH,70H          ; Colores 	Blanco/Negro
    MOV CX,0F0CH        ; Inicio    (15,12)
    MOV DX,0F25H        ; Fin       (15,35)
    INT 10H             ; Realizar interrupción
	
	; Pintar INPUT SEMESTER
    MOV AX,0600H        ; INT Pintado de pantalla
    MOV BH,70H          ; Colores 	Blanco/Negro
    MOV CX,110CH        ; Inicio    (17,12)
    MOV DX,1125H        ; Fin       (17,35)
    INT 10H             ; Realizar interrupción
	
	; Pintar INPUT NOTE
    MOV AX,0600H        ; INT Pintado de pantalla
    MOV BH,70H          ; Colores 	Blanco/Negro
    MOV CX,1310H        ; Inicio    (19,16)
    MOV DX,1325H        ; Fin       (19,35)
    INT 10H             ; Realizar interrupción
	
	; Mover el cursor para colocar STUDENT
	MOV AH,02H			; INT Mover cursor
	MOV BH,00			; Paginación 0
	MOV DH,15			; Fila
	MOV DL,13			; Columna
	INT 10H				; Realizar interrupción
	
	; Ingresar STUDENT
	MOV AH,0AH 			; INT Entrada de teclado 
	LEA DX,INPUT_STUDENT
	INT 21H 			; Realizar interrupción
	
	; Mover el cursor para colocar SEMESTER
	MOV AH,02H			; INT Mover cursor
	MOV BH,00			; Paginación 0
	MOV DH,17			; Fila
	MOV DL,13			; Columna
	INT 10H				; Realizar interrupción
	
	; Ingresar SEMESTER
	MOV AH,0AH 			; INT Entrada de teclado 
	LEA DX,INPUT_SEMESTER
	INT 21H 			; Realizar interrupción
	
	; Mover el cursor para colocar NOTE
	MOV AH,02H			; INT Mover cursor
	MOV BH,00			; Paginación 0
	MOV DH,19			; Fila
	MOV DL,17			; Columna
	INT 10H				; Realizar interrupción
	
	; Ingresar NOTE
	MOV AH,0AH 			; INT Entrada de teclado 
	LEA DX,INPUT_NOTE
	INT 21H 			; Realizar interrupción
	
	; Mover el cursor al final de la pantalla
	MOV AH,02H			; INT Mover cursor
	MOV BH,00			; Paginación 0
	MOV DH,00			; Fila
	MOV DL,23			; Columna
	INT 10H				; Realizar interrupción
	
	MOV AX,4C00H	    ; Salir a MS-DOS
	INT 21H
PRIN ENDP
END PRIN