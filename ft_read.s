		global	_ft_read

		section	.text

_ft_read:
			mov rax, 0x2000003
			syscall
			jc error
			jmp end

error:
			mov rax, -1

end:
			ret