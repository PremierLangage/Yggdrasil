extends = /model/math.pl

before ==
import random as rd
a = rd.randfloat(-5, 5)
b = rd.randint(-5, 5)
c = rd.randint(-5, 5)
==

title = "Addition de deux vecteurs"

text ==
Donner les coordonnées de l'addition des deux vecteurs suivant :
$! \vec{u} = \left( [{{a}},2,3] \right) !$


==

input =: Input
input.type = number

form ==
{{ input | component }}
==

evaluator ==
grade=(100,input.value)
==



#input =: Input
#input.type = number

#form ==
#{{ input|component }}
#==

#evaluator==
#if input.value == 8:
#    score = 100
#else:
#    score = 0
#grade(score,"la réponse est 100")
#==