
#author=EBE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]
title = Afficher les "n" premiers multiples d'un entier "x"


text==  

Ecrire une fonction `affiche_table` qui : <br> 
* prend en paramètre deux entiers strictement positif : <br>
    + un entier x  <br>
    + un entier n <br>
*imprime les n premiers multiples de x.

Exemples:

    >>> affiche_table(5,3)
    5
    10
    15
    >>> affiche_table(6,4)
    6
    12
    18
    24

==


before==

==


pltest==
    >>> affiche_table(5,3)
    5
    10
    15
    >>> affiche_table(6,4)
    6
    12
    18
    24
==


















