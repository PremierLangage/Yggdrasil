extends=./Vide.pl

author=Henri Derycke

title= Exemple d'assembleur

text==#|markdown|
On suppose qu'on dispose des fonctions `int lire(char octets[], int taille)`{.c} et `void ecrire(char octets[], int taille)`{.c}.
La fonction `lire` lit jusqu'à `taille` octets dans le flux d'entrée standard et les places dans `octets`.
La fonction renvoie le nombre d'octets lus.
La fonction `ecrire` affiche dans le flux de sortie standard les `taille` octets situées à l'adresse `octets`.

En utilisant les fonctions `lire` et `ecrire`, écrire un programme complet recopiant son entrée standard dans sa sortie standard (fonctionnant ainsi comme la commande `cat` sans argument sous Unix).
==

editor.code==#|asm|
section .text
global main
extern lire
extern ecrire

main:
    ; compléter
    mov eax, 1
    mov ebx, 0
    int 0x80
==

student_source = main

# Correction
sources.main==#|asm|
section .bss
buffer: resb 1000

section .text
global main
extern lire
extern ecrire

main:
    push 1000
    push buffer
    call lire
    add esp, 8

    cmp eax, 0
    jle .fin

    push eax
    push buffer
    call ecrire
    add esp, 8

    jmp main
.fin:
    
    mov eax, 1
    mov ebx, 0
    int 0x80

==

sources.io==#|asm|
section .text
global lire
global ecrire

; lire(buffer[], size) -> number of bytes read
lire:
    push ebx
    mov eax, 3        ; SYS_read
    mov ebx, 0        ; STDIN_FILENO
    mov ecx, [esp+8]  ; buffer
    mov edx, [esp+12] ; size
    int 0x80          ; result is in eax
    pop ebx
    ret

; ecrire(buffer[], size) -> number of bytes written
ecrire:
    push ebx
    mov eax, 4        ; SYS_write
    mov ebx, 1        ; STDOUT_FILENO
    mov ecx, [esp+8]  ; buffer
    mov edx, [esp+12] ; size
    int 0x80          ; result is in eax
    pop ebx
    ret
==

checks_args_stdin==#|python|
[
    ["Test 1", [], ""],
    ["Test 2", [], "Bim badamboum"],
    #["Test 3", [], "Bim badamboum\n" * 500],
]
==