		global	_ft_read
		extern ___error
		section	.text

_ft_read:
			mov rax, 0x2000003
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