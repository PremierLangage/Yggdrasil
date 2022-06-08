author=CG
title=Test

tag=function # N'oubliez pas de remplir ce champs svp
extends= template/cgtemplate.pl
@ /builder/before.py [builder.py]


text==
Ecrire un programme qui écrit le successeur de l'entier envoyé en entrée
==

before==
cgtest= f"""
>>> test('1') # Test 1
'2'
>>> test('2') # Test 2
'3'
>>> test('-3') # Test négatif
'-2'
>>> from random import randint; n = randint(0, 100); test(str(n)) # Test aléatoire
{str(n + 1)}
"""
==
