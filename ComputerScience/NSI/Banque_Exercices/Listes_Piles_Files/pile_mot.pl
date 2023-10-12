extends = func.pl

funcname=pile_mot
title= Initiation d'une pile à partir d'une expression

doctest==

    la fonction pile_mot(expr) retourne une pile des caractères composant la chaine de caractères expr
    exemple:
    >>> afficher(pile_mot('bonjour'))
    |b|o|n|j|o|u|r

==


taboo = len|append|pop|taille

pltest==
>>> pile_mot('bonjour')
['b', 'o', 'n', 'j', 'o', 'u', 'r']
>>> pile_mot('hello')
['h', 'e', 'l', 'l', 'o']
==

soluce == 
def pile_mot(expr):
    p = pile_vide()
    for carac in expr:
        empiler(p, carac)
    return p
== 
