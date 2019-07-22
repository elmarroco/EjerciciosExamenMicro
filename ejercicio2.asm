; 2. Diseñe en ensamblador, una rutina (procedimiento que será llamado con CALL),
; que determine si en una cadena existe el símbolo #
; la rutina retornara un 0 si no existe y 1 en caso de existir.
; Usted define la manera en que serán pasados los argumentos,
; y la forma en será regresada la respuesta.

; Respuesta

; Mis argumentos vendran en este orden;
; Segmento SP + 6, OFFSET SP + 4, (IP SP + 2)
HAS_#:
    PUSH BP              ; Guardar el valor de bp en la pila
    MOV BP, SP           ; cargar en bp el valor de sp para acceder a la pila
    PUSH DS              ; Guardar el registro es porque se va a modificar,
                         ; sera el segmento de la cadena a analizar
    PUSH SI              ; Guardar el di que se usara para el offset de la
                         ; cadena a analizar
    PUSH AX              ; Guardar ax por que se utilizara
    PUSHF                ; Guardar el registro de banderas po si se modifica
    MOV AX, [BP+6]       ; Obtener el segmento de la cadena que se encuentra
                         ; en la tercera posición de la pila
                         ; al registro temporal ax
    MOV DS, AX           ; Copiar el segmento a ax
    MOV SI, [BP+4]       ; Copiar el offset de la cadena que se encuentra
                         ; en la tercera posicion de la pila
    XOR BX, BX           ; Mi resultado se encontrara en bx, lo inicializo
                         ; con 0
    CLD                  ; borrar bandera de direccion para ir en orden ascendente
    HAS_H_loop:          ; Etiqueta de ciclo
        LODSB            ; Carga en al lo que esta en la direccion DS:[SI]
        CMP AL, 0        ; Verifica caracter nulo para terminar ciclo
        JEQ END_LOOP     ; Salta a terminar ciclo si la resta da 0
        CMP AL, 35       ; resta al con 35
        JNE not_found    ; salta si al es diferente de 35
        MOV BX, 1        ; pon bx en 1 si fue igual a 35
        NOT_FOUND:
        JMP HAS_H_loop   ; Saltar al ciclo
    END_LOOP:
        POPF             ; Liberar pila
        POP AX
        POP SI
        POP DS
        POP BP
        RET              ; Regresar a Main
