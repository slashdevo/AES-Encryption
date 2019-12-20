; Assembly with  nasm -f elf AES-Encryption.asm
; Link with ld -m elf_i386 AES-Encryption.o -o AES-Encryption
; Or just run make like a chad
%include "IO.inc" 			; Custom Written IO library
%include "Substitution.inc"	; Substitution functions
%include "Rotation.inc"		; Rotation functions
%include "ColumnMixing.inc"	; Column mixing functions
global _start

section .data
message db 0x19, 0xa0, 0x9a, 0xe9, 0x3d, 0xf4, 0xc6, 0xf8, 0xe3, 0xe2, 0x8d, 0x48, 0xbe, 0x2b, 0x2a, 0x08
SubstitutedMessage TIMES 16 db 0
mixedMessage TIMES 16 db 0

section .text
_start:

	mov ecx, 16
	mov esi, message
	mov edi, SubstitutedMessage
	call SubstituteMessage
	
	mov esi, SubstitutedMessage
	call RotateMessage
	call Print4x4Matrix

	call WriteLine
	
	mov esi, SubstitutedMessage
	mov edi, mixedMessage
	call MixColumns

	mov esi, mixedMessage
	call Print4x4Matrix

	;Return zero
	mov eax, 0x1
	mov ebx, 0
	int 0x80