section .text
	global memmove

memmove:
	push ebp
	mov ebp, esp
	push ebx
	push ecx
	push edx
	push esi

	xor esi, esi		;initialise la variable esi a 0
	mov eax, [ebp + 8]
	mov ebx, [ebp + 12]
	mov ecx, [ebp + 16]

	push eax
	cmp ecx, 0 		;je compare si ecx egale 0
	jbe _end		;si jemais c'est inferieur ou egale a 0
	cmp dword eax, 0	;verification de la valeur null
	je _end
	cmp dword ebx, 0	;verification de la valeur null
	je _end
	cmp eax, ebx		;si le pointeur de eax < ebx, j'appel _loop1
	jl _loop1

_init_loop2:
	mov esi, ecx		;j'attribue ecx a esi
	jmp _loop2

_loop1:
	mov dl, byte [ebx + esi] ;je copie caractere par caractere dans ces 2 lignes
	mov byte [eax + esi], dl

	inc esi			;j'incremente esi
	cmp byte [ebx + esi], 0	;je verifie si je ne suis pas a la fin de ma chaine
	je _end
	jmp _loop1		;je boucle

_loop2:
	dec esi			;je decremente esi
	mov dl, byte [ebx + esi] ;je copie caractere par caractere
	mov byte [eax + esi], dl

	cmp esi, 0		;je verifie si esi est pas egale a 0
	je _end
	jmp _loop2
	
_end:
	pop eax
	pop edx
	pop ecx
	pop ebx
	leave
	ret