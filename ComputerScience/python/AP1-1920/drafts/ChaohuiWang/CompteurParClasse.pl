#author= C.Wang

# PL database (or background system) -> PL client

# the title shown in the PL test instance
title=Compteur de caractères

tag=list # N'oubliez pas de remplir ce champs svp

extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

piste=verte

# the subject of the exercise shown in the PL test instance
text==
## Compteur de caractères ## 

Faire une fonction qui prend en argument une liste, et rend une liste de taille 3 qui contient successivement le nombre de chiffres, de lettres de l'alphabet anglais, et d’autres. Par examples:

convertirChaine([1,2,3]) : [1,3]

convertirChaine([1,2]) : [1,2]

==


# the codes of the representatvie tests executed after the client answers the question (transferred from the client's machine), so as to check their codes
pltest==
>>> Compteur([1,'a','#',2]) == [2,1,1]
True
>>> Compteur([1,'a','#','2']) == [1,2,1]
True
>>> Compteur([]) == [0,0,0]
True
==

# the codes provided in the PL test instance and the client can use/modify it directly (shown in the client's webpage if using "editor.code")
editor.code==
def Compteur(L):
    pass


==
editor.height=145

Xeditor.code==
==



