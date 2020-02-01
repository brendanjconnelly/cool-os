del boot.bin
nasm -f bin boot.asm -o boot.bin
qemu-system-i386 -s boot.bin