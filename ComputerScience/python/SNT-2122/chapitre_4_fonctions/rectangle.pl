author=Emmanuel Brunache
name= Rectangle
title= Rectangle # N'oubliez pas de remplir ce champs svp
tag=def|parameters|return # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/template/pltest.pl
piste=verte
text==

Écrire une fonction **rectangle(longueur, largeur)** qui prend comme arguments deux entiers et qui retourne le périmètre et l'aire d'un rectangle de côté `largeur` et `longueur`.

Exemples :

    >>> rectangle(2,3)
    (10, 6)
    >>> rectangle(10,10)
    (40, 100)
    >>> rectangle(3,7)
    (20, 21)

==

pltest==
    >>> rectangle(2,3)
    (10, 6)
    >>> rectangle(10,10)
    (40, 100)
    >>> rectangle(3,7)
    (20, 21)
==


testcode==
def rectangle(longueur, largeur):
   return (longueur + largeur) * 2, longueur * largeur
==




