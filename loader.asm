[BITS 32]

global loader
global kill
extern k_main

section .text
align 4

MultiBootHeader:
	dd 0x1BADB002
	dd 3
	dd -(0x1BADB005)

loader:
	mov esp, (stack + 0x4000)
	mov ebp, esp
	push eax
	push ebx

	call k_main

kill:	
	cli
	
hang:
	hlt
	jmp hang

	
section .bss
align 4
stack:	
	resb 0x4000

	

