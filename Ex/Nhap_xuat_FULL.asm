.model small
.stack 100h
.data
tb1 db "Nhap so thap phan 0~255:$"
tb2 db 10,13,"So vua nhap la:$"
tb3 db 10,13,"Nhap so nhi phan:$"
tb4 db 10,13,"Nhap so bat phan:$"
tb5 db 10,13,"Nhap so hexa:$"
x dw ?
y dw ?
.code
main proc
    mov ax,@data
    mov ds,ax
    ;He thap phan
    mov ah,9
    lea dx,tb1
    int 21h
    call nhap_dec
    mov ah,9
    lea dx,tb2
    int 21h
    call hthi_dec
    ;He nhi phan
    mov ah,9
    lea dx,tb3
    int 21h
    call nhap_bin
    mov ah,9
    lea dx,tb2
    int 21h
    call hthi_bin
    ;He bat phan
    mov ah,9
    lea dx,tb4
    int 21h
    call nhap_oct
    mov ah,9
    lea dx,tb2
    int 21h
    call hthi_oct
    ;He hexa
    mov ah,9
    lea dx,tb5
    int 21h
    call nhap_hex
    mov ah,9
    lea dx,tb2
    int 21h
    call hthi_hex
    mov ah,4ch
    int 21h
main endp 
    ;He thap phan
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
    ;He nhi phan
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
    ;He bat phan
nhap_oct proc
    mov x,0
    mov y,0
    mov bx,8
nhap2:
    mov ah,1
    int 21h
    cmp al,13
    je thoat2
    sub al,30h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp nhap2
thoat2:
    ret
nhap_oct endp
    ;>>>>>>>>>
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