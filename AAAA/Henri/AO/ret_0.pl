extends=./Vide.pl

author=Henri Derycke

title= Exemple d'assembleur

text==#|markdown|
Écrire un programme qui ne fait rien
==

editor.code==#|asm|
section .text
global _start

_start:
    mov eax, 1
    mov ebx, 0
    int 0x80

==

student_source = main

# Correction
sources.main==#|asm|
section .text
global _start

_start:
    mov eax, 1
    mov ebx, 0
    int 0x80

==

checks_args_stdin==#|python|
[
    ["Test basique", [], ""],
]
==