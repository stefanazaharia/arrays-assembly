.model small
.stack 200h
.data
	
	s db 1, 5, 3, 8, 2, 9
	l equ $-s
	d1 db ?
	d2 db ?

.code
start:

	mov ax,@data
	mov ds,ax
	
	mov cx, l  ;cazul cel mai fav cand lungimea sirului este 0
	jcxz Final
	
	mov si,0
	mov di,0
	
	repeta_par:
		mov al,s[si]   ;mutam in al val lui s
		mov bl,al      ;mutam in bl pe al pt ca se modif bl
		
		and bl,01h    ;verificam daca e par
		
		jz este_par
		
			jmp dupa_if
			
		este_par:
		mov d1[di],al    ;in d1 il adaugam pe al
		inc di     ;incrementam di doar daca e par
		
		dupa_if:
		inc si    ;incrementam si
	loop repeta_par
	
	mov si,0    ;reinitializam 
	mov di,1
	mov cx,l
	
	repeta_impar:
		mov al,s[si]
		mov bl,al
		
		and bl,01h  ;verificam daca este impar
		
		jnz este_impar
		
			jmp dupa_if2
			
		este_impar:
		mov d2[di],al
		inc di
		
		dupa_if2:
		inc si
	loop repeta_impar
	
	Final:
	
	mov ah,4ch
	int 21h
	
end