author= DR
title=En place

tag=function # N'oubliez pas de remplir ce champs svp
extends= template/pltest.pl
@ /builder/before.py [builder.py]


text==

Ecrire un programme qui écrit ce qu'il reçoit

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
