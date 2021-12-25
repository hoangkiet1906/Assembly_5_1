.model small
.stack 100h
.data
b1 db 10,13,"$"
.code
main proc
    mov ax,@data
    mov ds,ax
    mov ah,1
    int 21h
    sub al,30h
    mov ah,0
    mov bl,al
    cmp al,1h
    ja t2 
    mov cx,5
    t1:
    mov ah,1
    int 21h
    mov ah,0
    sub al,30h
    shl bx,3
    or bx,ax
    loop t1
    jmp l1
    t2:
    mov cx,4
    t22:
    mov ah,1
    int 21h
    mov ah,0
    sub al,30h
    shl bx,3
    or bx,ax
    loop t22
    jmp l2
    ;Hien thi
    l1:
    mov ah,9
    lea dx,b1
    int 21h
    rol bx,1
    mov ah,2
    mov dl,bl
    and dl,1h
    add dl,30h
    int 21h
    mov cx,5
    l11:
    rol bx,3
    mov ah,2
    mov dl,bl
    and dl,7h
    add dl,30h
    int 21h
    loop l11
    jmp dos
      l2: 
    mov ah,9
    lea dx,b1
    int 21h
    rol bx,4
    mov ah,2
    mov dl,bl
    and dl,0fh
    add dl,30h
    int 21h
    mov cx,4
    l22:
    rol bx,3
    mov ah,2
    mov dl,bl
    and dl,7h
    add dl,30h
    int 21h
    loop l22
    dos:
    mov ah,4ch
    int 21h
main endp
end main  