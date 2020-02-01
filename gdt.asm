gdt:

gdt_null:
	dq 0
	
gdt_code:
	dw 0xFFFF
	dw 0
	db 0
	;db 0b01011001
	db 0x9A	
	db 0b11001111
	db 0
	
gdt_data:
	dw 0xFFFF
	dw 0
	db 0
	db 0b10010010
	db 0b11001111
	db 0
gdt_end:

gdt_desc:
	db gdt_end - gdt
	dw gdt