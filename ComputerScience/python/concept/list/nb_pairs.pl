
title= Nombre d'entiers pairs dans une liste d'entiers
extends=/ComputerScience/python/template/pltest.pl

text==

Ecrire une fonction **nb_pairs** qui prend une liste en paramêtre et 
qui retourne le nombre d'entiers pairs de la liste.

==

pltest==
>>> nb_pairs([2,4,5,6,77])
3
>>> nb_pairs([])
0
>>> import random #
>>> l=[ random.randint(1,100)*2 for x in range(10)] #
>>> nb_pairs(l) == len(l) # Tous pairs 
True
>>> nb_pairs([ x+1 for x in l]) # Tous impairs
0
==



