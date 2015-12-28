section .text
	global strchr

strchr:
	push	ebp		;convention
	mov	ebp, esp	;convention

	push	ebx
	push	ecx

	mov	eax, [ebp + 8]	;recup les arguments
	mov	ebx, [ebp + 12]	;2e arg
	cmp	dword eax, 0	; si ptr null
	je	my_strchr_fail	;

my_strchr_loop:
	cmp	byte [eax], 0	;on check le char null
	je	my_strchr_fail	; si oui on quit
	movzx	ecx, byte[eax]	;on cp le char pointe par eax en l'etendant avec des 0 pour en faire un 32bits
	cmp	ecx, ebx	; on cmp ebx (le char que l'on cherche) avec ce que l'on vient de mettre dans ecx
	je	my_strchr_win	; on quit si = 
	inc	eax		;sinon on inc eax
	jmp	my_strchr_loop	; et on repart dans la boucle

my_strchr_win:
	pop	ecx
	pop	ebx
	jmp	my_exit

my_strchr_fail:
	pop	ebx
	pop	ebx
	xor	eax, eax
	jmp	my_exit

my_exit:
	leave
	ret