; modelo de memoria
.model small

; segmento de pila
.stack

; segmento de datos
.data
    char db ?
    string db ?

; segmento de código
.code
    main PROC

        ; importar segmento de datos
        mov ax, @data
        mov ds, ax
        xor ax, ax

        ; pedir ingreso de un caracter
        mov ah, 1h
        int 21h
        mov char, al

        ; imprimir salto de línea (ascii 10d)
        mov ah, 2h
        mov dl, 10d
        int 21h

        ; imprimir el caracter ingresado
        mov ah, 2h
        mov dl, char
        int 21h

        ; /////////////

        ; imprimir salto de línea (ascii 10d)
        mov ah, 2h
        mov dl, 10d
        int 21h

        ; pedir ingreso de una cadena
        xor si, si
        getChar:
            ; leer un caracter
            mov ah, 1h
            int 21h

            ; detectar enter (ascii 13d)
            cmp al, 13d
            je endGetChar

            ; guadar el caracter en la cadena
            mov string[si], al
            inc si
            jmp getChar

        endGetChar:

        ; imprimir salto de línea (ascii 10d)
        mov ah, 2h
        mov dl, 10d
        int 21h

        ; imprimir cadena
        xor di, di
        printChar:
            ; imprimir el caracter en la posición di
            mov ah, 2h
            mov dl, string[di]
            int 21h

            ; incrementar el índice
            inc di

            ; comparar el índice con el tamaño de la cadena
            cmp di, si
            je endPrintChar
            jmp printChar

        endPrintChar:

    main ENDP
end main
