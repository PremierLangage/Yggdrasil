
title= Impairs et Manque ?
extends=/ComputerScience/python/template/pltest.pl

text==

Ecrire une fonction **exist_impairs** qui prend une liste en paramêtre 
et qui retourne True si il existe un entier impair dans la liste.

Remarque: Pouvez vous utiliser tous_pairs ?
==

pltest==
>>> not exist_impairs([2,4,5,6,77])
False
>>> exist_impairs([])
False
>>> import random #
>>> l=[ random.randint(1,100)*2 for x in range(10)] #
>>> exist_impairs(l) # Test avec longue liste de pairs
False
>>> exist_impairs([ x+1 for x in l])# Longue liste d'impairs
True
==

