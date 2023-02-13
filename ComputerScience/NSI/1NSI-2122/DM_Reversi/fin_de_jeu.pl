
@ /builder/before.py [builder.py]
extends = func.pl

funcname= fin_de_jeu
title=Fin de jeu

pltest==
>>> fin_de_jeu({})
True
==

before== #|python| 
from random import randint

dico= {(randint(2,3),randint(3,8)):[(1, randint(-1,1))]}
bool = False
pltest += """
>>> dico = {} #
>>> fin_de_jeu(dico)
{}
""".format(dico, bool)
==

doctest==
    la fonction fin_de_jeu(dico_coups_possibles) renvoie True si le dictionnaire dico_coups_possibles est vide et False sinon

    exemple:
    >>> fin_de_jeu({})
    True
    >>> fin_de_jeu({(1,2):[(1,1)]})
    False
    
==






