

extends= /AAAA/dominique/testapp2.pl


title=
text= Exécuter votre code sur la sandbox 

inputbox =: Input
inputbox.type = multiline
inputbox.placeholder = Entrée du programme (stdin)
inputbox.maxlength = 200
inputbox.appearance = outline


# création de l'éditeur de code
editor =: CodeEditor
editor.language = python
editor.cid = py_editor_0
editor.code ==
# Saisissez votre code ici, et cliquez sur le bouton
# de validation quand vous avez terminé

==

 

soluce=@ /AAAA/dominique/app2dr.py


editor.code="Boh"

before=

pregrader==
inputstring=inputbox.value

==

@ /grader/evaluator.py [grader.py]

evaluator==
a=inputbox.value
b="inputstring"
c=str(response)
grade= (33,f"-a-{a} -b-{b} -c-{c} ")

==

form==
{{ inputbox | component }}
==

mplsoluce0==
Test Version
version
v1
version
v2
version
terminer
==


