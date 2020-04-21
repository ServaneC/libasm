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

NAME		=	libasm.a

SRC_ASM		=	ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s

OBJ_ASM		=	$(SRC_ASM:.s=.o)

SRC_TEST	= 	main.c

OBJ_TEST	=	$(SRC_TEST:.c=.o)

EXEC		=	test

NASM		=	nasm

RANLIB		=	ranlib

N_FLAGS		=	-f macho64

CFLAGS		=	-Wall -Wextra -Werror

CC			=	gcc

AR			=	ar rc

RM			=	rm -f

all:		$(NAME)

$(NAME):	$(OBJ_ASM) $(OBJ_TEST)
		$(AR) $(NAME) $(OBJ_ASM)
		$(RANLIB) $(NAME)
		$(CC) $(CFLAGS) -o $(EXEC) $(OBJ_TEST) $(NAME)


%.o :		%.s
		$(NASM) $(N_FLAGS) -o $@ $<

clean:
		$(RM) $(OBJ_ASM)
		$(RM) $(OBJ_TEST)

fclean :	clean
		$(RM) $(NAME)
		$(RM) $(EXEC)

re :		fclean all

.PHONY: all clean fclean re