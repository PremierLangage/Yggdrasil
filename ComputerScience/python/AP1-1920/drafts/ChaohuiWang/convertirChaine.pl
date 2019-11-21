#author= C.Wang

# PL database (or background system) -> PL client

# the title shown in the PL test instance
title=Liste Paire

tag=list # N'oubliez pas de remplir ce champs svp

extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

piste=verte

# the subject of the exercise shown in the PL test instance
text==
## Rendre une liste de taille paire ##

Faire une fonction qui prend en argument une liste, enlève l'élément au milieu de la liste si sa longueur est impaire, et rend la liste modifiée. Par examples:

convertirChaine([1,2,3]) : [1,3]

convertirChaine([1,2]) : [1,2]

==


# the codes executed when creating the PL test instance (before transferring to the client's machine)
# one can define supplemental pltests here
before==
import random 
l = [random.randint(0,10) for i in range(random.randint(0,30))]
l2=l+l
l3=l+[1]+l
after=before
==

# the codes of the representatvie tests executed after the client answers the question (transferred from the client's machine), so as to check their codes
pltest1==
>>> convertirChaine([1,2,5,6,3]) == [1,2,6,3]
True
pltest2==
>>> convertirChaine([]) == []
True
pltest3==
>>> convertirChaine(l3) == l
True
pltest3==
>>> convertirChaine(l3) == l
True
==

# the codes provided in the PL test instance and the client can use/modify it directly (shown in the client's webpage if using "editor.code")
editor.code==
def convertirChaine(L):
    pass


==
editor.height=145

Xeditor.code==
==

