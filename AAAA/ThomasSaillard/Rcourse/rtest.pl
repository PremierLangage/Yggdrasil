

@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

editor =: CodeEditor
editor.theme = dark
editor.language = r
editor.code ==
# Simple Hello World en R
print("Hello World")
==

before==
==

title = Test R 

text==
C'est un petit "Hello World" écrit en R, fun fact: c'est exactement comme un "Hello World" en python
==

form==
{{ editor|component }}
==

evaluator==#|python|
import subprocess

f = open('hello_world.R', 'w')
f.write(editor.code)
f.close()

process = subprocess.run(['Rscript', 'hello_world.R'], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
stdout = process.stdout
ce = process.returncode

ans = "ex&eacute;cution : " + stdout.decode() + "(code Unix de retour : " + str(ce) + ")"

grade = (100, ans)
==
