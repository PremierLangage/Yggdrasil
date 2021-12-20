
extends = func.pl

funcname= entree_joueurs
title= Entree des noms des joueurs

doctest==
    la fonction entree_joueurs() demande le nom des deux joueurs
    et les retournent dans une liste

    exemple:
    >>> joueurs = entree_joueurs() 
    >>> joueurs
    ['Bob', 'Alice']
  
==

pltest==
>>> from unittest.mock import patch
>>> with patch('builtins.input', side_effect=['Bob', 'Alice']):    joueurs = entree_joueurs() 
>>> joueurs
['Bob', 'Alice']
==



