.model small
.stack 100h
.data
tb db 10,13,"Nhap so thap phan thu nhat:$"
tb1 db 10,13,"Nhap so thap phan thu hai:$"
tb3 db 10,13,"Nhap so thap phan thu ba:$"
tb2 db 10,13,"Tong la:$"
x dw ?
y dw ?
d1 dw ?
d2 dw ?
.code
main proc
    mov ax,@data
    mov ds,ax 
    ;Nhap so thu nhat
    mov ah,9
    lea dx,tb
    int 21h
    call nhap_dec
    mov ax,x
    mov d1,ax
    ;Nhap so thu hai
nhap2:
    mov ah,9
    lea dx,tb1
    int 21h
    call nhap_dec
    mov ax,x
    cmp ax,d1
    je nhap2
    mov d2,ax
    ;Nhap so thu ba
nhap3:
    mov ah,9
    lea dx,tb3
    int 21h
    call nhap_dec
    mov ax,x
    cmp ax,d1
    je nhap3
    cmp ax,d2
    je nhap3
    ;Tinh tong
    add ax,d2
    add ax,d1
    mov x,ax
    ;Hien thi tong
    mov ah,9
    lea dx,tb2
    int 21h
    call hthi_hex 
    ;Ket thuc
    mov ah,4ch
    int 21h
main endp
     ;>>>>>>>>>>>>
nhap_dec proc
    mov x,0
    mov y,0
    mov bx,10
nhap:
    mov ah,1
    int 21h
    cmp al,13
    je thoat
    sub al,30h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp nhap
thoat:
    ret
nhap_dec endp
    ;>>>>>>>>>>>>
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
end main