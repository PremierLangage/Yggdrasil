

# Author: Justine Falque

extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

#author=Justine Falque
title=Trouver Charlie dans un dictionnaire

text==

Ecrire une fonction ``trouve_charlie(maison)`` qui prend en paramètre un dictionnaire ``maison`` et cherche si la chaîne de caractères ``'Charlie'`` fait partie des valeurs. Si oui, elle renvoie la clé de la première occurrence. Si non, elle renvoie ``False``.
==

tag=dictionary

samplesol==
def trouve_charlie(maison):
    for cachette in maison:
        if maison[cachette] == 'Charlie' :
            return cachette
    return False
==

before==
==

pltest0==
>>> d1 = {'jardin':0, 'sdb':0, 'salon':'Charlie'}  # initialisation
>>> trouve_charlie(d1)  # Charlie Est Dedans
'salon'
==

pltest1==
>>> trouve_charlie({})  # Vide
False
>>> d1 = {'jardin':0, 'sdb':0, 'salon':'charlie'}  # initialisation
>>> trouve_charlie(d1)  # Sans Majuscule
False
==

pltest2==
>>> d1 = {'jardin':0, 'sdb':0, 'garage':'Charlie', 'chambre':'Charlie'}  # initialisation
>>> trouve_charlie(d1)  # Deux Charlie
'garage'
==




