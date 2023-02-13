extends= /ComputerScience/python/AP1-1920/templates/pltest.pl

title = Afficher liste de listes

text==

Ecrire une fonction `affiche(lst)` à un paramètre (une liste de listes) qui ne retourne rien mais qui affiche tous les éléments de cette liste de listes ligne par ligne. Chaque ligne correpondra au contenu d'une liste dans la grande liste.

Exemple:

    >>> affiche([['bonjour','3','fois'],[1, 2, 3, 4],['2nde6','bravo']])
    bonjour3fois
    1234
    2nde6bravo
==


samplesol==
# solution
def affiche(lst) :
    for ligne in lst:
        chaine = ''
        for elem in ligne:
            chaine += str(elem)
        print(chaine)
==

pltest0==
>>> affiche([['bonjour','3','fois'],[1, 2, 3, 4],['2nde6','bravo']])
bonjour3fois
1234
2nde6bravo
>>> affiche([['bonjour','3','fois']])
bonjour3fois
==

pltest1==
>>> affiche([])
==





