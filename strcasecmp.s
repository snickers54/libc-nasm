section .text
	global strcasecmp

strcasecmp:
	push	ebp		;convention
	mov	ebp, esp	;

	push	ebx		;on push pour preserver les registres de la fonction appelante
	push	esi
	push	edi

	mov	eax, [ebp + 8]	;on recupere les arguments
	mov	ebx, [ebp + 12]	;
	jmp	my_strcasecmp_insensitive ;on jump sur le prochain label

my_strcasecmp_insensitive:
	movzx	esi, byte [eax]	;on met dans les registres les 8 bits correspondant a notre char et en completant par des 0
	movzx	edi, byte [ebx] ; la meme
	cmp	edi, 65		;on cmp le char avec 65 (code ascii)
	jl	my_strcasecmp_insensitive_next ;si c'est plus petit osef le char n'est pas alphabetique
	cmp	edi, 90			       ;on cmp le char avec 90
	jg	my_strcasecmp_insensitive_next ;si > alors osef le char n'est pas alpha
	add	edi, 32			       ;sinon on le met en minuscule
	jmp	my_strcasecmp_insensitive_next ;on jump sur le prochain

my_strcasecmp_insensitive_next:	;pareil que la fonction d'au dessus mais pour esi
	cmp	esi, 65
	jl	my_strcasecmp_loop
	cmp	esi, 90
	jg	my_strcasecmp_loop
	add	esi, 32
	jmp	my_strcasecmp_loop

my_strcasecmp_loop:		;ici la boucle
	cmp	esi, edi	;on cmp les deux chars obtenus de l'insensitivex
	jne	my_strcasecmp_exit ;si != alors on quit
	inc	eax		   ;sinon on incremente les ptrs
	inc	ebx
	cmp	byte [eax], 0	;on verifie le char null
	je	my_strcasecmp_exit ;on quit si ca ne va pas
	cmp	byte [ebx], 0	   ;pareil
	je	my_strcasecmp_exit ;pareil
	jmp	my_strcasecmp_insensitive ;on rappel notre label insensitive pour le prochain char et rebelotte
	
my_strcasecmp_exit:
	mov	eax, esi	;lorsque l'on quitte on associe la valeur de esi dans eax
	sub	eax, edi	;on y soustrat edi
	pop	edi		;on pop pour restaurer les registres de la fonction appelante
	pop	esi
	pop	ebx
	jmp	my_exit		;on quit

my_exit:
	leave
	ret