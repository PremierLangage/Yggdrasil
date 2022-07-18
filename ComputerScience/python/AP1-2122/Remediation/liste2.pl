
author= DR
title=Deux listes

tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]


text==

Ecrire une fonction **Spam** qui prend deux listes en paramêtres : $%l1 , l2%$.  

Et qui retourne {{formule}} sans modifier $%l1 , l2%$. 

==

before==
import random
def f0(l,c):
    return l+c
def f1(l,c):
    return c+l
def fn(l,c):
    l.insert(len(l),c)
    return l


formule, f= random.choice([
('concatenation de l1 et l2',f0),
('concatenation de l2 et l1',f1),
])


pltest= f"""
>>> Spam([1,2,3],[4])
{f([1,2,3],[4])}
>>> Spam([1,2,3],[3,7,8,9])
{f([1,2,3],[3,7,8,9])}
"""
==


code==
def place(l,c):
    l.insert(XX,c)
==
