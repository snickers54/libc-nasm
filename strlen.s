section .text
	global strlen

strlen:
	push	ebp 		;convention
	mov	ebp, esp	;convention

	push	ebx

	mov	ebx, [ebp + 8]	;on recupere notre argument
	xor	eax, eax	;init de eax
	cmp	dword ebx, 0
	je	my_strlen_exit

my_strlen_loop:
	inc	ebx		;incremente le pointeur du str
	inc	eax		;incremente l'incrementeur
	cmp 	byte [ebx], 0	; compare le char correspondant au pointeur ebx a 0
	jne	my_strlen_loop	; si ce n'est pas egal a 0 on rappel my_strlen_loop
	jmp	my_strlen_exit		; on appel my_exit

my_strlen_exit:
	pop	ebx
	jmp	my_exit

my_exit:
	leave
	ret
