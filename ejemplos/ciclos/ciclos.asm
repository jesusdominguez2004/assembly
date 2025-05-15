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

        ; for
        ; for (5 times) {print(a)} : aaaaa
        xor si, si
        a1:
            cmp si, 5d
            je a2

            printChar 'a'
            inc si
            jmp a1
        a2:

        ; while
        ; while (bool1; cont<=5) {print(a)} : aaaaa
        mov bool1, 1b
        xor si, si
        b1:
            cmp bool1, 1b
            jne b4

            printChar 'a'

            cmp si, 4d
            je b2
            jmp b3

            b2:
                mov bool1, 0b
            b3: 

            inc si
            jmp b1
        b4:

        ; while with break
        ; while (bool1; cont != 4) {print(a)} : aaaaa
        xor si, si
        c1:  
            printChar 'z'

            cmp si, 4d
            je c2
            jmp c3

            c2:
                jmp c4
            c3:
            
            inc si
            jmp c1
        c4:

        ; while with break & continue
        ; while (bool1; cont != 4) {print(a); print(b) if cont == 3} : aaba
        xor si, si
        d1:  
            inc si

            cmp si, 3d
            je d2
            jmp d3

            d2:
                printChar 'b'
                jmp d1
            d3:
            
            printChar 'a'

            cmp si, 4d
            je d4
            jmp d5

            d4:
                jmp d6
            d5:
            
            jmp d1
        d6:

    main ENDP
end main
