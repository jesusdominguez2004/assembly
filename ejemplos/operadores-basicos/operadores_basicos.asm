.model small
.stack
.data
.code
    main PROC

        ; Suma (ADD)
        mov ax, 5d
        mov bx, 6d
        add ax, bx ; ax = ax + bx

        ; Resta (SUB)
        mov ax, 5d
        mov bx, 6d
        sub ax, bx ; ax = ax - bx

        ; Multiplicación (MUL)
        mov ax, 5d
        mov bx, 6d
        mul bx ; ax = ax * bx

        ; División (DIV)
        mov ax, 5d
        mov bx, 6d
        div bx ; ax = ax / bx

        ; /////////////

        ; Y (AND)
        mov ax, 11010110b 
        mov bx, 01011011b
        and ax, bx

        ; O (OR)
        mov ax, 11010110b 
        mov bx, 01011011b
        or ax, bx

        ; NO (NOT)
        mov ax, 11010110b 
        not ax

        ; O exclusiva (XOR)
        mov ax, 11010110b 
        mov bx, 01011011b
        or ax, bx

        ; extra: limpiar un registro usando XOR
        xor ax, ax

        .exit
    main ENDP
end main
