

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

editor =: CodeEditor
editor.theme = dark
editor.language = R
editor.code ==
# Simple Hello World in R
print("Hello World")
==

before==
==

title = Test NASM 

text==
Mais quelle idée ce NASM sérieux ??? Il faut valider pour compiler avec NASM, puis linker avec LD puis exécuter ce Hello World !
==

form==
{{ editor|component }}
==

evaluator==#|python|
import subprocess

f = open('hello_world.asm', 'w')
f.write(editor.code)
f.close()

process = subprocess.run(['nasm', '-f', 'elf64', 'hello_world.asm', '-o', 'hello.o'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
stdout = process.stdout
ce = process.returncode

ans = "compilation avec nasm : " + stdout.decode() + "(code Unix de retour : " + str(ce) + ")"
ans += "\n<br>"

process = subprocess.run(['ld', 'hello.o', '-o', 'hello_w'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
stdout = process.stdout
ce = process.returncode

ans += "linkage avec ld : " + stdout.decode() + "(code Unix de retour : " + str(ce) + ")"
ans += "\n<br>"

process = subprocess.run(['./hello_w'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
stdout = process.stdout
ce = process.returncode

ans += "ex&eacute;cution : " + stdout.decode() + "(code Unix de retour : " + str(ce) + ")"

grade = (100, ans)
==
