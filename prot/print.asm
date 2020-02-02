prot_print:
	push ebx
	mov ebx, 0x0B8000
	
	.loop:
		cmp al, 0x0
		je .end
		
		mov [ebx], al
		inc al
		add dword [ebx], 2
		jmp .loop
	.end:
		pop ebx
		ret