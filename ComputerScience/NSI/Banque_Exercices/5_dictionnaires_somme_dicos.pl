


# Author: Justine Falque

extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

#author=Justine Falque
title="Sommer" deux dictionnaires

text==

Ecrire une fonction ``somme_dicos(d1, d2)`` qui prend en paramètre deux dictionnaires dont les valeurs sont des nombres.
La fonction renvoie un dictionnaire dont les clés sont toutes les clés de ``d1`` et ``d2``, avec la valeur qui leur
était associée dans le dictionnaire d'origine si la clé appartient à un seul des deux, et la somme des valeurs associées
si la clé appartient aux deux dictionnaires. Les clés de ``d1`` doivent apparaître avant les clés de ``d2``.

Par exemple:

``>>> somme_dicos({'a': 1, 'b': 10}, {'b': 2, 'c':20})``

``{'a': 1, 'b': 12, 'c': 20}``
==

tag=dictionary|ForIn|algo

samplesol==
def somme_dicos(d1, d2):
    d = d1.copy()
    for cle in d2 :
        if cle in d :
            d[cle] += d2[cle]
        else :
            d[cle] = d2[cle]
    return d
==

before==
==


pltest0==
>>> somme_dicos({}, {}) == {}  # Test Avec Deux Vides
True
>>> somme_dicos({'a': 3, 'b': 10}, {}) == {'a': 3, 'b': 10}  # Test Avec Un Vide
True
>>> somme_dicos({'a': 3, 'b': 10}, {'a': 2, 'c':20}) == {'a': 5, 'b': 10, 'c': 20}  # Test Non Vide 1
True
>>> somme_dicos({'a': 3.5, 'b': 10}, {'a': -6, 'c':20}) == {'a': -2.5, 'b': 10, 'c': 20}  # Test Non Vide 2
True
==

pltest1==
>>> d1, d2 = {'a': 3, 'b': 10}, {'a': 3.5, 'b': 10}  # Initialisation
>>> somme_dicos(d1, d2)  # Test Non Vide 3
{'a': 6.5, 'b': 20}
>>> d1 == {'a': 3, 'b': 10} and d2 == {'a': 3.5, 'b': 10}  # Dictionnaires Non Modifiés
True
==



