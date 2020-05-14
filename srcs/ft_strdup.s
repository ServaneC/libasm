section	.text
		global	_ft_strdup
		extern	_ft_strlen
		extern	_malloc
		extern	_ft_strcpy
		extern ___error

_ft_strdup:
		call _ft_strlen
		push rdi
		mov rdi, rax
		inc rdi
		call _malloc
		jc error
		pop rsi
		mov rdi, rax
		call _ft_strcpy
		jmp end

error:
		xor rdx, rdx
		mov rdx, rax
		call ___error
		mov [rax], rdx
		mov rax, 0

end:
		ret