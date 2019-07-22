; Considere el siguiente código en lenguaje C:
; int x;
; . . .
; Procedimiento1 (x);
; . . .
; Procedimiento2 (&x);
; Los procedimientos son de tipo void. ¿Cómo es el código en
; ensamblador para el paso de argumentos en ambos procedimientos?
; Observe que la variable int es de 4 bytes, en un procedimiento
; hay paso por valor y en otro paso por referencia.

; Respuesta 1
MAIN:
  MOV BX, [x]   ; Guarda lo que hay en la dirección de x en el registro BX
                ; Notese que al utilizar BX, estoy copiando de palabra en
                ; palabra, de 2 bytes en 2 bytes
  PUSH BX       ; guardo en la pila la primera parte de x
  MOV BX, [x+2] ; Guardar en BX el 34
  PUSH BX       ; Guardar en la pila el 34
  CALL Procedimiento1

x: dw 25, 34

; Mis argumentos son los siguientes
; IP SP +2,
; valor x se encuentra en [SP + 4] Y [SP + 6]

Procedimiento1:
  PUSH BP
  MOV BP, SP
  PUSH AX
  PUSHF
  MOV AX, [BP+4]
  ; ... Modifica el valor de AX
  POPF
  POP AX
  POP BP
  RET

  ; Respuesta 2
MAIN:
  MOV BX, x
  CALL Procedimiento2

x: dw 25, 34

; Mis argumentos son los siguientes
; IP se encuentra en SP +2,
; direccion x se encuentra en [SP + 4]
Procedimiento2:
  PUSH BP
  MOV BP, SP
  PUSH AX
  PUSH BX
  PUSHF
  MOV AX, [[BP+4]] ; se puede utilizar tambien LODSW
  MOV BX, [[BP+4]+2] ; ; se puede utilizar tambien LODSW
  ; ...
  POPF
  POP BX
  POP AX
  POP BP
  RET