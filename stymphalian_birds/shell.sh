#!/bin/bash

if [ "$1" == "-h" ]; then
	echo "This will make some sort of automation work for your project's basis such as Makefile, gitignore, source directory with main file, includes directory with header file, and author file to make your life easier."
elif [ "$1" != "-h" ] && [ $# == 1 ]; then
	echo "Project Name : $1"
	echo "list of programming language you can use:"
	echo "c
c
c
c
c
c
c"

	read -p "Which program language are you using?: " LANGUAGE
	LANGUAGE=$( echo "$LANGUAGE" | tr '[:upper:]' '[:lower:]')
	if [ $LANGUAGE == "c" ]
	then 
		echo "$1 project with $LANGUAGE !"
	else
		echo "sorry i can only do with c"
	fi

	if true; then
		echo "making src directory with main file...🕐"
		{
			mkdir $1
			mkdir $1/srcs
			touch > $1/srcs/main.c
			echo " " >> $1/srcs/ main.c
		} &> /dev/null
	fi

	if true; then
		echo "making includes directory with header file...🕑"
		{
			mkdir $1/includes
			touch > $1/includes/${1}.h
			echo "#ifndef $( echo "$1" | tr '[:lower:]' '[:upper:]' )_H" \ >> $1/includes/${1}.h
			echo "# define $( echo "$1" | tr '[:lower:]' '[:upper:]' )_H" \ >> $1/includes/${1}.h
			echo "#endif" \ >> $1/includes/${1}.h
		} &> /dev/null
	fi

	if true; then
		read -p "what is your username?: " INTRA
		INTRA=$( echo "$INTRA" | tr '[:upper:]' '[:lower:]' )
		echo $INTRA > $1/author
		echo "author file done!"
	fi

	if true; then
		echo "making makefile.....🕒"
		{
			touch > $1/Makefile
			echo "NAME = $( echo "$1" | tr '[:upper:]' '[:lower:]' ).a" >> $1/Makefile
			echo "CC = gcc" >> $1/Makefile
			echo "CFLAG = -Wall -Wextra -Werror" >> $1/Makefile
			echo "SRC = " >> $1/Makefile
			echo "OBJ = \$(SRC:.c=.o)" >> $1/Makefile
			echo "HEADER = $( echo "$1" | tr '[:upper:]' '[:lower:]' ).h" >> $1/Makefile
			echo "all: \$(NAME)
			\$(CC) \$(CFLAGS) -c -I \$(HEADER) \$(SRC)
			ar rc \$(NAME) \$(OBJ)
			ranlib \$(NAME)" >> $1/Makefile
			echo "clean:
			rm -rf \$(OBJ)" >> $1/Makefile
			echo "fclean: clean
			rm -rf \$(NAME)" >> $1/Makefile
			echo "re: fclean all" >> $1/Makefile
			echo ".PHONY: all, clean, fclean, re" >> $1/Makefile
		} &> /dev/null
	fi


	if true; then
			echo "im gonna make gitignore for you. you're welcome"
			{
			touch > $1/.gitignore
			echo "# Prerequisites
			*.d

			# Object files
			*.o
			*.ko
			*.obj
			*.elf

			# Linker output
			*.ilk
			*.map
			*.exp

			# Precompiled Headers
			*.gch
			*.pch

			# Libraries
			*.lib
			*.a
			*.la
			*.lo

			# Shared objects (inc. Windows DLLs)
			*.dll
			*.so
			*.so.*
			*.dylib

			# Executables
			*.exe
			*.out
			*.app
			*.i*86
			*.x86_64
			*.hex

			# Debug files
			*.dSYM/
			*.su
			*.idb
			*.pdb

			# Kernel Module Compile Results
			*.mod*
			*.cmd
			.tmp_versions/
			modules.order
			Module.symvers
			Mkfile.old
			dkms.conf" >> $1/.gitignore
		} &> /dev/null
	fi

	if true; then
		read -p "Do you want to include libft: (y/n) " yn
		case $yn in
			[Yy]* ) read -p "address of you library git: " ADDR
				git clone $ADDR $1/libft
				rm -rf .git;;
			[Nn]* ) break;;
			* ) echo "yes or no";;
		esac
	fi

	echo "DONE!"
	echo "Good luck on your project '$1'!"
else
	echo "usage: sh $0 [-h] --if you need help"
	echo "usage: sh $0 [Project Name] --to start making you project"
fi
exit 0
