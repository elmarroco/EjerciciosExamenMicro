; 6. Examine la siguiente rutina en lenguaje C:
; void Proc () {   
  ; char C[10];   
  ; int x;   
  ; for (x=0; x<10; x++) 
  ;   C[x] = ‘A’; 
  ;   }
Proc:
  SUB SP, 10  ; RESRVAR 10 ESPACIOS EN LA PILA
  MOV BP, SP
  XOR AX, AX ; variable x
  MOV CX, 10
  FOR_LOOP:
  MOV BYTE [BP], 65
  INC BP
  LOOP FOR_LOOP