



author= DR
title=En place

tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]


text==

Ecrire une fonction **ou** qui prend deux paramêtres une liste de liste et une valeur : $%l , v%$.  

Qui retourne si  v {{formule}} dans les valeurs de l.

==

before==
import random
def f0(l,c):
    for row in l:
        if c in row:
            return True
    return False
def f1(l,c):
    for row in l:
        if c in row:
            return False
    return True

def fn(l,c):
    app=False
    for row in l:
        if c in row:
            if app==True:
                return True
            app=True
    return False


position, f= random.choice([
('apparait',f0),
('n\'apparait pas',f1),
('apparait au moins deux fois',fn)
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
