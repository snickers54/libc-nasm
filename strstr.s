section .text
	global strstr

strstr:
	push	ebp		;convention
	mov	ebp, esp	;convention

	push	ebx
	push	ecx
	push	esi
	push	edi

	mov	eax, [ebp + 8]	;recup les arguments
	mov	ebx, [ebp + 12]	;2e arg
	mov	ecx, ebx	;on copie le pointeur de needle la chaine a trouver
	cmp	dword eax, 0	;cmp pointeur null
	je	my_strstr_fail	;si = 0 exit
	cmp	dword ebx, 0	;cmp pointeur null deuxieme chaine
	je	my_strstr_fail	;si = 0 exit

my_strstr_loop:
	mov	esi, eax
	mov	edi, ebx
	cmpsb
	je	my_strstr_find_loop ;si = 0 alors go chercher le mot
	inc	eax		    ;sinon incremente ptr eax
	cmp	byte [eax], 0	    ; cmp la valeur de eax avec \0
	je	my_strstr_fail	    ; si egal 0 alors exit
	jmp	my_strstr_loop
	
my_strstr_find_loop:
	mov	edx, eax	; on cp le ptr de debut de chaine qui match
my_strstr_find_ni_loop:	
	inc	eax		;incremente le ptr eax
	inc	ebx		;inc ptr eax
	cmp	byte [ebx], 0	;cmp du char de ebx avec \0
	je	my_strstr_win	;si = 0 alors on a trouve toute la chaine => win
	cmp	byte [eax], 0	;cmp du char de eax avec \0
	je	my_strstr_fail	; si = 0 my_exit
	mov	esi, eax
	mov	edi, ebx
	cmpsb
	je	my_strstr_find_ni_loop ;si == alors on reprend la boucle
	mov	ebx, ecx	;sinon on remet le ptr de debut de la chaine a trouver
	jmp	my_strstr_loop 	; et on repart dans la boucle

my_strstr_fail:	
	xor	eax, eax
	pop	edi
	pop	esi
	pop	ecx
	pop	ebx
	jmp	my_exit
	
my_strstr_win:
	mov	eax, edx	;on cp le ptr resultat
	pop	edi
	pop	esi
	pop	ecx
	pop	ebx
	jmp	my_exit		;on exit

my_exit:
	leave
	ret