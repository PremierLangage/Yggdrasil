extends = /model/basic.pl

before ==
import random as rd
a = rd.randint(10, 20)
b = rd.randint(10, 20)
==

title = "Addition de deux vecteurs"

text ==
Donner les coordonnées de l'addition des deux vecteurs suivant :
$! \vec{u} = \left( [1,2,3] \right) !$


==

input =: Input
input.type = number

form ==
{{ input|component }}
==

evaluator==
if input.value == 8:
    score = 100
else:
    score = 0
==