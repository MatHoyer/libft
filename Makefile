CC = cc

CFLAGS = -Wall -Werror -Wextra -I.

AFFICHAGE_SRC =  ft_putchar_fd.c \
	ft_putendl_fd.c \
	ft_putnbr_fd.c \
	ft_putstr_fd.c 

CARAC_SRC = ft_isalnum.c \
	ft_isalpha.c \
	ft_isascii.c \
	ft_isdigit.c \
	ft_isprint.c \
	ft_tolower.c \
	ft_toupper.c 

CONVERT_SRC = ft_atoi.c \
	ft_itoa.c \
	ft_itoa_unsigned.c

LST_SRC = ft_lstadd_back.c \
	ft_lstadd_front.c \
	ft_lstclear.c \
	ft_lstdelone.c \
	ft_lstiter.c \
	ft_lstlast.c \
	ft_lstmap.c \
	ft_lstnew.c \
	ft_lstsize.c

MEM_SRC = ft_bzero.c \
	ft_calloc.c \
	ft_memchr.c \
	ft_memcmp.c \
	ft_memcpy.c \
	ft_memmove.c \
	ft_memset.c

STR_SRC = ft_split.c \
	ft_strchr.c \
	ft_strdup.c \
	ft_striteri.c \
	ft_strjoin.c \
	ft_strlcat.c \
	ft_strlcpy.c \
	ft_strlen.c \
	ft_strmapi.c \
	ft_strncmp.c \
	ft_strnstr.c \
	ft_strrchr.c \
	ft_strtrim.c \
	ft_substr.c

AFFICHAGE_PATH = affichage/
CARAC_PATH = carac/
CONVERT_PATH = convert/
LST_PATH = lst/
MEM_PATH = mem/
STR_PATH = str/

AFFICHAGE = $(addprefix $(AFFICHAGE_PATH), $(AFFICHAGE_SRC))
CARAC = $(addprefix $(CARAC_PATH), $(CARAC_SRC))
CONVERT = $(addprefix $(CONVERT_PATH), $(CONVERT_SRC))
LST = $(addprefix $(LST_PATH), $(LST_SRC))
MEM = $(addprefix $(MEM_PATH), $(MEM_SRC))
STR = $(addprefix $(STR_PATH), $(STR_SRC))

SRC = $(AFFICHAGE) \
	$(CARAC) \
	$(CONVERT) \
	$(LST) \
	$(MEM) \
	$(STR)

OBJ = $(SRC:.c=.o)

NAME = libft.a

all : $(NAME)

$(NAME) :
	@echo "Compilation de libft en cours..."
	@echo -n "Progression: ["
	@make -s avancement
	@echo "Terminé!"

avancement: $(OBJ)
	@i=0; \
    while [ $$i -le 20 ]; do \
        sleep 0.1; \
        echo -n "#"; \
        i=$$((i+1)); \
    done
	@echo "]"
	@make compile

compile:
	@ar rcs $(NAME) $(OBJ)

%.o: %.c
	@$(CC) $(CFLAGS) -c $< -o $@

clean :
	@rm -f $(OBJ)

fclean : clean
	@rm -f $(NAME)

re : fclean all

.PHONY : all clean fclean re
