

extends= testapp2.pl


title=
text==

Tester cotre code contre un autre code.

Dans le premier editeur placer l'entrée que vous voulez comparer.
Dans le deuxième editeur votre code python.


==

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Entrée du programme (stdin)
inputbox.maxlength = 2
inputbox.appearance = outline
inputbox.value = terminer

editor1 =: CodeEditor
editor1.language = text
editor1.cid = py_editor_1
editor1.code ==
terminer
==



#soluce=@ app2dr.py


ducode==
version="v2"
while True:
        s=input("$ ")
        if s=="v2":
            version=s
            continue
        if s=="v1":
            version=s
            continue
        if s=="version" :
            print(version)
            continue
        if s=="terminer":
            print("Désolé vous n'avez pas doublé votre mise initiale !") 
            break
==

before=

pregrader==

student=editor.code
with open("student.py","w") as f:
    f.write(student)
inputstring=editor1.code
if inputstring:
    mplsoluce1="Test perso\n"+inputstring+"\n"

==


form==
{{ editor1 | component }}
{{ editor  | component }}
==

mplsoluce1==
Test Version
version
v1
version
v2
version
terminer
==




