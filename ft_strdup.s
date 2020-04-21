section	.text
		global	_ft_strdup
		extern	_ft_strlen
		extern	_malloc
		extern	_ft_strcpy
		extern __error

_ft_strdup:
		call _ft_strlen
		push rdi
		mov rdi, rax
		inc rdi
		call _malloc
		cmp rax, 0
		je error
		pop rsi
		mov rdi, rax
		call _ft_strcpy
		jmp end

error:
		mov rax, -1

end:
		ret