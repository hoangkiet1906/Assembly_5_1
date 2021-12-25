.model small
.stack 100h
.data
.code
main proc
    ;hang chuc
    mov ah,1
    int 21h
    sub ax,30h
    mov bx,ax
    mov ax,10
    mul bx
    mov bx,ax
    ;hang dv
    mov ah,1
    int 21h
    sub ax,30h
    add ax,bx
    mov ah,4ch
    int 21h
end main