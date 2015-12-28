section	.text
	global strncmp

strncmp:
	push ebp
	mov ebp, esp
	push ebx
	push ecx
	push edx
	push esi
	
	mov eax, [ebp + 8]
	mov ebx, [ebp + 12]
	mov esi, [ebp + 16]
	xor ecx, ecx		;initialise la variable ecx a 0
	xor edx, edx		;initialise la variable edx a 0
	cmp dword eax, 0
	je _null
	cmp dword ebx, 0
	je _null
	
_start:
	cmp esi, 0		;verifie si esi n'est pas egale a 0
	je _end
	mov ecx, [eax]		;place le caractere eax dans ecx
	and ecx, 255		;permet de gerer les nombres signes
	mov edx, [ebx]
	and edx, 255
	sub ecx, edx		;je soustraie les 2 int pour les comparer
	cmp byte [eax], 0	;si jamais je suis au bout de la chaine de eax...
	je _end			;...j'appel _end
	cmp byte [ebx], 0	;meme chose qu'au dessus
	je _end
	cmp ecx, 0		;si jamais ecx = 0 je continue ma boucle sinon j'appel _end
	jne _end
	inc eax
	inc ebx
	dec esi
	jmp _start

_end:
	mov eax, ecx		;je move ecx dans eax pour pouvoir le retourner
	cmp eax, 0		;je verifie si eax est superieur a 0 ...
	jg _zero		;j'appel _zero
	cmp eax, 0		;meme chose qu'au dessus
	jl _zero_neg
	pop edx
	pop ecx
	pop ebx
	leave
	ret

_zero:
	mov eax, 1		;je move 1 dans eax car strcmp renvoie 1 et non la difference entre les 2 caracteres/
	pop edx
	pop ecx
	pop ebx
	pop esi
	leave
	ret

_zero_neg:
	mov eax, -1		;je move -1 dans eax pour renvoyer la bonne valeur
	pop edx
	pop ecx
	pop ebx
	pop esi
	leave
	ret

_null:
	mov eax, 0
	pop edx
	pop ecx
	pop ebx
	pop esi
	leave
	ret