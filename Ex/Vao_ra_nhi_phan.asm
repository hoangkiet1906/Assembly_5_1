.model small
.stack 100h
.data
xd db 10,13,"$" 
tb1 db "Nhap so nhi phan:$"
tb2 db 10,13,"So nhi phan vua nhap la:$"
.code
main proc 
    mov ax,@data
    mov ds,ax
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
    mov ah,9
    lea dx,xd
    int 21h
    mov cx,16
    mov ah,9
    lea dx,tb2
    int 21h
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
end main