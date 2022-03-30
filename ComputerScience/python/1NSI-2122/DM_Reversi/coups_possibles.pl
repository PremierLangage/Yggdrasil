extends = func.pl

funcname= coups_possibles
title= Quels sont les coups possibles ?

doctest==
    la fonction coups_possibles(jeu) retourne la liste des coups possibles.
    Il s'agit donc d'une liste de tuples

    exemple:
    
    >>> coups_possibles(4, ['|', '|', '|', '|', '|'],3)
    False
    >>> coup_possible(3, ['|', '|', '|', '|', '|'],3)
    True
    >>> coup_possible(3, ['|', '|'],3)
    False
    
==

pltest==
>>> coup_possible(4, ['|', '|', '|', '|', '|'],3)
False
>>> coup_possible(3, ['|', '|', '|', '|', '|'],3)
True
>>> coup_possible(3, ['|', '|'],3)
False
==


