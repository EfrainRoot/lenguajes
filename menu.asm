.MODEL SMALL  



.DATA     
     CADENA1 DB 'MENU DE OPERACIONES$'
     CADENA2 DB '[1] SUMA$'
     CADENA3 DB '[2] RESTA$'
     CADENA4 DB '[3] MULTIPLICACION$'
     CADENA5 DB '[4] DIVISION$'
     CADENA0 DB '[5] MAYOR$'
     CADENA6 DB 'SELECIONE UNA OPCION:$'
     CADENA7 DB 'ESTO ES UNA SUMA, [1] PARA REGRESAR',13,10,'$'
     CADENA8 DB 'ESTO ES UNA RESTA, [2] PARA REGRESAR',13,10,'$'
     CADENA9 DB 'ESTO ES UNA MULTIPLICACION, [3] PARA REGRESAR',13,10,'$'
     CADENA10 DB 'ESTO ES UNA DIVISION, [4] PARA REGRESAR',13,10,'$'
     CADENA11 DB 'ESTO ES EL NUMERO MAYOR, , [5] PARA REGRESAR',13,10,'$'
     
msj1 db 13,10,'Numero 1: ','$'
msj2 db 13,10,'Numero 2: ','$'
msj3 db 13,10,'Suma: ','$'
msj4 db 13,10,'Resta: ','$'
msj5 db 13,10,'Multiplicacion: ','$'
msj6 db 13,10,'Division: ','$'
linea db 13,10,'$'
var1 db 0
var2 db 0

;mayor

include 'emu8086.inc'
;Simples mensajes
msj1mayor db 0ah,0dh, 'Ingrese Tres digito del 0 al 9 : ', '$'
msj2mayor db 0ah,0dh, 'Primer Digito: ', '$'
msj3mayor db 0ah,0dh, 'Segundo Digito: ', '$'
msj4mayor db 0ah,0dh, 'Tercer Digito: ', '$'
Mayor db 0ah,0dh, 'El Digito Mayor Es: ', '$'

Digito1 db 100 dup('$')
Digito2 db 100 dup('$')
Digito3 db 100 dup('$')
     

.CODE   
     
     MOV AX,@DATA
     MOV DS,AX 
     
     
     MENU:;ETIQUETA
     
     MOV AH,06H        
     MOV AL,0        
     MOV BH,0EH    
     MOV CX,0000H                                     
     MOV DX,184FH
     INT 10H 
     
   ;///////////////////////////////////////// 
              ;MENU DE OP
     
     MOV AH,06H         
     MOV AL,0         
     MOV BH,0EH    
     MOV CX,0507H ;FILA, COLUM INIC             
     MOV DX,0348H    ;COLUMNA FINALES
     INT 10H  
                                                      
    ;/////////////////////////////////////////
     
     
     MOV AH,06H        
     MOV AL,0         
     MOV BH,8FH    
     MOV CX,0507H                                    
     MOV DX,1448H
     INT 10H        
     
         
     
    ;/////////////////////////////////////////

    MOV AH,02H
    MOV BH,0      
    MOV DH,03H  
    MOV DL,23H   
    INT 10H 
                ;MOV PARA IMPRIMIR EL MENSAJE
    MOV AH,09H
    MOV DX,OFFSET CADENA1
    INT 21H  
   
    
    ;/////////////////////////////////////////
                 
    MOV AH,02H
    MOV BH,0     
    MOV DH,06H   
    MOV DL,09H  
    INT 10H  
                 ;MOV PARA IMPRIMIR EL MENSAJE
    MOV AH,09H
    MOV DX,OFFSET CADENA2
    INT 21H                
                 
    ;/////////////////////////////////////////
    
    
    MOV AH,02H
    MOV BH,0      
    MOV DH,08H   
    MOV DL,09H   
    INT 10H  
                 ;MOV PARA IMPRIMIR EL MENSAJE
    MOV AH,09H
    MOV DX,OFFSET CADENA3
    INT 21H 
    
    ;/////////////////////////////////////////
                 
    MOV AH,02H
    MOV BH,0     
    MOV DH,0AH   
    MOV DL,09H  
    INT 10H  
                 ;MOV PARA IMPRIMIR EL MENSAJE
    MOV AH,09H
    MOV DX,OFFSET CADENA4
    INT 21H 
    
    ;/////////////////////////////////////////
                 
    MOV AH,02H
    MOV BH,0     
    MOV DH,0CH   
    MOV DL,09H  
    INT 10H  
                 ;MOV PARA IMPRIMIR EL MENSAJE
    MOV AH,09H
    MOV DX,OFFSET CADENA5
    INT 21H
    
    ;/////////////////////////////////////////
                 
    MOV AH,02H
    MOV BH,0     
    MOV DH,0EH   
    MOV DL,09H  
    INT 10H  
                 ;MOV PARA IMPRIMIR EL MENSAJE
    MOV AH,09H
    MOV DX,OFFSET CADENA0
    INT 21H  
    
    ;/////////////////////////////////////////
                 
    MOV AH,02H
    MOV BH,0     
    MOV DH,16H        ;80 Y 25 FILAS 
    MOV DL,34H      ;ABAJO
    INT 10H  
                 ;MOV PARA IMPRIMIR EL MENSAJE
    MOV AH,09H
    MOV DX,OFFSET CADENA6
    INT 21H 
                    
                     ;---FUNCION SALTO PANTALLA----INICIO------- 
        
    MOV AH,0H
    INT 16H
    
    CMP AL,"1" 
    JE SUMA
    
    CMP AL,"2"
    JE RESTA
    
    CMP AL,"3"
    JE MULTIPLICACION
    
    CMP AL,"4"
    JE DIVISION
    
    CMP AL,"5"
    JE MAYORES   
    
    
    ;TERMINA EL PROGRAMA
     
    MOV AH,4CH 
    INT 21H
    JMP
   
   ; MOV AX,4C00H
   ; INT 21        
        
        SUMA:    
    MOV AH,06H 
    MOV AL,0  
    MOV BH,0EH ;FONDO COLOR
    MOV CX,0000H   
    MOV DX,187FH 
    INT 10H  
    
    ;COORDENADAS TEXTO
    MOV AH,02H
    MOV BH,0
    MOV DH,06H
    MOV DL,06H
    INT 10H
    
    ;IMPRIMIR MENSAJE
    MOV AH,09H
    MOV DX, OFFSET CADENA7
    INT 21H
