
extends = func.pl

funcname= victoire
title= Victoire

doctest==
    la fonction victoire(plateau) vérifie qu'il reste reste des 
    alumettes sur le plateau.
    Si la longueur de la liste plateau est nulle, la fonction
    retourne True.
    Sinon la fonction retourne False.

    exemple:
    >>> victoire(['|', '|']) 
    False
    >>> victoire([])
    True
  
==

pltest==
>>> victoire(['|', '|']) 
False
>>> victoire([])
True
==



