extends = ./multi.pl

title = Truc

text==
Test de dépot ?
==

files.main_asm % {}
files.main_asm.lang = x86
files.main_asm.code == #|asm|
section .text
global main
main:
    ; compléter
==
files.main_asm.solution == #|asm|
section .text
global main
main:
    mov eax, 1
    mov ebx, 0
    int 0x80
==

files.compile_sh % {}
files.compile_sh.lang = sh
files.compile_sh.readonly = 1
files.compile_sh.code == #|shell|
nasm -felf32 main.asm -o main.o
ld -m elf_i386 -e main main.o -o main
==