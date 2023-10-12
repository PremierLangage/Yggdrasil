author=Emmanuel Brunache
name= Est positif
title= Est positif   # N'oubliez pas de remplir ce champs svp
tag=def|parameters|return # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/template/pltest.pl
piste=verte
text==


## Est Positif

Écrire une fonction **estpositif** qui prend comme arguments un entier et qui retourne un booléen (True ou False) si l'entier passé en argument est positif ou non.

Exemples :

    >>> estpositif(2)
    True
    >>> estpositif(-12)
    False
    >>> estpositif(97)
    True
    >>> estpositif(-65537)
    False

==

pltest==
    >>> estpositif(2)
    True
    >>> estpositif(-12)
    False
    >>> estpositif(97)
    True
    >>> estpositif(-65537)
    False
==


testcode==
def estpositif(p):
   return p > 0 
==

editor.code==
==



