.POSIX:
.SUFFIXES:

CC = gcc
LDLIBS = -luuid
CFLAGS = -Wall -O3 $(DEBUG)

all: hello
hello: main.o module.o
	$(CC) $(LDFLAGS) -o $@ main.o module.o $(LDLIBS)
main.o: main.c global.h module.h
module.o: module.c module.h global.h
clean:
	rm -f hello main.o module.o
# that is not portable
# debug: DEBUG=-O0 -g
# debug: all

# A portable way
# https://stackoverflow.com/questions/59324317/can-i-conditionally-define-a-macro-in-makefile-in-a-portable-way
debug:
	$(MAKE) all DEBUG='-O0 -g'

.SUFFIXES: .c .o
.c.o:
	$(CC) $(CFLAGS) -c $<
