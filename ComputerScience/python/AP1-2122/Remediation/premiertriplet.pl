




author= DR
title=Triplets

tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]


text==

Ecrire une fonction **ptriplet** qui prend un itérable en paramêtre.  

Et qui retourne un tuple contenant la valeur et l'indice du premier élément du premier triplet de valeurs identiques. 


exemple :

    >>> ptriplet("aaabcd")
    ('a', 0)
    >>>  ptriplet(['z','a','a','a','b'])
    ('a', 1)

Et None sinon.

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
