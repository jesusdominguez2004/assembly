; macro para imprimir un caracter
printChar macro char
    mov ah,02h
    mov dl, char
    int 21h
endm

; modelo de memoria
.model small

; segmento de pila
.stack

; segmento de datos
.data
    bool1 db 1b
    bool2 db 1b
    bool3 db 0b

; segmento de código
.code
    main PROC

        ; Importar segmento de datos
        mov dx, @DATA   
        mov ds, dx
        xor dx, dx 

        ; if
        ; if (bool1) {print(a)} else {print(b)}
        cmp bool1, 1b
        je a1
        jmp a2

        a1:
            printChar 'a'
            jmp a3
        a2:
            printChar 'b'
        a3:

        ; if with or
        ; if (bool1 or bool2) {print(a)} else {print(b)}
        cmp bool1, 1b
        je b1

        cmp bool2, 1b
        je b1
        jmp b2

        b1:
            printChar 'a'
            jmp b3
        b2:
            printChar 'b'
        b3:

        ; if with and
        ; if (bool1 and bool2) {print(a)} else {print(b)}
        cmp bool1, 1b
        je c1
        jmp c3  

        c1:
            cmp bool2, 1b
            je c2
            jmp c3
        c2:
            printChar 'a'
            jmp c4
        c3:
            printChar 'b'
        c4:

        ; if with and (alternative)
        ; if (bool1 and bool2) {print(a)} else {print(b)}
        cmp bool1, 1b
        jne d1

        cmp bool2, 1b
        jne d1

        printChar 'a'
        jmp d2
         
        d1:
            printChar 'b'
        d2:

        .exit
    main ENDP
end main
