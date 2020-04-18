# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: servanechene <servanechene@student.42.f    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/14 18:18:58 by servanechen       #+#    #+#              #
#    Updated: 2020/04/18 19:10:22 by servanechen      ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	=	libasm.a

SRC_ASM	=	ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s

OBJ_ASM	=	$(SRC_ASM:.s=.o)

NASM	=	nasm

RANLIB	=	ranlib

FLAGS	=	-f macho64

AR		=	ar rc

RM		=	rm -f

all:		$(NAME)

$(NAME):	$(OBJ_ASM)
		$(AR) $(NAME) $(OBJ_ASM)
		$(RANLIB) $(NAME)

%.o :		%.s
		$(NASM) $(FLAGS) -o $@ $<

clean:
		$(RM) $(OBJ_ASM)

fclean :	clean
		$(RM) $(NAME)

re :		fclean all

.PHONY: all clean fclean re