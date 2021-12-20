def affiche_plateau(plateau):
    print(" ".join(plateau))


extends = func.pl

funcname= affiche_plateau
title= Affichage du plateau

doctest==
    la fonction affiche_plateau(plateau) affiche une chaine de 
    caractère composé des éléments de la liste plateau séparés
    d'un espace.

    exemple:
    >>> affiche_plateau(['|', '|', '|', '|', '|']) 
    | | | | |
  
==

pltest==
>>> affiche_plateau(['|', '|', '|', '|', '|']) 
| | | | |
==



