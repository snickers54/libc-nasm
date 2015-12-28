##
## Makefile for  in /home/single_j//projets/libasm/lib_asm
## 
## Made by julien singler
## Login   <single_j@epitech.net>
## 
## Started on  Mon Mar 21 15:17:32 2011 julien singler
## Last update Tue Mar 22 14:39:36 2011 julien singler
##

NAME		=		libasm.so

SRC		=		memmove.s\
				memcpy.s\
				memset.s\
				read.s\
				rindex.s\
				strcasecmp.s\
				strchr.s\
				strcmp.s\
				strcpy.s\
				strcspn.s\
				strlen.s\
				strncmp.s\
				strncpy.s\
				strstr.s\
				write.s

ASM		=		nasm -f elf
OBJ		=		$(patsubst %.s,%.o,$(wildcard *.s))

%.o		:		%.s
				$(ASM) $<

$(NAME)		:		$(OBJ)
				gcc -shared -fpic $(OBJ) -o $(NAME)

all		:		$(NAME)

clean		:		
				rm -f *~ $(OBJ)

fclean		:		clean
				rm -f $(NAME)

re		:		fclean all
