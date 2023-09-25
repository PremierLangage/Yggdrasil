extends = func.pl

funcname=pile_vide_a
title= Initiation d'une pile

doctest==

    la fonction pile_vide_a(n) retourne une pile avec n fois le caractere 'a'
    exemple:
    >>> afficher(pile_vide_a(5))
    |5|5|5|5|5

==

pltest==
>>> pile_vide_a(5)
['a', 'a', 'a', 'a', 'a']
==
