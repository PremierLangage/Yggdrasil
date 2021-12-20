def affiche_plateau(plateau):
    print(" ".join(plateau))


extends = func.pl

funcname= affiche_plateau
title= Affichage du plateau

doctest==
    la fonction entree_joueurs() demande le nom des deux joueurs
    et les retournent dans une liste

    exemple:
    >>> joueurs = entree_joueurs() 
    >>> joueurs
    ['Bob', 'Alice']
  
==

pltest==
>>> from unittest.mock import patch #
>>> with patch('builtins.input', side_effect=['Bob', 'Alice']):    joueurs = entree_joueurs() #
>>> joueurs
['Bob', 'Alice']
==