;****************para ingresar
MOV AH,09H
    MOV DX, OFFSET msj1
    INT 21H    
call leer ;lee primer numero
sub al,30h ;restar 30h para obtener el numero
mov var1,al ;lo guardo en var1
mov ah,09h
lea dx, msj2 ;desplegar numero 2:
int 21h

call leer ;lee segundo numero
sub al,30h ;restar 30h para obtener segundo valor
mov var2,al ;guardar en var2
mov bl,var2 ;mover a bl

;******************* SUMA
add bl,var1 ; realizo la suma de var2(bl) y var1 y el resultado queda en bl
mov ah,09h
lea dx,msj3 ;imprimir suma
int 21h
mov dl,bl ;pongo en dl el numero a imprimir var2(bl)
add dl,30h ; agrego 30h para obtener el caracter    
mov ah,02h ;imprime un caracter
int 21h
    
    ;RETORNO A PANTALLA PRINCIPAL
    MOV AH,0H
    INT 16H
    CMP AL, "1"
    JE MENU
    
    JMP    
    
    RESTA:
    MOV AH,6H 
    MOV AL,0  
    MOV BH,0EH ;FONDO COLOR
    MOV CX,0000H 
    MOV DX,187FH
    INT 10H 

    
    ;COORDENADAS TEXTO
    MOV AH,02H
    MOV BH,0
    MOV DH,06H
    MOV DL,06H
    INT 10H
    
    ;IMPRIMIR MENSAJE
    MOV AH,09H
    MOV DX, OFFSET CADENA8
    INT 21H

;******************ingresamos datos del metodo

MOV AH,09H
    MOV DX, OFFSET msj1
    INT 21H    
call leer ;lee primer numero
sub al,30h ;restar 30h para obtener el numero
mov var1,al ;lo guardo en var1
mov ah,09h
lea dx, msj2 ;desplegar numero 2:
int 21h

call leer ;lee segundo numero
sub al,30h ;restar 30h para obtener segundo valor
mov var2,al ;guardar en var2
mov bl,var2 ;mover a bl
    
mov bl,var1
sub bl,var2
mov ah,09h
lea dx,msj4 ;desplegar resta:
int 21h
mov dl,bl ;mover resta a dl para imprimir
add dl,30h ;sumar 30 para obtener caracter
mov ah,02h ;imprimir un caracter
int 21h    
    
    ;RETORNO A PANTALLA PRINCIPAL
    MOV AH,0H
    INT 16H
    CMP AL, "2"
    JE MENU
    
    JMP     
    
    MULTIPLICACION:
    MOV AH,06H 
    MOV AL,0  
    MOV BH,0EH ;FONDO COLOR
    MOV CX,0000H 
    MOV DX,187FH
    INT 10H

    
    ;COORDENADAS TEXTO
    MOV AH,02H
    MOV BH,0
    MOV DH,06H
    MOV DL,06H
    INT 10H
    
    ;IMPRIMIR MENSAJE
    MOV AH,09H
    MOV DX, OFFSET CADENA9
    INT 21H

MOV AH,09H
    MOV DX, OFFSET msj1
    INT 21H    
call leer ;lee primer numero
sub al,30h ;restar 30h para obtener el numero
mov var1,al ;lo guardo en var1
mov ah,09h
lea dx, msj2 ;desplegar numero 2:
int 21h

call leer ;lee segundo numero
sub al,30h ;restar 30h para obtener segundo valor
mov var2,al ;guardar en var2
mov bl,var2 ;mover a bl
        
mov ah,09h
lea dx,msj5 ;desplegar mult
int 21h

