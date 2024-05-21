.model small
.stack 200h
.data

	s1 db 'Introduceti sirul: ', 0dh, 0ah, '$'
	sir db 10 dup (?)
	
	
.code
start:

	mov ax, @data
	mov ds, ax
	
	mov ah, 09h    ;afisare Introduceti sir
	mov dx, offset s1
	int 21h
	
	mov ah, 0Ah
	mov dx, offset sir   ;citim sir de la tastatura
	int 21h
	
	mov si, 2   ;index si care porneste de la 2
	
	pare:
		mov al, sir[si];
	
		cmp al, 13d    ;comparam litera cu enter
		jz Final
		
		mov ah, 02h   ;afisare caracter
		mov dl, al
		int 21h
		
		inc si     ;crestem si cu 2
		inc si
	
	jmp pare
	
	Final:

	mov ah, 4ch
	int 21h

end