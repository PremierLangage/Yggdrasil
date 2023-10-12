extends= /ComputerScience/python/AP1-1920/templates/pltest.pl

title = Afficher liste

text==

Ecrire une fonction `affiche(lst)` à un paramètre (une liste) qui ne retourne rien mais qui affiche tous les éléments de la liste.

Exemple:

    >>> affiche(['bonjour','3','fois'])
    bonjour
    3
    fois
==


samplesol==
# solution
def affiche(lst) :
    for elem in lst:
        print(elem)
==

pltest0==
>>> affiche(['bonjour','3','fois'])
bonjour
3
fois
>>> affiche([1, 2, 3, 4])
1
2
3
4
>>> affiche([])
==






