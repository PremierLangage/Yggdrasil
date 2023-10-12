author=Emmanuel Brunache
name= Tri de 2 valeurs
title= Tri de 2 valeurs # N'oubliez pas de remplir ce champs svp
tag=def|parameters|return # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/template/pltest.pl
piste=verte
text==

Écrire une fonction **tri2valeurs(val1, val2)** qui prend comme arguments deux entiers et qui retourne la plus petite valeur suivi de la plus grande valeur.

Exemples :

    >>> tri2valeurs(5, 2)
    (2, 5)
    >>> tri2valeurs(10, 10)
    (10, 10)
    >>> tri2valeurs(3, 7)
    (3, 7)
    >>> tri2valeurs(30, -7)
    (-7, 30)

==

pltest==
    >>> tri2valeurs(5, 2)
    (2, 5)
    >>> tri2valeurs(10, 10)
    (10, 10)
    >>> tri2valeurs(3, 7)
    (3, 7)
    >>> tri2valeurs(30, -7)
    (-7, 30)
==


testcode==
def tri2valeurs(val1, val2):
    if val1 > val2:
        return val2, val1
    else:
        return val1, val2
==


editor.code==
def tri2valeurs(val1, val2):
    ...
==
