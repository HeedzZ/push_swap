# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: marvin <marvin@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/12/20 15:14:09 by marvin            #+#    #+#              #
#    Updated: 2023/12/20 15:14:09 by marvin           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME		=	push_swap

CC			=	clang

FLAG		=	-Wall -Wextra -Werror -g3

LIBFT_PATH	=	./libft/

LIBFT_FILE	=	libft.a

LIBFT_LIB	=	$(addprefix $(LIBFT_PATH), $(LIBFT_FILE))

SRC		=	main.c \
			init_a_to_b.c \
			init_b_to_a.c \
			push.c \
			revrotate.c \
			rotate.c \
			sort_stacks.c \
			sort_three.c \
			stack_init.c \
			stack_utils.c \
			swap.c \
			error.c

OBJ			=	$(SRC:.c=.o)

.c.o:
	$(CC) $(FLAG) -c $< -o $@

all: $(NAME)

lib:
	@echo "\033[0;33m\nCOMPILING $(LIBFT_PATH)\n"
	@make -C $(LIBFT_PATH)
	@echo "\033[1;32mLIBFT_lib created\n"

$(NAME): lib $(OBJ)
	@echo "\033[0;33m\nCOMPILING PUSH_SWAP...\n"
	$(CC) $(OBJ) $(LIBFT_LIB) -o $(NAME)
	@echo "\033[1;32m./push_swap created\n"

clean:
	@echo "\033[0;31mDeleting Obj file in $(LIBFT_PATH)...\n"
	@make clean -sC $(LIBFT_PATH)
	@echo "\033[1;32mDone\n"
	@echo "\033[0;31mDeleting push_swap object...\n"
	@rm -f $(OBJ)
	@echo "\033[1;32mDone\n"

fclean: clean
	@echo "\033[0;31mDeleting push_swap executable..."
	@rm -f $(NAME)
	@make fclean -C $(LIBFT_PATH)
	@echo "\033[1;32mDone\n"

re: fclean all

.PHONY: all clean fclean re
