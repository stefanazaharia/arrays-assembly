.radix 16
.model small
.stack 100h

.data
    sir db 'Care din urmatoarele registre folosite la adresare indirecta, implica segmentul de date?', 0d, 0a, '1. BX', 0d, 0a, '2. BP', 0d, 0a, '3. SI', 0d, 0a, '4. DI', 0d, 0a, '$'
    sirFinal1 db 'Corect $'
    sirFinal2 db 'Gresit! Este BX sau SI! $'
	
	; 0Dh,0Ah trece pe urmatorul rand 
	
.code 
start:

    mov ax, @data
    mov ds, ax

    mov ah, 09  ;09h este pentru citire
    mov dx, offset sir
    int 21h

    mov ah, 07  ;citire de la tastatura fara ecou
    int 21  ;caracterul este in al

    push ax  ;salvam valoarea lui al pt ca comparatia altereaza al
    cmp al, 31  ;comparam caracterul din al cu 1 care are codul ascii 31
    jz corect

    pop ax
    cmp al, 33  ;aducem din stiva pe al
    jz corect   ;comparam caracterul din al cu 3

    jmp gresit

    corect:
        mov ah, 09
        mov dx, offset sirFinal1
        int 21
        jmp final

    gresit:
        mov ah, 09
        mov dx, offset sirFinal2
        int 21

    final:
    mov ah, 4c
    int 21

end start