




extends = func.pl

funcname=init_plateau
title= Initiation du plateau

doctest==

    la fonction init_plateau(n) retourne un tableau de n fois le
    même caractère '|'.
    exemple:
    >>> init_plateau(5)
    ['|', '|', '|', '|', '|']

==

pltest==
>>> init_plateau(5)
['|', '|', '|', '|', '|']
>>> init_plateau(10)
['|', '|', '|', '|', '|', '|', '|', '|', '|', '|']
==

