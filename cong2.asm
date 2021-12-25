.model small
.stack 100h
.data       
;tao cac thong bao
tb1 db "Nhap so thu nhat:$"
tb2 db 10,13,"Nhap so thu hai:$"
tb3 db 10,13,"Tong 2 so la:$"  
;khoi tao cac bien
x dw ?
y dw ?
z dw ?
t dw ?
.code
main proc
    mov ax,@data
    mov ds,ax
    ;so thu nhat
    mov ah,9
    lea dx,tb1
    int 21h
    call nhap_dec 
    mov ax,x
    mov z,ax
    ;so thu hai
    mov ah,9
    lea dx,tb2
    int 21h
    call nhap_dec
    mov ax,x
    mov t,ax
    ;tinh tong
    mov ax,z
    add ax,t 
    mov x,ax
    ;hien thi tong
    mov ah,9
    lea dx,tb3
    int 21h
    call hthi_dec 
    mov ah,4ch
    int 21h
main endp
    ;He thap phan
nhap_dec proc
    mov x,0
    mov y,0
    mov bx,10  
;ham nhap
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
end main