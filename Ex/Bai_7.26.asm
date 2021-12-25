.model small
.stack 100h
.data
tb1 db "Nhap so co 2 chu so thu nhat:$"
tb2 db 10,13,"Nhap so co 2 chu so thu hai:$"
tb3 db 10,13,"Tong 2 so la:$"
.code
main proc
    mov ax,@data
    mov ds,ax
    ;so thu nhat
    mov ah,9
    lea dx,tb1
    int 21h
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
    mov ah,0
    push ax
    ;so thu hai
    mov ah,9
    lea dx,tb2
    int 21h
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
    mov ah,0
    ;tinh tong
    pop bx
    add bx,ax
    ;hien thi tong
    mov ah,9
    lea dx,tb3
    int 21h
    mov cx,0
chia:
    mov dx,0
    mov ax,bx
    mov bx,10
    div bx
    mov bx,dx
    push bx
    mov bx,ax
    inc cx
    cmp ax,0
    jne chia
tip:
    pop dx
    add dx,30h
    mov ah,2
    int 21h 
    loop tip 
    mov ah,4ch
    int 21h
end main