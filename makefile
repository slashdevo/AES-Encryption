AES-Encryption: AES-Encryption.asm SBOX.inc IO.inc Substitution.inc RowRotation.inc ColumnMixing.inc
	nasm -f elf AES-Encryption.asm
	ld -m elf_i386 AES-Encryption.o -o AES-Encryption
