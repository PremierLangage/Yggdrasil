

extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

@ loopgen.py
title= Boucle d'OR (repetable)


text==
Pour les entiers  de {{b}} à {{h}} parcourus de {{s}} en {{s}} 
{{predtext}}
 calculer {{operatortextb}} {{functeur[0]}} {{operatortexta}} .
==

soluce==
print({{result}})
==

plsoluce==
Vérification |
==

before==
import random
import loopgen
import functools

predicats,functeurs,operators= loopgen.getStuff()
b=random.randint(-100,100)
h=b+random.randint(-10,100)
s= random.randint(1,7) if h>b else random.randint(-3,-1)
predcode,predtext = random.choice(predicats)
functeur = random.choice(functeurs)
operatorcode,operatortextb,operatortexta = random.choice(operators)

result=operatorcode( functools.reduce(functeur[2],[o for o in range(b,h,s) if predcode(o)], functeur[1]))
==
