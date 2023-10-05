@ /utils/sandboxio.py
@ nasmtools.py
grader  =@ /grader/evaluator.py

author=Henri Derycke

title= Exemple d'assembleur

text==#|markdown|
Écrire un programme qui ne fait rien
==

editor =: CodeEditor
editor.theme=dark
editor.language=Assembly

editor.code==#|asm|
section .text
global _start

_start:
    mov eax, 1
    mov ebx, 0
    int 0x80

==


# Correction
sources.main==#|asm|
section .text
global _start

_start:
    mov eax, 1
    mov ebx, 0
    int 0x80

==


form ==
{{ editor|component }}
==

evaluator==#|py|
grade = 100
==