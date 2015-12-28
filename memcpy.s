section .text
	global memcpy

memcpy:
	push ebp
	mov ebp, esp		;convention

	push ebx		; sauvegarde des registre que l'on va utiliser
	push ecx
	push edx
	push esi

	xor esi, esi		;mise a zero de esi
	mov eax, [ebp + 8]	; recuperation des parametres
	mov ebx, [ebp + 12]
	mov ecx, [ebp + 16]

	push eax
	cmp ecx, 0 		;je compare si ecx egale 0
	jbe _end		;si jemais c'est inferieur ou egale a 0
	cmp dword eax, 0	;je verifie la valeur null
	je _end
	cmp dword ebx, 0	;je verifie la valeur null
	je _end
	cmp eax, ebx		;je verifie si les pointeur ont egaux
	jl _loop1

_init_loop2:
	mov esi, ecx
	jmp _loop2

_loop1:
	mov dl, byte [ebx + esi] ;je copie caractere par caractere
	mov byte [eax + esi], dl

	inc esi
	cmp byte [ebx + esi], 0
	je _end
	jmp _loop1

_loop2:
	dec esi
	mov dl, byte [ebx + esi] ;je copie caractere par caractere
	mov byte [eax + esi], dl

	cmp esi, 0
	je _end
	jmp _loop2
	
_end:
	pop eax
	pop edx
	pop ecx
	pop ebx
	leave
	ret