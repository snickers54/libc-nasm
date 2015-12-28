section .text
	global memset

memset:
	push ebp
	mov ebp, esp
	push ebx
	push ecx

	mov eax, [ebp + 8]
	mov ebx, [ebp + 12]
	mov ecx, [ebp + 16]
	push eax
	cmp ecx, 0
	jle _end
	cmp eax, 0
	je _end

_start:
	mov [eax], bl		;je copie les premiers bit de ebx dans eax
	inc eax			;j'incremente eax
	loop _start		;j'utilise loop qui s'occupe de rappeler _start en faisant les verification necessaire

_end:
	pop eax
	pop ecx
	pop ebx
	leave
	ret
