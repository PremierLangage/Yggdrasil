
@ /builder/before.py [builder.py]
extends = func.pl

funcname= autre_joueur
title= Donne l'autre joueur

pltest==
>>> autre_joueur("joueur1")
'joueur2'
>>> autre_joueur("joueur2")
'joueur1'
==

before== #|python| 
from random import randint

def autre_joueur(joueur):
    if joueur == "joueur1":
        return "joueur2"
    elif joueur == "joueur2":
        return "joueur1"

==

doctest==
    la fonction autre_joueur(joueur) donne l'information de quel 
    est l'autre joueur: "joueur1" ou "joueur2".
    Si joueur est "joueur1" alors la fonction 
    retourne "joueur2" et inversement.

    exemple:
    >>> autre_joueur("joueur2")
    'joueur1'
    
==






