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
>>> l=[1,2,3]; place(l,4);l # Petite liste
{f([1,2,3],4)}
>>> l=[];place(l,1); l # Liste vide 
[1]
>>> place(l,1); l # Ajout de 1
[1, 1]
>>> place(l,2); l # Ajout de 2
{f([1,1],2)}
>>> place(l,34); l # Ajout de 34
{f(f([1,1],2),34)}

"""
==


code==
def place(l,c):
    l.insert(XX,c)
==
