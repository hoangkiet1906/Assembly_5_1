.model small
.stack 100h
.data
tb1 db "Nhap so nhi phan thu nhat:$"
tb2 db 10,13,"Nhap so nhi phan thu hai:$"
tb3 db 10,13,"Tong nhi phan la:$"
.code
main proc
    mov ax,@data
    mov ds,ax
    ;so thu nhat
    mov cx,16
    mov ah,9
    lea dx,tb1
    int 21h
lap:
    mov ah,1
    int 21h
    and al,0fh 
    shl bx,1
    or bl,al
    loop lap
    push bx
    ;so thu hai
    mov cx,16
    mov ah,9
    lea dx,tb2
    int 21h
lap2:
    mov ah,1
    int 21h
    and al,0fh 
    shl bx,1
    or bl,al
    loop lap2 
    ;tinh tong 
    mov ah,9
    lea dx,tb3
    int 21h
    pop ax
    add bx,ax
    mov cx,16
tip:
    rcl bx,1
    jnc hthi0
    mov ah,2
    mov dl,31h
    int 21h
    jmp ht
hthi0:
    mov ah,2
    mov dl,30h
    int 21h
ht:    
    loop tip
    mov ah,4ch
    int 21h 
main endp
end main