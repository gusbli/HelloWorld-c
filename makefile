.SUFFIXES:

# specify C standard
STD=-std=c11
# specify C compiler
CC=gcc $(STD)
# specify optimization information
OPT=-O3 -march=x86-64 -mtune=generic -pipe
# specify compile flags
#CFLAGS=-Wall -Wextra -pedantic $(OPT)
CFLAGS=-Wall -Wextra -pedantic -Werror $(OPT)
# preprocessor flags (needed for M_PI)
CPPFLAGS=-D_XOPEN_SOURCE=500
# specify link flags
#LDFLAGS=-s
# specify libraries
LIBS=-lm

#all:	hello
all:	main

#hello:	hello.o emitter.o
main:	main.o
	$(CC) $(LDFLAGS) $^ -o $@ $(LIBS)

#hello.o:	hello.c emitter.h
main.o:	main.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

#emitter.o:	emitter.c emitter.h
#	$(CC) $(CFLAGS) $(CPPFLAGS) -c $< -o $@

clean:
	$(RM) main.o main.o core

distclean:	clean
	$(RM) main

.PHONY:	all clean distclean