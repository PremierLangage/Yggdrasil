#author= C.Wang

# PL database (or background system) -> PL client

# the title shown in the PL test instance
title=

tag=list # N'oubliez pas de remplir ce champs svp

extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

piste=verte

# the subject of the exercise shown in the PL test instance
text==
## Compteur de caractères par classe ## 

Rendre une liste de chiffres qui contient 3 chiffres, qui sont successivement le nombre de chiffres, de lettres de l'alphabet anglais, et d’autres.

==


# the codes of the representatvie tests executed after the client answers the question (transferred from the client's machine), so as to check their codes
pltest==
>>> convertirChaine([1,2,3]) == [1,3]
True
>>> convertirChaine([1,2,5,6,3]) == [1,2,6,3]
True
>>> convertirChaine([1,2]) == [1,2]
True
>>> convertirChaine([]) == []
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


