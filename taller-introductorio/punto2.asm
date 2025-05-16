.model small ; modelo de memoria
.stack ; segmento de pila
.data ; segmento de datos
    ; salto de línea (asscii 10)
    ; retorno de carro (asscii 13)
    msgWelcome db 'Hola mundo!',10,13,'$'
    msgChar1 db 'Ingrese el primer caracter:',10,13,'$'
    msgChar2 db 10,13,'Ingrese el segundo caracter:',10,13,'$'
    msgResultado db 10,13,'Los datos ingresados son:',10,13,'$'
    msgFin db 10,13,'Programa finalizado... $'
; segmento de código
.code
    main PROC
        ; importar segmento de datos
        mov ax, @data
        mov ds, ax
        xor ax, ax
        ; imprimir msgWelcome
        mov dx, offset msgWelcome
        mov ah, 9h
        int 21h
        ; imprimir msgChar1
        mov dx, offset msgChar1
        mov ah, 9h
        int 21h
        ; pedir primer caracter (se guarda en registro al)
        mov ah, 1h
        int 21h
        push ax
        ; imprimir msgChar2
        mov dx, offset msgChar2
        mov ah, 9h
        int 21h
        ; pedir segundo caracter (se guarda en registro al)
        mov ah, 1h
        int 21h
        push ax
        ; imprimir msgResultado
        mov dx, offset msgResultado
        mov ah, 9h
        int 21h
        ; cambiar el orden de los caracteres en el stack
        pop dx ; pop = sacar el valor del stack
        pop ax ; pop = sacar el valor del stack
        push dx ; push = meter el valor en el stack
        push ax ; push = meter el valor en el stack
        pop ax ; pop = sacar el valor del stack
        ; imprimir caracter 1
        mov ah, 2h
        mov dl, al
        int 21h
        pop ax ; pop = sacar el valor del stack
        ; imprimir caracter 2
        mov ah, 2h
        mov dl, al
        int 21h
        ; imprimir msgFin
        mov dx, offset msgFin
        mov ah, 9h
        int 21h
        .exit
    main ENDP
end main
