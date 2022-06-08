extends= template/cgtemplate.pl

author=CG
title=Test

tag=function

text==
Ecrire un programme qui prend en entrée deux entiers séparés par un retour à la ligne et qui écrit leur somme dans
la sortie standard
==

cgtest==
>>> test('1\n2\n') # Somme simple
'3'
>>> test('-6\n4\n') # Somme avec négatif
'-2'
>>> from random import randint; a = randint(0, 100); test('2 ' + str(a)) == str(2 + a) # Test aléatoire
True
==
