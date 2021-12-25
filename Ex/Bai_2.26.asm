.model small
.stack 100h
.data
tb1 db 10,13,"Hien thi nhi phan:$"
tb2 db 10,13,"Hien thi thap phan:$"
tb3 db 10,13,"Hien thi hexa:$"
.code
main proc
    mov ax,@data
    mov ds,ax 
    mov bx,1
    mov ax,2
tinh:
    add bx,ax
    inc ax
    cmp ax,255
    jna tinh
    push bx
    ;hien thi bin 
    mov cx,16
    mov ah,9
    lea dx,tb1
    int 21h
bin:
    shl bx,1
    jc in2
    mov ah,2
    mov dl,30h
    int 21h
    loop bin
    jmp hex
    in2:
    mov ah,2
    mov dl,31h
    int 21h
    loop bin
    ;hien thi hex 
hex:
    mov ah,9
    lea dx,tb3
    int 21h 
    mov cx,4 
    pop bx
    push bx
top:
    rol bx,4
    mov ax,bx
    and al,0Fh
    cmp al,9h
    ja chu
    add al,30h
    mov ah,2
    mov dl,al 
    int 21h
    loop top
    jmp tp
    chu:
    add al,37h
    mov ah,2
    mov dl,al
    int 21h
    loop top
    ;hien thi dec 
tp:
    pop bx
    mov ah,9
    lea dx,tb2
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
main endp
end main