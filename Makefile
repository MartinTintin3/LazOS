ASM=nasm

SRC=src
BIN=bin

all: build

prepare:
	mkdir -p $(BIN)

compile: prepare $(SRC)/main.asm
	$(ASM) $(SRC)/main.asm -f bin -o $(BIN)/main.bin

build: compile
	cp $(BIN)/main.bin $(BIN)/main.img
	truncate -s 1440k $(BIN)/main.img

qemu: $(BIN)/main.img
	qemu-system-i386 -fda $(BIN)/main.img