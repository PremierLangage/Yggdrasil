author=Emmanuel Brunache
name= Tri de 2 valeurs
title= Tri de 2 valeurs # N'oubliez pas de remplir ce champs svp
tag=def|parameters|return # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/template/pltest.pl
piste=verte
text==

Écrire une fonction **tri3valeurs(val1, val2, val3)** qui prend comme arguments trois entiers et qui retourne les valeurs de la plus petite à la plus grande.

Exemples :

    >>> tri3valeurs(5, 2, 1)
    (1, 2, 5)
    >>> tri2valeurs(10, 10, 3)
    (3, 10, 10)
    >>> tri2valeurs(3, 7, 4)
    (3, 4, 7)
    >>> tri2valeurs(30, -7, 2)
    (-7, 2, 30)

==

pltest==
    >>> tri3valeurs(5, 2, 1)
    (1, 2, 5)
    >>> tri2valeurs(10, 10, 3)
    (3, 10, 10)
    >>> tri2valeurs(3, 7, 4)
    (3, 4, 7)
    >>> tri2valeurs(30, -7, 2)
    (-7, 2, 30)
==


testcode==
def tri2valeurs(val1, val2):
    if val1 > val2:
        return val2, val1
    else:
        return val1, val2
==






