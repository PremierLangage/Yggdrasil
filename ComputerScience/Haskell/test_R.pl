@ /utils/sandboxio.py
grader  =@ /grader/evaluator.py
builder =@ /builder/before.py

editor =: CodeEditor
editor.theme = dark
editor.language = c
editor.code ==
En fait, ça sert à rien de toucher quoi que ce soit ici...

Durant la validation, on va envoyer un joli `echo "1+1" | R --no-save`
dans les sandbox....

S'il n'y a pas d'erreur, c'est que R a fait son travial. Sinon, c'est
que R n'est pas installé...
==

before==
==

title = Test R console

text==
==

form==
{{ editor|component }}
==

evaluator==#|python|
from subprocess import Popen, PIPE

f = open('hello_world.c', 'w')
f.write(editor.code)
f.close()

process = Popen(['echo "1+1" | R --no-save'], stdout=PIPE, stderr=PIPE, shell=True)
stdout, stderr = process.communicate()

ans = """<b>Contenue de la console : </b>"""

ans += '<br>' + stdout.decode().replace('\n', '<br>')

grade = (100, ans)
==


