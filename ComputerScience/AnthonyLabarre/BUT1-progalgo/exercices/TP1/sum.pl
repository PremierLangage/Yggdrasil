extends = /ComputerScience/python/AP1-1920/templates/generic/generic.pl

tag=Programmation|Python|Variable|Somme
author = 

title = Somme de variables


text==
 Initialisez la variable **sum** avec la somme des variables a et b.
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














