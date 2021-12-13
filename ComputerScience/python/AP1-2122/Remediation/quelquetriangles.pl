





author= DR
title=Triplets

tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]


text==

Par définition des triangles la somme des longueurs deux coté est toujours plus grande que la longueur du troisième coté.

Ecrie une fonction **check** qui prend une liste de chaines de caractère contenant trois entiers et qui retourne le nombre de ligne contneant des triangles.

Exemple de chaine :

    "5 10 25" qui n'est pas un triangle 
    "685  748  471" qui peut en être un

==

before==
from random import randint
def makes():
    l=[chr(randint(0,25)+97) for i in range(16)]
    u= randint(4,15)
    for x in range(2):
        l.insert(u,l[u])
    return ''.join(l)

def ftriple(l):
    i=0
    while i+2< len(l):
        if l[i]==l[i+1] and l[i]==l[i+2]:
            return (l[i],i)
        i += 1
        
for yy in range(3):
    s=makes()
    pltest += f"""
    >>> ptriplet("{s}")
    {ftriple(s)}
    """ 
==

pltest==
>>> ptriplet("aaabcd")
('a', 0)
>>> ptriplet("abcdefghjkilnaopqusrtxwz")
==



code==
def ptriplet(l):
    i=0
    while i+2< len(l):
        if l[i]==l[i+1] and l[i]==l[i+2]:
            return (l[i],i)
        i += 1
==
