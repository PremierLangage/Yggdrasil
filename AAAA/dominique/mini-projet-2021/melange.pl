


extends = func.pl

funcname=melange
title= Mélanger un jeux de cartes 

doctest==
La fonction melange(deck,seed=None) melange de façon aléatoire avec le module random la liste deck passé en parametre.
Si seed est non None seed est utilisé pour initialiser la graine du générateur aléatoire.

==

pltest==
>>> import random
>>> random.seed(0)
>>> l=[x for x in range(100)]
>>> melange(l)
>>> l
>>> melange(l)
>>> l
>>> melange(l,0)
>>> l
==

