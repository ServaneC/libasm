		global	_ft_write
		extern ___error
		section	.text

_ft_write:
			mov rax, 0x2000004
			syscall
			jc error
			jmp end

error:
			xor rdx, rdx
			mov rdx, rax
			call ___error
			mov [rax], rdx
			mov rax, -1

end:
			ret