section .text
	global rindex

rindex:
	push 	ebp		;convention
	mov	ebp, esp	;convention

	push	ebx
	push	ecx
	push	edx
	
	mov	eax, [ebp + 8]
	mov	ebx, [ebp + 12]
	xor	ecx, ecx
	cmp	dword eax, 0	;verifie le ptr null du char *S
	je	my_rindex_end

my_rindex_loop:
	cmp	byte [eax], 0	;on check le char null
	je	my_rindex_end
	movzx	edx, byte[eax]	;on cp le char pointe par eax en l'etendant avec des 0
	cmp	edx, ebx	; on cmp ebx (le char que l'on cherche)
	je	my_rindex_save	
	inc	eax		;on deplace le ptr
	jmp	my_rindex_loop	; on retourne dans la boucle

my_rindex_save:	
	mov	ecx, eax	; on sauvegarde le ptr
	inc	eax		; on incremente le ptr
	jmp	my_rindex_loop	; on retourne dans la boucle

my_rindex_end:
	mov	eax, ecx	;on recupere le bon ptr
	pop	edx
	pop	ecx
	pop	ebx
	jmp	my_exit		;on quit

my_exit:
	leave
	ret
