






author= DR
title=Parcours de liste

tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]


text==

Ecrire une fonction **doublev** qui prend deux paramêtres une liste et une valeur : $%l , v%$.  

Qui retourne l'indice de deux occurances consécutives de $%v%$ dans la liste.

Par exemple: l= [1,2,2,3] et v=2 retourne 1 var l[1]==2 et l[2]==2.

Retourne -1 si il n'y a pas deux occurences de v consécutives.
==

before==
import random
def occ(l,c):
    for i in range(len(l)-1):
        if l[i]==c and l[i+1]==c:
            return i
    return -1

lp=[random.randint(3,8) for _ in range(20000)]

pltest= f"""
>>> doublev([1,2,4,5, 6, 7],2)
{occ([1,2,4,5, 6, 7],2)}
>>> doublev([1,2,4,5, 6,6, 7],6)
{occ([1,2,4,5, 6,6, 7],6)}
>>> doublev([1,2,4,5, 6, 7,7],7)
{occ([1,2,4,5, 6, 7,7],7)}
>>> doublev({lp},7)# Une grande liste
{occ(lp,7)}
>>> doublev({lp},12)# Une grande liste sans doublons
{occ(lp,12)}
"""
==


code==
def place(l,c):
    l.insert(XX,c)
==
