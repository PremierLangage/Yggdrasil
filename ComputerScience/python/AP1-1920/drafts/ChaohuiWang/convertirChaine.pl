#author= C.Wang

# PL database (or background system) -> PL client

# the title shown in the PL test instance
title=Liste Paire

tag=list # N'oubliez pas de remplir ce champs svp

extends=/ComputerScience/python/AP1-1920/templates/pltest.pl

piste=verte

# the subject of the exercise shown in the PL test instance
text==
## Rendre une liste de taille paire ##

Faire une fonction **convertirListe** qui prend en argument une liste, enlève l'élément au milieu de la liste si sa longueur est impaire, et rend la liste modifiée. Par examples:

convertirListe([1,2,3]) : [1,3]

convertirListe([1,2]) : [1,2]

==


# the codes executed when creating the PL test instance (before transferring to the client's machine)
# one can define supplemental pltests here
before==
import random
def convertirListe(l):
    if len(l)>0 and len(l)%2==1:
        del l[len(l)//2]
    return l
l = [random.randint(0,10) for i in range(random.randint(0,30))]
pltest4=""">>> convertirListe({})\n{}""".format(l+l,convertirListe(l+l))
pltest5=""">>> convertirListe({})\n{}""".format(l+[0]+l,convertirListe(l+[0]+l))
after=before
==

# the codes of the representatvie tests executed after the client answers the question (transferred from the client's machine), so as to check their codes
pltest==
>>> convertirListe([1,2,6,3])
[1, 2, 6, 3]
>>> convertirListe([])
[]
>>> convertirListe([1,2,5,6,3])
[1, 2, 6, 3]
==


# the codes provided in the PL test instance and the client can use/modify it directly (shown in the client's webpage if using "editor.code")
editor.code==
def convertirListe(l):
    pass


==
editor.height=145

Xeditor.code==
==



