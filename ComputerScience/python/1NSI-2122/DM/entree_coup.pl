
extends = func.pl
@ /builder/before.py [builder.py]

funcname= entree_coup
title= Entree du coup



doctest==
    la fonction entree_coup(joueurs, joueur_actif, plateau, k) demande au joueur 
    actif combien il veut enlever d'alumettes. La saisie est contôlée en
    vérifiant que le coup est possible.

    exemple:
    >>> joueurs = entree_joueurs() 
    >>> joueurs
    ['Bob', 'Alice']
  
==

before==
def coup_possible(nb_alumette, plateau,k):
    if nb_alumette <= len(plateau) and nb_alumette <= k and nb_alumette > 0:
        return True
    else:
        return False

after=before
==

pltest==
>>> from unittest.mock import patch #
>>> with patch('builtins.input', side_effect=['5', '3']):    coup = entree_coup(['Bob', 'Alice'], 1, ['|', '|', '|', '|'], 3) #
>>> coup
3
==




