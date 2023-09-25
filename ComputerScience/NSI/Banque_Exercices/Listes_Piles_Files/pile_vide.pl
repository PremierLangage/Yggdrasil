extends = func.pl

funcname=pile_vide_a
title= Initiation d'une pile

doctest==

    la fonction pile_vide_a(n) retourne une pile avec n fois le caractere 'a'
    exemple:
    >>> afficher(pile_vide_a(5))
    |a|a|a|a|a

==

pltest==
>>> pile_vide_a(5)
['a', 'a', 'a', 'a', 'a']
>>> pile_vide_a(7)
['a', 'a', 'a', 'a', 'a', 'a', 'a']
==

soluce == 
def pile_vide_a(n):
    p = pile_vide()
    for i in range(n):
        empiler(p, 'a')
    return p
== 