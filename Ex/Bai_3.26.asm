.model small
.stack 100h
.data 
tb1 db "Nhap 1 so trong khoang 0~9:$"
tb2 db 10,13,"Ket qua giai thua la:$"
.code               
main proc
    mov ax,@data
    mov ds,ax
    mov ah,9
    lea dx,tb1
    int 21h
    mov ah,1
    int 21h
    cmp al,31h
    je gt
    and ax,0fh
    mov cx,ax
    sub cx,1
tinh:
    mul cx
    dec cx
    cmp cx,0
    jne tinh
    mov bx,ax 
    ;hien thi
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
    jmp dos
gt:
    mov ah,9
    lea dx,tb2
    int 21h
    mov ah,2
    mov dl,31h
    int 21h
    dos:
    mov ah,4ch
    int 21h
main endp
end main
