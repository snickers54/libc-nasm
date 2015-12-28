section .text
	global read

read:
	push ebp
	mov ebp, esp

	mov edx, [ebp + 16]
	mov ecx, [ebp + 12]
	mov ebx, [ebp + 8]
	mov eax, 3
	int 80h
	leave
	ret