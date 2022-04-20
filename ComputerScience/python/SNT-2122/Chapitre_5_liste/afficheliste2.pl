extends= /ComputerScience/python/AP1-1920/templates/pltest.pl

title = Afficher liste avec virgules

text==

Ecrire une fonction `affiche(lst)` à un paramètre (une liste) qui ne retourne rien mais qui affiche tous les éléments de la liste sur une ligne séparés par une virgule.

Exemple:

    >>> affiche(['bonjour','3','fois'])
    bonjour, 3, fois
==


samplesol==
# solution
def affiche(lst) :
    chaine =''
    nb = 0
    for elem in lst:
        if nb == 0:
            chaine += str(elem)
            nb += 1
        else:
            chaine += ', ' + str(elem)
    if nb == 1:
        print(chaine)
==

pltest0==
>>> affiche(['bonjour','3','fois'])
bonjour, 3, fois
>>> affiche([1, 2, 3, 4])
1, 2, 3, 4
==

pltest1==
>>> affiche([])
==




