# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: schene <schene@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/04/14 18:18:58 by servanechen       #+#    #+#              #
#    Updated: 2020/04/29 15:34:57 by schene           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	libasm.a

SRC_ASM		=	srcs/ft_strlen.s srcs/ft_strcpy.s srcs/ft_strcmp.s \
				srcs/ft_write.s srcs/ft_read.s srcs/ft_strdup.s

OBJ_ASM		=	$(SRC_ASM:.s=.o)

SRC_TEST	= 	srcs/main.c

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