global _ft_strlen

section	.text

_ft_strlen:
				mov rax, -1

count:			
				inc rax
				cmp byte[rdi + rax], 0
				jne count 
end:
				ret