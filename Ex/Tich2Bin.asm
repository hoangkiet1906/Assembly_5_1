.model small
.stack 100h
.data
tb db 10,13,"Nhap so nhi phan thu nhat:$"
tb1 db 10,13,"Nhap so nhi phan thu hai:$"
tb2 db 10,13,"Tich la:$"
x dw ?
y dw ?
b1 dw ?
.code
main proc
    mov ax,@data
    mov ds,ax 
    ;Nhap so thu nhat
    mov ah,9
    lea dx,tb
    int 21h
    call nhap_bin
    mov ax,x
    mov b1,ax
    ;Nhap so thu hai
nhap2:
    mov ah,9
    lea dx,tb1
    int 21h
    call nhap_bin
    mov ax,x
    cmp ax,b1
    je nhap2
    ;Tinh tich
    mul b1
    mov x,ax
    ;Hien thi tich
    mov ah,9
    lea dx,tb2
    int 21h
    call hthi_dec
    ;Ket thuc
    mov ah,4ch
    int 21h 
main endp 
    ;Nhap nhi phan
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
    ;Hien thi thap phan
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