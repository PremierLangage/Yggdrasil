extends = func.pl

funcname= coup_possible
title= Le coup est-il possible ?

doctest==

    la fonction coup_possible(nb_alumette, plateau,k) retourne si un coup est possible.
    Si le nombre d'alumettes choisis par le joueur est:
     - inférieur au égal à k, et
     - inférieur ou égal au nombre d'alumettes disponibles, c'est à dire à la 
     longueur de la liste plateau, et
     - supérieur ou égal à 0
     alors la fonction retourne True
     sinon la fonction retourne False

    exemple:
    >>> coup_possible(4, ['|', '|', '|', '|', '|'],3)
    False
    >>> coup_possible(3, ['|', '|', '|', '|', '|'],3)
    True
    >>> coup_possible(3, ['|', '|'],3)
    False
==

pltest==
>>> coup_possible(4, ['|', '|', '|', '|', '|'],3)
False
>>> coup_possible(3, ['|', '|', '|', '|', '|'],3)
True
>>> coup_possible(3, ['|', '|'],3)
False
==


