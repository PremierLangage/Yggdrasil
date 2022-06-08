author=CG
title=Test

tag=function # N'oubliez pas de remplir ce champs svp
extends= template/cgtemplate.pl
@ /builder/before.py [builder.py]


text==
Ecrire un programme qui prend une liste d'entiers séparés par des retours à la ligne et qui affiche le max
==

before==
cgtest= f"""
>>> test('1') # Test 1
'2'
>>> test('2') # Test 2
'3'
>>> test('-3') # Test négatif
'-2'
>>> from random import randint; n = randint(0, 100); test(str(n)) == str(n + 1) # Test aléatoire
True
"""
==
