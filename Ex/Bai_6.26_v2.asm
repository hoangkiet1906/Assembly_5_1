.model small
.stack 100h
.data
tb1 db "Nhap so thu nhat:$"
tb2 db 10,13,"Nhap so thu hai:$"
tb3 db 10,13,"Tong 2 so la:$" 
x dw ?
y dw ?
.code
main proc 
    mov ax,@data
    mov ds,ax
    ;nhap so thu nhat
    mov ah,9
    lea dx,tb1
    int 21h
    mov ah,1
    int 21h
    and ax,0fh
    push ax
    ;nhap so thu hai
    mov ah,9
    lea dx,tb2
    int 21h
    mov ah,1
    int 21h
    and ax,0fh
    ;Tinh tong
    pop bx
    add bx,ax
    mov x,bx
    ;hien thi tong
    mov ah,9
    lea dx,tb3
    int 21h
    call hthi_dec
    ;Ket thuc
    mov ah,4ch
    int 21h 
main endp
    ;Ham con hien thi thap phan
hthi_dec proc
    mov bx,10
    mov ax,x
    mov cx,0
chia:
    mov dx,0
    div bx
    inc cx
    push dx
    cmp al,0
    je ht
    jmp chia
ht:
    pop dx 
    add dl,30h
    mov ah,2
    int 21h
    dec cx
    cmp cx,0
    jne ht
    ret
hthi_dec endp
end main