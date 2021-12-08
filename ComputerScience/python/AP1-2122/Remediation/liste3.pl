

author= DR
title=Deux listes again

tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]


text==

Ecrire une fonction **bling** qui prend deux listes en paramêtres : $%l1 , l2%$.  

Et qui retourne {{formule}} sans modifier $%l1 , l2%$. 

==

before==
import random
def f0(l,c):
    ll=[]
    for e in l:
        if not e in c:
            ll.append(e)
    return ll

def f1(l,c):
    ll=[]
    for e in l:
        if e in c:
            ll.append(e)
    return ll


formule, f= random.choice([
('les elements de l1 qui ne sont pas dans l2',f0),
('les elements de l1 qui sont dans l2',f1),
])


pltest= f"""
>>> l=[1,2,3]; bling(l,[4])
{f([1,2,3],[4])}
>>> l==[1,2,3]# l1 pas modifée
True
>>> bling([1,2,3],[3,7,8,9])
{f([1,2,3],[3,7,8,9])}
>>> bling([1,2,3],[])
{f([1,2,3],[])}
>>> bling([1,2,3],[1,2,3])
{f([1,2,3],[1,2,3])}
"""
==


code==
def place(l,c):
    l.insert(XX,c)
==
