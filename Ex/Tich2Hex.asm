.model small
.stack 100h
.data
tb1 db "Nhap so Hex thu nhat:$"
tb2 db 10,13,"Nhap so hex thu hai:$"
tb3 db 10,13,"Tich 2 so hex la:$"
x dw ?
y dw ?
z dw ?
t dw ?
.code
main proc 
    mov ax,@data
    mov ds,ax
    ;nhap so thu nhat
    mov ah,9
    lea dx,tb1
    int 21h
    call nhap_hex
    mov ax,x
    mov z,ax
    ;nhap so thu hai
    mov ah,9
    lea dx,tb2
    int 21h
    call nhap_hex
    mov ax,x
    mov t,ax
    ;tinh tich
    mov ax,z
    mul t
    mov x,ax
    ;hien thi
    mov ah,9
    lea dx,tb3
    int 21h
    call hthi_dec
    ;Ket thuc
    mov ah,4ch
    int 21h
main endp
    ;He Hexa
nhap_hex proc
    mov x,0
    mov y,0
    mov bx,16
nhap3:
    mov ah,1
    int 21h
    cmp al,13
    je thoat3
    cmp al,39h
    ja nhapchu
    sub al,30h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp nhap3
nhapchu:
    sub al,37h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp nhap3
thoat3:
    ret
nhap_hex endp
    ;>>>>>>>>>
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