section .text
	global strcpy

strcpy:
	push ebp
	mov ebp, esp
	push ebx

	mov eax, [ebp + 8]	;je recupere les arguments
	mov ebx, [ebp + 12]
	push eax 		;je push mon eax pour pouvoir l'utiliser ensuite
	cmp dword eax, 0
	je _end
	cmp dword ebx, 0
	je _end
	
_start:
	cmp byte [ebx], 0
	je _end
	mov dl, byte [ebx]	;je copie un caractere dans dl
	mov byte [eax], dl	;je le place ensuite dans ma chaine eax
	inc eax			;je passe au caractere suivant
	inc ebx			;je passe au caractere suivant
	jmp _start		;je rappel en boucle _start si c'est pas le cas
	
_end:
	pop eax
	pop ebx
	leave
	ret
