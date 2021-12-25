.model small
.stack 100h
.data      
tb1 db 10,13,"Nhap 1 ki tu:$"
tb2 db 10,13,"Ki tu vua nhap la:$"
tb3 db 10,13,"Nhap khong dung!!$"
.code
main proc
    mov ax,@data
    mov ds,ax
    nhap:
    mov ah,9
    lea dx,tb1
    int 21h
    mov ah,1
    int 21h 
    mov bl,al
    cmp bl,61h
    jne tip1
    mov ah,9
    lea dx,tb2
    int 21h
    mov ah,2
    mov dl,bl
    int 21h
    jmp dos
    tip1:
    cmp bl,41h
    jne tip2
    mov ah,9
    lea dx,tb2
    int 21h
    mov ah,2
    mov dl,bl
    int 21h
    jmp dos
    tip2:
    mov ah,9
    lea dx,tb3
    int 21h
    jmp nhap
    dos:
    mov ah,4ch
    int 21h
main endp
end main