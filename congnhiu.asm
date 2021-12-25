.model small
.stack 100h
.data       
;tao cac thong bao
tb1 db "Nhap so thu nhat:$"
tb3 db 10,13,"Tong la:$"  
;khoi tao cac bien
x dw ?
z dw ?
t dw ?
.code
main proc     
    
    mov ax,@data
    mov ds,ax   
    mov cx,5
    ;so thu nhat 
TinhTong:
    mov ah,9
    lea dx,tb1
    int 21h
    call nhap_dec 
    add ax,x 
    mov x,ax
    loop TinhTong
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