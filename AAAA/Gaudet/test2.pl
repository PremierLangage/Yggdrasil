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
>>> test('1\n2\n3\n4\n') # Test 1
'4'
>>> test('45\n2\n987\n-4\n') # Test 2
'987'
"""
==
