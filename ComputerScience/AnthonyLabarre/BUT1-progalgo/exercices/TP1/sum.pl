#extends = /ComputerScience/python/AP1-1920/templates/generic/generic.pl

#@ /ComputerScience/python/AP1-1920/templates/generic/grader.py

@ /utils/sandboxio.py
@ builder.py
@ grader.py
@ utils/test.py
@ utils/mockinput.py
@ utils/testgroup.html
@ utils/testitem.html

title = <em>(Pas de titre défini)</em>
text = <em>(Pas d'énoncé défini)</em>

# création de l'éditeur de code
editor =: CodeEditor
editor.language = python
#editor.cid = py_editor_0
editor.code ==
# Saisissez votre code ici, et cliquez sur le bouton
# de validation quand vous avez terminé

==

tag=Programmation|Python|Variable|Somme
author = 

title = Somme de variables


text==
 Initialisez la variable **sum** avec la somme des variables a et b.
==

form=@ /form/text_editor.html

grader==#|python|
run(
    title='Deux nombres',
    globals={'a': 1, 'b': 2}, 
    values={'sum': 3}
)

begin_test_group("Nombres aléatoires")
from random import randrange
for _ in range(5):
    x, y = randrange(0, 1000), randrange(1000, 2000)
    run(
        title='Nombres aléatoires',
        globals={'a': x, 'b': y},
        values={'sum': x+y}
    )
==














