BITS 16
stage2:

cli
lgdt [gdt_desc]

mov eax, cr0
or al, 1
mov cr0, eax

jmp CODE:0x9500

times 512-($-stage2) db 0

; sector 3

BITS 32

pm:
	mov ax, DATA
	mov ds, ax
	mov ss, ax

	mov byte [0x0B8000], 'P'
	mov byte [0x0B8001], 0x1B
	
	mov al, test_str
	call prot_print
	
	
	jmp $
test_str db "test", 0
%include "prot/print.asm"