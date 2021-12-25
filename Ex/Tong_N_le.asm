.model small
.stack 100h
.data 
tb1 db 10,13,"Nhap so N le:$" 
tb2 db 10,13,"Tong la:$"
x dw ?
y dw ?
.code
main proc
    mov ax,@data
    mov ds,ax 
nhap:
    mov ah,9
    lea dx,tb1
    int 21h 
    call nhap_dec
    ;Kiem tra N le
    mov bx,2
    xor dx,dx
    mov ax,x
    div bx
    cmp dx,0
    je nhap 
    ;Tinh tong
    mov bx,1
    mov ax,3
tinh:
    add bx,ax
    add ax,2
    cmp ax,x
    jna tinh
    ;Hien thi
    mov ah,9
    lea dx,tb2
    int 21h
    mov x,bx 
    call hthi_oct
    ;Ket thuc
    mov ah,4ch
    int 21h    
main endp
    ;>>>>>>>>>>
nhap_dec proc
    mov x,0
    mov y,0
    mov bx,10
nhap1:
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
    jmp nhap1
thoat:
    ret
nhap_dec endp
    ;>>>>>>>>>>
hthi_oct proc
    mov bx,8
    mov ax,x
    mov cx,0
chia2:
    mov dx,0
    div bx
    inc cx
    push dx
    cmp al,0
    je ht2
    jmp chia2
ht2:
    pop dx 
    add dl,30h
    mov ah,2
    int 21h
    dec cx
    cmp cx,0
    jne ht2
    ret
hthi_oct endp
end main