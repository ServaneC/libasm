	global	_ft_strcmp
	

	section	.text

_ft_strcmp:
			xor rax, rax
			xor rbx, rbx
			mov rcx, -1

comp:
			inc rcx
			mov al, byte[rdi + rcx]
			mov bl, byte[rsi + rcx]
			cmp al, 0
			je neg_diff
			cmp bl, 0
			je pos_diff
			cmp al, bl
			je comp
			jg pos_diff
			jl neg_diff

neg_diff:
			sub al, bl
			neg al
			neg rax
			jmp end

pos_diff:
			sub al, bl
			jmp end

end:
			ret
