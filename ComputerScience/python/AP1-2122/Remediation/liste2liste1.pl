



author= DR
title=En place

tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]


text==

Ecrire une fonction **ou** qui prend deux paramêtres une liste de liste et une valeur : $%l , v%$.  

Qui retourne si  v {{position}} dans les valeurs de l.

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
])

def bf():
    return [[5]*8]*20
def br():
    return [[random.randint(2,10) for x in range(109)] for y in range(12) ]
palteau= bf()
rom= br()
pltest= f"""
>>> palteau={palteau}; ou(palteau,5)
{f(palteau,5)}
>>> palteau={palteau}; ou(palteau,2)
{f(palteau,2)}
>>> palteau={rom}; ou(palteau,5)
{f(rom,5)}
>>> palteau={rom}; ou(palteau,-1)
{f(rom,-1)}
"""
==


code==
def place(l,c):
    l.insert(XX,c)
==
