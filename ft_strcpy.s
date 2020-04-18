		global	_ft_strcpy

		section	.text

_ft_strcpy:
			mov rcx, -1
			xor rdx, rdx

copy:
			inc rcx
			mov dl, byte[rsi + rcx]
			mov byte[rdi + rcx], dl
			cmp dl, 0
			jne copy

end:

		mov rax, rdi
		ret