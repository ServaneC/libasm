global	_ft_strcmp

section	.text

_ft_strcmp:
			xor rax, rax
			xor rbx, rbx
			mov rcx, -1
			xor rdx, rdx


comp:
			inc rcx
			mov bl, byte[rdi + rcx]
			mov dl, byte[rsi + rcx]
			cmp bl, 0
			je end
			cmp dl, 0
			je end
			cmp bl, dl
			je comp

end:
			sub dl, bl
			movzx rax, dl
			neg rax
			ret