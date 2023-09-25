extends = func.pl

funcname=pile_de_a
title= Initiation d'une pile

doctest==

    la fonction pile_de_a(n) retourne une pile de n fois le caractere 'a'
    exemple:
    >>> afficher(pile_de_a(5))
    |a|a|a|a|a

==


taboo = len|append|pop|taille

pltest==
>>> pile_de_a(5)
['a', 'a', 'a', 'a', 'a']
>>> pile_de_a(7)
['a', 'a', 'a', 'a', 'a', 'a', 'a']
==

soluce == 
def pile_de_a(n):
    p = pile_vide()
    for i in range(n):
        empiler(p, 'a')
    return p
== 