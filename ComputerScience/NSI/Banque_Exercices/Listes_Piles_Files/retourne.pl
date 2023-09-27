extends = func.pl

funcname=retourne
title= Retournement d'une pile

doctest==

    la fonction retourne(p) renvoie une copie de la pile p retournée.
    exemple:
    >>> afficher(ma_pile)
    |b|o|n|j|o|u|r
    >>> ma_nouvelle_pile = retourne(ma_pile)
    >>> afficher(ma_nouvelle_pile)
    |r|u|o|j|n|o|b
    >>> afficher(ma_pile)
    |b|o|n|j|o|u|r
==


taboo = len|append|pop|taille

pltest==
>>> ma_pile = ['b', 'o', 'n', 'j', 'o', 'u', 'r'] #
>>> retourne(ma_pile) # renvoie d'une pile retournee
['r', 'u', 'o', 'j', 'n', 'o', 'b']
>>> ma_pile # pile initiale non modifiee
['b', 'o', 'n', 'j', 'o', 'u', 'r']
>>> ma_pile = ['h', 'e', 'l', 'l', 'o'] #
>>> retourne(ma_pile)  # renvoie d'une pile retournee
['o', 'l', 'l', 'e', 'h']
>>> ma_pile # pile initiale non modifiee
['h', 'e', 'l', 'l', 'o']
==

soluce == 
def retourne(p):
    q = pile_vide()
    res = pile_vide()
    while not est_vide(p):
        e = depiler(p)
        empiler(q, e)
        empiler(res, e)
    while not est_vide(q):
        empiler(p, depiler(q))
    return res
== 

