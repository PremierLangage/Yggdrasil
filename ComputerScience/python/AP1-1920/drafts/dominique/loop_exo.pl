

extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

@ loopgen.py
title= Boucle d'OR (repetable)


text==
Lire un entier sur l'entré dans la variable X.
Parcourrir les entiers  de {{b}} à X parcourus de {{s}} en {{s}} 
{{predtext}}
 calculer {{operatortextb}} {{functeur[0]}} {{operatortexta}} .
==

plsoluce==
Vérification | 100
Vérification | -100
Vérification | 33
==

soluce==
import random
import loopgen
import functools

random.seed(seed)
predicats,functeurs,operators= loopgen.getStuff()
b=random.randint(-100,100)
h=b+int(input())
s= random.randint(1,7) if h>b else random.randint(-3,-1)
predcode,predtext = random.choice(predicats)
functeur = random.choice(functeurs)
operatorcode,operatortextb,operatortexta = random.choice(operators)

result=operatorcode( functools.reduce(functeur[2],[o for o in range(b,h,s) if predcode(o)], functeur[1]))
print(result)
==


before==
import random
import loopgen
import functools
seed=random.randint(1,10000)
random.seed(seed)
predicats,functeurs,operators= loopgen.getStuff()
b=random.randint(-100,100)
h=b+random.randint(-10,100)
s= random.randint(1,7) if h>b else random.randint(-3,-1)
predcode,predtext = random.choice(predicats)
functeur = random.choice(functeurs)
operatorcode,operatortextb,operatortexta = random.choice(operators)

result=operatorcode( functools.reduce(functeur[2],[o for o in range(b,h,s) if predcode(o)], functeur[1]))


==
