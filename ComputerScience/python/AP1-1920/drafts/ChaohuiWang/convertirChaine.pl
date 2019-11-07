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
## Convertir au liste de longeur pair## 

Faire une fonction pour enlever l'element au milieu de la liste de chiffre, si sa longeur est impair

==


# the codes of the representatvie tests executed after the client answers the question (transferred from the client's machine), so as to check their codes
pltest==
>>> convertirChaine([1,2,3]) == [1,3]
True
>>> convertirChaine([1,2,5,6,3]) == [1,2,6,3]
True
>>> convertirChaine([1,2]) == [1,2]
True
>>> 
==

# the codes provided in the PL test instance and the client can use/modify it directly (shown in the client's webpage if using "editor.code")
editor.code==
def convertirChaine(L):


==
editor.height=145
