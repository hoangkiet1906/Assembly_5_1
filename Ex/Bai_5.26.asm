.model small
.stack 100h
.data
tb1 db "Nhap so Hex thu nhat:$"
tb2 db 10,13,"Nhap so hex thu hai:$"
tb3 db 10,13,"Tich 2 so hex la:$"
.code
main proc 
    mov ax,@data
    mov ds,ax
    ;nhap so thu nhat
    mov ah,9
    lea dx,tb1
    int 21h
    xor bx,bx
    mov dh,4
    t1:
    mov ah,1
    int 21h
    sub al,30h
    cmp al,9h
    jng t2
    sub al,07h
    t2:
    mov cl,4
    shl bx,cl
    or bl,al
    dec dh
    jnz t1
    push bx
    ;nhap so thu hai
    mov ah,9
    lea dx,tb2
    int 21h
    xor bx,bx
    mov dh,4
    t12:
    mov ah,1
    int 21h
    sub al,30h
    cmp al,9h
    jng t22
    sub al,07h
    t22:
    mov cl,4
    shl bx,cl
    or bl,al
    dec dh
    jnz t12
    push bx
    ;tinh tich
    pop bx
    pop ax
    mul bx
    mov bx,ax
    ;hien thi
    mov ah,9
    lea dx,tb3
    int 21h
    mov dh,4
    mov ah,2
    mov cl,4
    l1:
    rol bx,cl
    mov dl,bl
    and dl,0fh
    add dl,30h
    cmp dl,39h
    jng l2
    add dl,7h
    l2:
    int 21h
    dec dh
    jnz l1 
    mov ah,4ch
    int 21h
main endp
end main