


# Author: Justine Falque

extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

#author=Justine Falque
title=Liste des clés de valeur négative

text==

Ecrire une fonction ``liste_neg(d)`` qui prend en paramètre un dictionnaire ``d`` dont les les valeurs sont des nombres, 
et renvoie la liste des clés dont les valeurs associées sont strictement négatives.
==

tag=dictionary|ForIn|algo

samplesol==
def liste_neg(d) :
    res = []
    for cle in d :
        if d[cle] < 0 :
            res.append(cle)
    return res
==

before==
==

pltest0==
>>> liste_neg({})  # Sur Dictionnaire Vide
[]
==

pltest1==
>>> liste_neg({'a': 3})  # Test Sans Négatif
[]
>>> liste_neg({'a': 3, -12: 8}) == []  # Test Clé Négative
True
>>> liste_neg({'a': -3, 5: 16, -7: -1}) == ['a', -7]   # Test Valeurs Négatives
True
==




