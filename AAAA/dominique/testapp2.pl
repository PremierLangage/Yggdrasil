

@ /utils/sandboxio.py

builder =@ /builder/before.py
extends= /ComputerScience/python/AP1-1920/templates/plsoluce.pl

@ codeevaluator.py [grader.py]


title= Test pour le mini projet 2 AP1 2020/2021 

soluce=@app2dr.py 

@ input0.txt
@ input1.txt 
@ input2.txt
@ input3.txt

text=""

before==

tests=["Prompt : quelle invite de commande ?","Quelle version ?","Version2", "version1" ]

for i,t in enumerate(tests): 
    filename=f"input{i}.txt"
    mpl=t+"\n"
    with open(filename,"r") as f:
        mpl+= f.read()
    globals()[f"mplsoluce{i}"]= mpl


==




# création de l'éditeur de code
editor =: CodeEditor
editor.language = python
editor.cid = py_editor_0
editor.code ==
# Saisissez votre code ici, et cliquez sur le bouton
# de validation quand vous avez terminé
input("$ ")
print("Désolé vous n'avez pas doublé votre mise initiale !")
==
form==

{{ editor  | component }}
==


pregrader==

student=editor.code
with open("student.py","w") as f:
    f.write(student)
==


