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
z dw ?
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
    mov ah,4ch
    int 21h
main endp 

nhap_dec proc
    mov x,0
    mov y,0
    mov bx,10
nhap:
    mov ah,1
    int 21h
    cmp al,13
    je thoat 
    cmp al,"-"
    je soam
    sub al,30h
    xor ah,ah
    mov y,ax
    mov ax,x
    mul bx
    add ax,y
    mov x,ax
    jmp nhap 
soam:
    xor ah,ah
    mov z,ax 
    jmp nhap
thoat:
    ret
nhap_dec endp
    ;>>>>>>>>>
hthi_dec proc
    cmp z,"-"
    je dautru
tiep:
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
     
dautru: 
    mov z,0
    mov ah,2
    mov dx,2Dh
    int 21h
    jmp tiep
hthi_dec endp