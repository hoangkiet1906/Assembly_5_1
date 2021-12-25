.model small
.stack 100h
.data
tb1 db 10,13,"Hien thi nhi phan:$"
tb2 db 10,13,"Hien thi thap phan:$"
tb3 db 10,13,"Hien thi hexa:$"
x dw ?
.code
main proc
    mov ax,@data
    mov ds,ax 
    ;Tinh tong
    mov bx,1
    mov ax,2
tinh:
    add bx,ax
    inc ax
    cmp ax,255
    jna tinh
    mov x,bx
    ;Hien thi nhi phan
    mov ah,9
    lea dx,tb1
    int 21h
    call hthi_bin
    ;Hien thi thap phan
    mov ah,9
    lea dx,tb2
    int 21h
    call hthi_dec
    ;Hien thi hexa
    mov ah,9
    lea dx,tb1
    int 21h
    call hthi_hex
    ;Ket thuc
    mov ah,4ch
    int 21h
main endp    
    ;hien thi bin 
hthi_bin proc
    mov bx,2
    mov ax,x
    mov cx,0
chia1:
    mov dx,0
    div bx
    inc cx
    push dx
    cmp al,0
    je ht1
    jmp chia1
ht1:
    pop dx 
    add dl,30h
    mov ah,2
    int 21h
    dec cx
    cmp cx,0
    jne ht1
    ret
hthi_bin endp
    ;hien thi hex 
hthi_hex proc
    mov bx,16
    mov ax,x
    mov cx,0
chia3:
    mov dx,0
    div bx
    inc cx
    push dx
    cmp al,0
    je ht3
    jmp chia3
ht3:
    pop dx
    cmp dl,9h
    ja chu 
    add dl,30h
    mov ah,2
    int 21h
    dec cx
    cmp cx,0
    jne ht3
    ret
chu:
    add dl,37h
    mov ah,2
    int 21h
    dec cx
    cmp cx,0
    jne ht3
    ret
hthi_hex endp
    ;hien thi dec 
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