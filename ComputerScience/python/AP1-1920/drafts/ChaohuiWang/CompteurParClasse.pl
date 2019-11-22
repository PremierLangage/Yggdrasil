#author= C.Wang

# PL database (or background system) -> PL client

# the title shown in the PL test instance
title=Compteur d'éléments des différentes classes

tag=list # N'oubliez pas de remplir ce champs svp

extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

piste=verte

# the subject of the exercise shown in the PL test instance
text==
## Compteur d'éléments des différentes classes ## 

Faire une fonction qui prend en argument une liste, et rend une liste de taille 3 qui contient successivement le nombre de chiffres, de lettres de l'alphabet français, et d’autres. Par examples:

Compteur(['1','a','#','é']) == [1, 2, 1]

Compteur(['&','#','é']) == [0, 1, 2]

==



# the codes executed when creating the PL test instance (before transferring to the client's machine)
# one can define supplemental pltests here
before==
import random
def convertirChaine(l):
    if len(l)>0 and len(l)%2==1:
        del l[len(l)//2]
    return l
l = [random.randint(0,10) for i in range(random.randint(0,30))]
pltest4=""">>> convertirChaine({})\n{}""".format(l+l,convertirChaine(l+l))
pltest5=""">>> convertirChaine({})\n{}""".format(l+[0]+l,convertirChaine(l+[0]+l))
after=before
==

# the codes of the representatvie tests executed after the client answers the question (transferred from the client's machine), so as to check their codes
pltest==
>>> Compteur(['1','a','#','é'])
[1, 2, 1]
>>> Compteur(['&','#','é']) 
[0, 1, 2]
>>> Compteur([])
[0, 0, 0]
==

# the codes provided in the PL test instance and the client can use/modify it directly (shown in the client's webpage if using "editor.code")
editor.code==
def Compteur(L):
    pass


==
editor.height=145

Xeditor.code==
==



