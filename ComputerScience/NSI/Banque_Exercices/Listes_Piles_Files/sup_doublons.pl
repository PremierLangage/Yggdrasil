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
>>> ma_liste_chainee = [0, 1, 5, 6, 10, 3, 2] #
>>> sup_pair(ma_file) # Ne renvoie rien
>>> ma_file # file modifiee
[1, 5, 3]
==

soluce == 
def sup_pair(f):
    sauv = file_vide()
    while not est_vide(f):
        elem = defiler(f)
        if elem % 2 != 0:
            enfiler(sauv, elem)
    while not est_vide(sauv):
        enfiler(f, defiler(sauv))
== 



