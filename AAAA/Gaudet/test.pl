extends= template/cgtemplate.pl

author=CG
title=Test

tag=function # N'oubliez pas de remplir ce champs svp

text==
Ecrire un programme qui écrit le successeur de l'entier envoyé en entrée
==

languages==
c
python
==

cgtest==
>>> test('1') # Test 1
'2'
>>> test('2') # Test 2
'3'
>>> test('-3') # Test négatif
'-2'
>>> from random import randint; n = randint(0, 100); test(str(n)) == str(n + 1) # Test aléatoire
True
==
