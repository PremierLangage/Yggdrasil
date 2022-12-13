
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
    la fonction fin_de_jeu(jeu) renvoie True si le joueur actif n'a aucun coup possible ou si 
    il n'y a plus de place sur le plateau (si la somme des scores est égale au nombre de case
    sur le plateau). Renvoie False dans le cas contraire

    exemple:
    >>> jeu = {
    >>> fin_de_jeu({})
    True
    >>> fin_de_jeu({(1,2):[(1,1)]})
    False
    
==






