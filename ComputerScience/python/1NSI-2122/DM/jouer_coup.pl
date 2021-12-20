extends = func.pl

funcname= joueur_coup
title= Joueur le coup

doctest==
    la fonction jouer_coup(nb_alumette, plateau) enlève de 
    la liste plateau (sur place) le nombre d'alumettes nb_alumette.

    exemple:
    >>> plateau = ['|', '|', '|', '|', '|']
    >>> jouer_coup(3, plateau)
    >>> plateau
    ['|', '|']

    
==

pltest==
>>> coup_possible(4, ['|', '|', '|', '|', '|'],3)
False
>>> coup_possible(3, ['|', '|', '|', '|', '|'],3)
True
>>> coup_possible(3, ['|', '|'],3)
False
==



