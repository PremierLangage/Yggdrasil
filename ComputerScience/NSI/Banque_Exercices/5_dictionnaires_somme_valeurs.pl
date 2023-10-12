

# Author: Justine Falque

extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

#author=Justine Falque
title=Sommer des valeurs sur un dictionnaire

text==

Ecrire une fonction ``somme_si_pair(d)`` qui prend en paramètre un dictionnaire ``d`` dont les clés et les valeurs sont des entiers, 
et renvoie la somme des valeurs associées aux clés paires.
==

editor.code==
==

tag=dictionary|ForIn|algo

samplesol==
def somme_si_pair(d):
    s = 0
    for cle in d :
        if cle%2 == 0 :
            s += d[cle]
    return s
==

before==
==

pltest0==
>>> somme_si_pair({})  # Sur Dictionnaire Vide
0
==

pltest1==
>>> d1 = {3:73, 24:53, 2:21, 13:3, 0:18}  # initialisation
>>> somme_si_pair(d1)  # Test Non Vide Positif
92
==

pltest2==
>>> d1 = {3:73, -24:51, 2:21, -13:3, 0:18}  # initialisation
>>> somme_si_pair(d1)  # Test Non Vide Avec Négatifs
90
==




