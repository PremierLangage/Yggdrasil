extends = /model/math.pl

before ==
import random as rd
u1 = round(rd.uniform(-5, 5),2)
u2 = rd.randint(-5, 5)
u3 = rd.randint(-5, 5)
v1 = round(rd.uniform(-5, 5),2)
v2 = rd.randint(-5, 5)
v3 = rd.randint(-5, 5)
==

title == 
Addition de deux vecteurs
==

text ==
Donner les coordonnées de l'addition des deux vecteurs suivant :
$! \vec{u} = \left( [{{a}},{{b}},{{c}}] \right) !$

$! \vec{v} = \left( [{{a}},{{b}},{{c}}] \right) !$

==

input =: Input
input.type = number

form ==
{{ input | component }}
==

evaluator ==
grade=(100,"Bravo !")
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