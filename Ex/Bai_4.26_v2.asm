.model small
.stack 100h
.data
tb1 db "Nhap so nhi phan thu nhat:$"
tb2 db 10,13,"Nhap so nhi phan thu hai:$"
tb3 db 10,13,"Tong nhi phan la:$"
x dw ?
y dw ?
z dw ?
t dw ?
.code
main proc
    mov ax,@data
    mov ds,ax
    ;Nhap so thu nhat
    mov ah,9
    lea dx,tb1
    int 21h
    call nhap_bin
    mov ax,x
    mov z,ax
    ;Nhap so thu hai
    mov ah,9
    lea dx,tb2
    int 21h
    call nhap_bin
    mov ax,x
    mov t,ax
    ;Tinh tong
    mov ax,t
    add ax,z
    mov x,ax
    ;Hien thi tong
    mov ah,9
    lea dx,tb3
    int 21h
    call hthi_bin
    ;Ket thuc
    mov ah,4ch
    int 21h 
main endp
    ;Ham con nhap so
nhap_bin proc
    mov x,0
    mov y,0
    mov bx,2
nhap1:
    mov ah,1
    int 21h
    cmp al,13
    je thoat1
    sub al,30h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp nhap1
thoat1:
    ret
nhap_bin endp
    ;>>>>>>>>>
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
end main