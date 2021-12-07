


author= DR
title=Trois listes 

tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]


text==

Ecrire une fonction **bling** qui prend deux listes en paramêtres : $%l1 , l2, l3%$.  

Et qui retourne {{formule}} sans modifier $%l1 , l2, l3%$. 

==

before==
import random
def f0(l,c, w):
    ll=[]
    for e in l:
        if not e in c and not e in w:
            ll.append(e)
    return ll

def f1(l,c):
    ll=[]
    for e in l:
        if e in c or e in w:
            ll.append(e)
    return ll


formule, f= random.choice([
('les elements de l1 qui ne sont ni dans l2 ni dans l3',f0),
('les elements de l1 qui sont dans l2 ou L3',f1),
])


pltest= f"""
>>> tripatouille([1,2,4,5, 6, 7],[1,2],[6,7])
{f([1,2,4,5, 6, 7],[1,2],[6,7])}
>>> tripatouille([],[1,2],[6,7])
{f([],[1,2],[6,7])}
>>> tripatouille([1,2,4,5, 6, 7],[1,2,3,33,100,123],[6,7,99])
{f([1,2,4,5, 6, 7],[1,2],[6,7])}
"""
==


code==
def place(l,c):
    l.insert(XX,c)
==
