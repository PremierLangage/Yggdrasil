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


taboo = len|append|pop

pltest==
>>> ma_liste_chainee = [["c", ["c", ["c", ["c", ["o", ["o", ["c", ["a", None]]]]]]]]] #
>>> sup_doublons(ma_liste_chainee) # Ne renvoie rien
>>> afficher(ma_liste_chainee) # liste chainee modifiee
|c|*|-->|o|*|-->|c|*|-->|a|None|
==

soluce == 
def sup_doublons(liste_chainee):
    i = 0
    while i < taille(liste_chainee) - 1:
        anc = get_valeur_maillon_indice(liste_chainee, i)
        if anc == get_valeur_maillon_indice(liste_chainee, i + 1):
            supprimer_apres(liste_chainee, get_maillon_indice(liste_chainee, i))
        else:
            i += 1

== 



