; file is 512 bytes
BITS 16
org 0x7C00

main:
	mov ah, 0xE
	mov al, 0xA
	int 0x10
	
	mov si, epic
	call print
	
	xor ax, ax
	mov ds, ax
	lgdt [gdt_desc]
	
	mov eax, cr0
	or eax, 0b00000001
	mov cr0, eax
		
	jmp gdt_end - gdt_code:pm

print:
	mov ah, 0xE
	
	.loop:
		lodsb
		cmp al, 0x0
		je .end
		
		int 0x10
		
		jmp .loop

	.end:
		ret

epic db "Hello World!", 0xA, 0


%include "gdt.asm"

BITS 32

pm:
	mov byte [0x0B8000], 'P'
	mov byte [0x0B8001], 0x1B
	jmp $

BITS 16

times 510-($-$$) db 0

dw 0xAA55

