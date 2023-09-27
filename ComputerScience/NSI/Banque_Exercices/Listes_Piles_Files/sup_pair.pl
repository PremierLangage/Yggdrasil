extends = func.pl

funcname=sup_pair
title= Suppression des éléments pairs d'une file

doctest==
    la fonction sup_pair(f) ne renvoie rien mais enlève les éléments pairs de la file f (sans modifier le reste).
    exemple:
    >>> afficher(ma_file)
    0|1|5|6|10|3|2
    >>> sup_pair(ma_file)
    >>> afficher(ma_file)
    1|5|3
==


taboo = len|append|pop|taille|empiler|depiler

pltest==
>>> ma_file = [0, 1, 5, 6, 10, 3, 2] #
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


