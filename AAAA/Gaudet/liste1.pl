author= DR
title=En place

tag=function # N'oubliez pas de remplir ce champs svp
extends= template/pltest.pl
@ /builder/before.py [builder.py]


text==

Ecrire une fonction **place** qui prend deux paramêtres une liste et une valeur : $%l , v%$.  

Qui ajoute en place $%v%$ **{{position}}** dans la liste $%l%$.

==

before==
pltest= f"""
>>> test('1') # Test 1
'1'
>>> test('2') # Test 2
'2'
"""
==


code==
def place(l,c):
    l.insert(XX,c)
==
