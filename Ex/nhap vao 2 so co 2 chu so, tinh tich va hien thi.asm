.model small
.stack 100h
.data
b1 db 10,13,"nhap so chia:$"
b2 db 10,13,"nhap so bi chia:$"
b3 db 10,13,"tich la:$"
.code
main proc
        mov ax,@data
        mov ds,ax
        
        mov ah,9
        lea dx,b1
        int 21h
        
        lap: 
        ;hang chuc
        mov ah,1
        int 21h
        
        sub al,30h
        mov ah,0
        mov bx,ax
        mov ax,10
        mul bx
        mov bx,ax
       ;hang don vi 
        mov ah,1
        int 21h
        
        sub al,30h
        mov ah,0
        
        add bx,ax
        
        mov ah,9
        lea dx,b2
        int 21h
        
        lap1: 
        ;hang chuc
        mov ah,1
        int 21h
        
        sub al,30h
        mov ah,0
        mov cx,ax
        mov ax,10
        mul cx
        mov cx,ax
       ;hang don vi 
        mov ah,1
        int 21h
        
        sub al,30h
        mov ah,0
        
        add ax,cx 
        ;tich
        mul bx
        mov bx,ax
        
        mov ah,9
        lea dx,b3
        int 21h
        
        mov ax,bx
        mov cx,10
        mov bx,0 
        mov dx,0
        chia:
        div cx
        push dx
        inc bx
        mov dx,0
        cmp ax,0
        jne chia
        
        mov ah,2
        mov cx,bx
        ht:
        pop dx
        add dx,30h
        int 21h
        loop ht 
        
        mov ah,4ch
        int 21h
        
        main endp
end main