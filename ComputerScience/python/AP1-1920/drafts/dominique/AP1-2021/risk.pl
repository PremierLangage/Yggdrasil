


# DR 10/09/2020
tag=list
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl

title= Un combat dans Risk

text==


Dans le jeu de plateau Risk, il y a la situation où l'attaquant lance 3 dés tandis que le défenseur lance
 2 dés. Pour déterminer le résultat, le dé le plus élevé de chaque joueur est comparé, suivi du dé le plus élevé suivant. Pour chaque cas, le dé de l'attaquant doit être supérieur à celui du défenseur pour gagner. Le perdant perdra 1 armée dans chaque cas.
La fonction attaque fournis le résultat d'une attaque du jeu risk.

Si la valeur retournée est vrai c'est le défenseur qui perd une armée. 
Si la valeur retournée est fausse c'est l'attaquant qui perd une armée. 


Exemple de doctest :

    >>> attaque([5,6,4],[6,6])
    False
    >>> attaque([1,4,6],[4,2])
    True


==

pltest0==
>>> attaque([5,6,4],[6,6])
False
>>> attaque([5,6,4],[6,5])
False
>>> attaque([5,6,4],[4,6])
True
>>> attaque([1,4,6],[5,5])
True
>>> attaque([1,2,1],[2,2])
False
==

editor.code==
def attaque


==
editor.height=145

