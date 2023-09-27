extends = func.pl

funcname=sup_doublons
title= Suppression des doublons dans une liste chainee

doctest==
    la fonction sup_doublons(liste_chainee) ne renvoie rien mais enlève les maillons ayant les memes valeurs que le maillon precedent.
    exemple:
    >>> afficher(ma_liste_chainee)
    |"c"|*|-->|"c"|*|-->|"c"|*|-->|"o"|*|-->|"o"|*|-->|"c"|*|-->|"a"|None|
    >>> sup_doublons(ma_liste_chainee)
    >>> afficher(ma_liste_chainee)
    |"c"|*|-->|"o"|*|-->|"c"|*|-->|"a"|None|
==


taboo = len|append|pop|taille

pltest==
>>> ma_liste_chainee = ["c", ["c", ["c", ["c", ["o", ["o", ["c", ["a", [None]]]]]]]]] #
>>> sup_doublons(ma_liste_chainee) # Ne renvoie rien
>>> ma_liste_chainee # file modifiee
["c", ["o", ["c", ["a", [None]]]]]
==

soluce == 
def sup_doublons(liste_chainee):
    sauv = file_vide()
    while not est_vide(f):
        elem = defiler(f)
        if elem % 2 != 0:
            enfiler(sauv, elem)
    while not est_vide(sauv):
        enfiler(f, defiler(sauv))
== 



