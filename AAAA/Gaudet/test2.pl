author=CG
title=Test

tag=function
extends= template/cgtemplate.pl


text==
Ecrire un programme qui prend une liste d'entiers séparés par des retours à la ligne et qui affiche le max.
Le premier nombre envoyé correspondant à la taille de la liste
==



cgtest==
>>> test('4\n1\n2\n3\n4\n') # Test 1
'4'
>>> test('4\n64\n21\n1\n89\n3\n73\n') # Test 2
'89'
==

