#author=
#unfinished

# PL database (or background system) -> PL client

# the title shown in the PL test instance
title=Title

# what candidates are there? and their meaning?
tag= # N'oubliez pas de remplir ce champs svp

# what candidates are there? and their meaning?
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

# what candidates are there? and their meaning?
piste=verte

# the subject of the exercise shown in the PL test instance
text==
## Convertir au liste de longeur pair## 

Faire une fonction pour enlever l'element au milieu de cette liste de chiffre

==

# the codes executed when creating the PL test instance (before transferring to the client's machine)
# one can define supplemental pltests here
before==
import random 
l = [random.randint(0,10) for i in range(11)]

pltest1=""">>> carre({})\n{}\n""".format(p, p**2)
p+=17
pltest2=""">>> carre({})=={}# Hidden value test\nTrue\n""".format(p, p**2)
==

# the codes of the representatvie tests executed after the client answers the question (transferred from the client's machine), so as to check their codes
pltest==
>>> Enlever([1,2,3]) == [1,3]
True
>>> Enlever([1,2,5,6,3])
0
>>> Enlever(10)
100
>>> 
==

# the codes provided in the PL test instance and the client can use/modify it directly (shown in the client's webpage if using "editor.code")
editor.code==
def Enlever(L):
==
editor.height=145


