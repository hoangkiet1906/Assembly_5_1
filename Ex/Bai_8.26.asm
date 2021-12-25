.model small
.stack 100h
.data
tb1 db "Nhap so co 2 chu so thu nhat:$"
tb2 db 10,13,"Nhap so co 2 chu so thu hai:$"
tb3 db 10,13,"Phan nguyen:$"
tb4 db 10,13,"Phan du:$"
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
    add bx,ax
    mov bh,0
    ;tinh thuong
    pop ax
    div bx
    mov cl,dl
    mov bl,al
    ;hien thi phan nguyen
    mov ah,9
    lea dx,tb3
    int 21h
    add bl,30h
    mov ah,2
    mov dl,bl
    int 21h
    ;hien thi phan du
    mov ah,9
    lea dx,tb4
    int 21h
    mov ah,2 
    add cl,30h
    mov dl,cl
    int 21h
    mov ah,4ch
    int 21h
main endp
end main