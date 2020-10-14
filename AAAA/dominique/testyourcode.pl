

extends= testapp2.pl


title=
text= Exécuter votre code sur la sandbox 

inputbox =: Input
inputbox.type = text
inputbox.placeholder = Entrée du programme (stdin)
inputbox.maxlength = 2
inputbox.appearance = outline
inputbox.value = terminer

editor1 =: CodeEditor
editor1.language = python
editor1.cid = py_editor_1
editor1.code ==
# Saisissez les lignes d'entré

==


# création de l'éditeur de code
editor =: CodeEditor
editor.language = python
editor.cid = py_editor_0
editor.code ==
# Saisissez votre code ici, et cliquez sur le bouton
# de validation quand vous avez terminé

==

soluce=@ app2dr.py


editor.code==
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
inputstring=editor.code
student=editor1.code
with open("student.py","w") as f:
    f.write(student)

mplsoluce1="Test perso\n"+inputstring+"\n"

==


form==
{{ editor1 | component }}
{{ editor  | component }}
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



