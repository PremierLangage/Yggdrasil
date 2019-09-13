# Boris Jabot 11/09/2019 OK
# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz 
title= Est Premier O(n^1/2)
tag=def|parameters|return # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/template/pltest.pl
piste=rouge
text==


## Est Premier

Écrire une fonction **estpremier** qui prend comme arguments un entier positif et qui retourne un booléen (True ou False) si l'entier passé en argument est premier on non.

Un nombre est premier si il n'est divisible que par 1 et par lui même.
Il faut donc tester les autres diviseurs possible si l'on en trouve un c'est fini et l'on peux retourner False sinon on n'en a pas trouvé et l'on peut retourner True.


ATTENTION cette fois ci nous testons des grands nombre si votre boucle n'est pas bien choisi votre programme prendra trops de temps.

Exemples :

	>>> estpremier(10000000000003)
	True

==

pltest==
	>>> estpremier(2)
	True
	>>> estpremier(12)
	False
	>>> estpremier(97)
	True
	>>> estpremier(65537)
	True
	>>> [ estpremier(10**n+3) for n in range(3,12) ] # Des grands nombres premiers 
	[False, False, True, True, False, False, False, False, True]
==


testcode==
def estpremier(p):
   if p%2==0:
	return False
   i=3
   while i*i < p:
      if p % i == 0:
         return False
      i=i+2
   return True
==


