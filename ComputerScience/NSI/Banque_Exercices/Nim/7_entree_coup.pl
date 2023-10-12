extends = pltest_before.pl
# extends = /ComputerScience/python/template/pltest.pl

title= Entree du coup

befor==
def coup_possible(nb_alumette, plateau,k):
        if nb_alumette <= len(plateau) and nb_alumette <= k and nb_alumette > 0:
            return True
        else:
            return False
==

text==


Ecrire une fonction **entree_coup** qui vérifie le doctest suivant :

    la fonction entree_coup(joueurs, joueur_actif, plateau, k) demande au joueur 
    actif combien il veut enlever d'alumettes. La saisie est contôlée en
    vérifiant que le coup est possible (vous pouvez utiliser la fonction coup_possible
    définie précédemment).

    exemple:
    >>> coup = entree_coup(['Bob', 'Alice'], 1, ['|', '|', '|', '|'], 3)
    Alice combien voulez vous en enlever ? 5
    Impossible.
    Alice combien voulez vous en enlever ? 3
    >>> coup
    3


==



pltest==
>>> from unittest.mock import patch #
>>> with patch('builtins.input', side_effect=['5', '3']):
...    coup = entree_coup(['Bob', 'Alice'], 1, ['|', '|', '|', '|'], 3) #
>>> coup
3
==








