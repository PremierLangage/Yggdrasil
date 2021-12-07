author= DR
title=En place

tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]


text==

Ecrire une fonction **place** qui prend deux paramêtres une liste et une valeur : $%l , v%$.  

Qui ajoute $%v%$ **{{position}}** dans la liste $%l%$.

==

before==
import random
def f0(l,c):
    l.insert(0,c)
    return l
def f1(l,c):
    l.insert(1,c)
    return l
def fn(l,c):
    l.insert(len(l),c)
    return l


position, f= random.choice([
('au début',f0),
('en deuxième position',f1),
('a la fin',fn)
])


pltest= f"""
>>> l=[1,2,3]; place(l,4)
>>> l
{f([1,2,3],4)}
>>> l=[];place(l,1)# Tss tss
>>> l
[1]
>>> place(l,1)
>>> l
[1, 1]
>>> place(l,2)
>>> l
{f([1,1],2)}
"""
==

