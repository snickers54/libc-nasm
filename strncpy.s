section .text
	global strncpy

strncpy:
	push ebp
	mov ebp, esp
	push ebx
	push ecx
	push edx

	mov eax, [ebp + 8]	;je recupere les arguments
	mov ebx, [ebp + 12]
	mov ecx, [ebp + 16]
	push eax 		;je push mon eax pour pouvoir l'utiliser ensuite
	cmp ecx, 0		;je verifie si le nombre de caractere a copier n'est pas 0
	je _end
	cmp dword eax, 0
	je _end
	cmp dword ebx, 0
	je _end
	
_start:
	mov dl, byte [ebx]	;je copie un caractere dans dl
	mov byte [eax], dl	;je le place ensuite dans ma chaine eax
	inc eax			;je passe au caractere suivant
	inc ebx			;je passe au caractere suivant
	sub ecx, 1		;je decremente le nombre de caractere a copier

	cmp ecx, 0		;je verifie si le nombre de caractere est toujours bon
	je _end			;j'appel _end si c'est le pas le cas

	cmp ebx, 0		;je verifie que je ne suis pas a la fin de ma chaine
	jne _start		;je rappel en boucle _start si c'est pas le cas
	
_end:
	pop eax
	pop edx
	pop ecx
	pop ebx
	leave
	ret
