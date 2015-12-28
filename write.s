section .text
	global write

write:				;tell linker entry point
	push	ebp
	mov	ebp, esp

	push	ebx
	push	ecx
	push	edx
	
	mov	edx, [ebp + 16]	;message length
	mov	ecx, [ebp + 12]	;message to write
	mov	ebx, [ebp + 8]	;file descriptor (stdout)
	mov	eax, 4		;system call number (sys_write)
	int	0x80		;call kernel

	pop	edx
	pop	ecx
	pop	ebx
	jmp	my_exit

my_exit:
	leave			;on restaure
	ret			;et on quit