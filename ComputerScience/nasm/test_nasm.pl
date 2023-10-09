@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

editor =: CodeEditor
editor.theme = dark
editor.language = assembly
editor.code ==
; Define variables in the data section
SECTION .DATA
	hello:     db 'Hello world!',10
	helloLen:  equ $-hello

; Code goes in the text section
SECTION .TEXT
	GLOBAL _start 

_start:
	mov eax,4            ; 'write' system call = 4
	mov ebx,1            ; file descriptor 1 = STDOUT
	mov ecx,hello        ; string to write
	mov edx,helloLen     ; length of string to write
	int 80h              ; call the kernel

	; Terminate program
	mov eax,1            ; 'exit' system call
	mov ebx,0            ; exit with error code 0
	int 80h              ; call the kernel
==

before==
==

title = Test NASM 

text==
==

form==
{{ editor|component }}
==

evaluator==#|python|
from subprocess import Popen, PIPE, run

f = open('hello_world.asm', 'w')
f.write(editor.code)
f.close()

process = run(['nasm', '-f', 'elf64', 'hello_world.asm', '-o', 'hello.o'], stdout=PIPE, stderr=PIPE, shell=True)
stdout = process.stdout

ans = "compilation avec nasm : " + stdout.decode()
ans += "\n<br>"

process = run(['ld hello.o -o hello_world'], stdout=PIPE, stderr=PIPE, shell=True)
stdout = process.stdout

ans += "linkage avec ld : " + stdout.decode()
ans += "\n<br>"

process = run(['./hello_world'], stdout=PIPE, stderr=PIPE, shell=True)
stdout = process.stdout

ans += 'exécution : ' + stdout.decode()

grade = (100, ans)
==


