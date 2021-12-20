def affiche_plateau(plateau):
    print(" ".join(plateau))


extends = func.pl

funcname= affiche_plateau
title= Affichage du plateau

doctest==
    la fonction affiche_plateau(plateau) 

    exemple:
    >>> affiche_plateau(['|', '|', '|', '|', '|']) 
    | | | | |
  
==

pltest==
>>> from unittest.mock import patch #
>>> with patch('builtins.input', side_effect=['Bob', 'Alice']):    joueurs = entree_joueurs() #
>>> joueurs
['Bob', 'Alice']
==



