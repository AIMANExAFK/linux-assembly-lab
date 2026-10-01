NASM ?= nasm
CC ?= gcc
ASM := hello exit2 uppercase heap
PROGRAMS := $(addprefix build/,$(ASM)) build/fibonacci

.PHONY: all test clean
all: $(PROGRAMS)

build:
	mkdir -p build

build/%.o: src/%.asm | build
	$(NASM) -f elf64 -g -F dwarf $< -o $@

build/%: build/%.o
	ld -z noexecstack $< -o $@

build/fibonacci: src/fibonacci.c | build
	$(CC) -std=c11 -Wall -Wextra -Werror -g -O0 $< -o $@

test: all
	python3 tests/check_output.py

clean:
	rm -rf build
