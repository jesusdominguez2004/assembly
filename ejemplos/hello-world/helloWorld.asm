.model small
.stack

.data
    msg db 'Hello World!$'

.code
    main PROC

    MOV ax, @data
    MOV ds, ax
    XOR ax, ax

    MOV dx, offset msg
    MOV ah, 9
    int 21h

    .exit
    main ENDP

end main
