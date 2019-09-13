# Boris Jabot 10/09/2019 OK
# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz 
title= Puissances Max
extends=/ComputerScience/python/template/pltest.pl
piste=rouge
text==

Ecrire une fonction **pm** qui recoit un argument entier **n** 
qui affiche sur une ligne,  
l'exposant de la puissance maximale de 2 qui divise chaque nombre de 1 à n.

Par exemple:

    >>> pm(15)  
    0,1,0,2,0,1,0,3,0,1,0,2,0,1,0 

$% 2^0 divise 1, 2^1 divise 2, 2^0 divise 3, etc %$

==

code==

def pm(n):
	pass

==


pltest==
>>> pm(1)
0
>>> pm(15)
0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0
>>> pm(100)
0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 5, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 6, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 4, 0, 1, 0, 2, 0, 1, 0, 3, 0, 1, 0, 2, 0, 1, 0, 5, 0, 1, 0, 2
==

comment==
# pour changer avec des valeurs d'entrée aléatoires 
pl=lambda k:[len(bin(t+1&~t))-3for t in range(k)]
def pm(n):
	for x in pl(n):
		print(x,end=", ")
	print()
==


