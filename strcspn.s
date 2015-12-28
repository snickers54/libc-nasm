section .text
	global strcspn

strcspn:
	push	ebp		;convention
	mov	ebp, esp	;convention

	push	ebx
	push	ecx
	push	edx
	push	esi
	push	edi

	mov	eax, [ebp + 8]	; recup
	mov	ebx, [ebp + 12]	;	les arguments
	mov	ecx, ebx	; je sauvegarde le ptr de ebx dans ecx pour pouvoir y revenir a chaque tour de boucle
	xor	esi, esi	; on init le compteur
	cmp	dword eax, 0	; on check le ptr null sur eax
	je	my_strcspn_exit	;
	cmp	dword ebx, 0	; on check le ptr null sur ebx
	je	my_strcspn_exit
	jmp	my_strcspn_loop

my_strcspn_loop_start:
	inc	ecx
my_strcspn_loop:
	cmp	byte [eax], 0	; on check le char null
	je	my_strcspn_exit	;
	cmp	byte [ecx], 0	; on check le char null
	je	my_strcspn_next
	movzx	edx, byte [eax]
	movzx	edi, byte [ecx]
	cmp	edx, edi	;on compare les caracteres
	jne	my_strcspn_loop_start
	jmp	my_strcspn_exit

my_strcspn_next:
	inc	eax		; on incremente la valeur de eax
	inc	esi
	mov	ecx, ebx	; on recupere la valeur de ebx dans ecx
	jmp	my_strcspn_loop

my_strcspn_exit:
	mov	eax, esi	; on recupere la valeur de retour dans eax
	pop	edi		; on 
	pop	esi
	pop	edx
	pop	ecx
	pop	ebx
	jmp	my_exit

my_exit:
	leave
	ret