#extends = /ComputerScience/python/AP1-1920/templates/generic/generic.pl

#@ /ComputerScience/python/AP1-1920/templates/generic/grader.py



@ /utils/sandboxio.py
@ /ComputerScience/python/AP1-1920/templates/generic/builder.py
@ /ComputerScience/python/AP1-1920/templates/generic/grader.py
@ /ComputerScience/python/AP1-1920/templates/generic/utils/test.py
@ /ComputerScience/python/AP1-1920/templates/generic/utils/mockinput.py
@ /ComputerScience/python/AP1-1920/templates/generic/utils/testgroup.html
@ /ComputerScience/python/AP1-1920/templates/generic/utils/testitem.html


# création de l'éditeur de code
editor =: "/python/form/editorform.html"
editor.code ==
==

tag=Programmation|Python|Variable|Somme
author = 

title = Somme de variables


text==
 Initialisez la variable **sum** avec la somme des variables a et b.
==

form==
{{editor|component}}
==
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














