ASM=nasm

SRC=src
BIN=bin

$(BIN)/main.img: $(BIN)/main.bin
	cp $(BIN)/main.bin $(BIN)/main.img
	truncate -s 1440k $(BIN)/main.img

$(BIN)/main.bin: $(SRC)/main.asm
	$(ASM) $(SRC)/main.asm -f bin -o $(BIN)/main.bin

qemu: $(BIN)/main.img
	qemu-system-i386 -fda $(BIN)/main.img