mov al,var1 
mov bl,var2
mul bl ;mult al=al*bl
mov dl,al ;mover al a dl para imprimir
add dl,30h ;sumar 30 para obtener caracter
mov ah,02h ;imprimir caracter
int 21h    
    
    ;RETORNO A PANTALLA PRINCIPAL
    MOV AH,0H
    INT 16H
    CMP AL, "3"
    JE MENU
    
    JMP     
        
    DIVISION: 
    MOV AH,06H 
    MOV AL,0  
    MOV BH,0EH ;FONDO COLOR
    MOV CX,0000H 
    MOV DX,187FH
    INT 10H 
 
    
    ;COORDENADAS TEXTO
    MOV AH,02H
    MOV BH,0
    MOV DH,06H
    MOV DL,06H
    INT 10H
    
    ;IMPRIMIR MENSAJE
    MOV AH,09H
    MOV DX, OFFSET CADENA10
    INT 21H

MOV AH,09H
    MOV DX, OFFSET msj1
    INT 21H    
call leer ;lee primer numero
sub al,30h ;restar 30h para obtener el numero
mov var1,al ;lo guardo en var1
mov ah,09h
lea dx, msj2 ;desplegar numero 2:
int 21h

call leer ;lee segundo numero
sub al,30h ;restar 30h para obtener segundo valor
mov var2,al ;guardar en var2
mov bl,var2 ;mover a bl
    
mov ah,09h
lea dx,msj6 ;desplegar div
int 21h
xor ax,ax ;limpiamos el registro ax. 
mov al,var2
mov bl,al
mov al,var1
div bl ; divide AX/BX el resultado lo almacena en AX, el residuo queda en DX
mov bl,al
mov dl,bl
add dl,30h
mov ah,02h
int 21h    
    
    ;RETORNO A PANTALLA PRINCIPAL
    MOV AH,0H
    INT 16H
    CMP AL, "4"
    JE MENU
    
    JMP     
        
    MAYORES: 
    MOV AH,06H 
    MOV AL,0  
    MOV BH,0EH ;FONDO COLOR
    MOV CX,0000H 
    MOV DX,187FH
    INT 10H 
 
    
    ;COORDENADAS TEXTO
    MOV AH,02H
    MOV BH,0
    MOV DH,06H
    MOV DL,06H
    INT 10H
    
    ;IMPRIMIR MENSAJE
    MOV AH,09H
    MOV DX, OFFSET CADENA11
    INT 21H
    
mov si,0
mov ax,@data
mov ds,ax
mov ah,09
mov dx,offset msj1mayor ;Imprimimos el msj1
int 21h

call saltodelinea;llamamos el metodo saltodelinea.

call pedircaracter ;llamamos al metodo

mov Digito1,al ;lo guardado en AL a digito1

call saltodelinea

call pedircaracter

mov Digito2,al

call saltodelinea

call pedircaracter

mov Digito3,al

call saltodelinea

;*******************************COMPARAR*****************************************

mov ah,digito1
mov al,digito2
cmp ah,al ;compara primero con el segundo
ja compara-1-3 ;si es mayor el primero, ahora lo compara con el tercero
jmp compara-2-3 ;si el primero no es mayor,ahora compara el 2 y 3 digito
compara-1-3:
mov al,digito3 ;ah=primer digito, al=tercer digito
cmp ah,al ;compara primero con tercero
ja mayor1 ;si es mayor que el tercero, entonces el primero es mayor que los 3

compara-2-3:
mov ah,digito2
mov al,digito3
cmp ah,al ;compara 2 y 3, YA NO es necesario compararlo con el 1,porque ya sabemos que el 1 no es mayor que el 2
ja mayor2 ;Si es mayor el 2,nos vamos al metodo para imprimirlo
jmp mayor3 ;Si el 2 no es mayor, obvio el 3 es el mayor

 
mayor1:

call MensajeMayor ;llama al metodo que dice: El digito mayor es:

mov dx, offset Digito1 ;Imprir El Digito 1 es mayor
mov ah, 9
int 21h
jmp

mayor2:
call MensajeMayor

mov dx, offset Digito2 ;Salto de linea
mov ah, 9
int 21h
JMP

mayor3:
call MensajeMayor

mov dx, offset Digito3 ;Salto de linea
mov ah, 9
int 21h
JMP

;********************************METODOS*****************************************

MensajeMayor:
mov dx, offset Mayor ;El digito Mayor es:
mov ah, 9
int 21h
ret

pedircaracter:
mov ah,01h; pedimos primer digito
int 21h
ret

saltodelinea:
mov dx, offset salto ;Salto de linea
mov ah, 9
int 21h
ret
    
;RETORNO A PANTALLA PRINCIPAL
    MOV AH,0H
    INT 16H
    CMP AL, "5"
    JE MENU
    
    JMP
    
; ****************PROCEDIMIENTOS
salto proc near
mov ah,09h
lea dx,linea
int 21h
mov dl,00h
ret
salto endp

leer proc near
mov ah,01h;leer caracter desde el teclado
int 21h;lee primer caracter
ret
leer endp

limpia proc near
mov ah,00h
mov al,03h
int 10h
ret
limpia endp     
    
    ;---FUNCION SALTO PANTALLA----FIN------- 
    
    ;FIN
     
    
    
    CODE ENDS
END