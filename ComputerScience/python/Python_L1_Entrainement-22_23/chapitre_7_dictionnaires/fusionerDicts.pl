
# Author: Chaohui Wang

extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]


title= Fusionner deux dictionnaires

text==
Ecrire une fonction ``fusionnerDicts(dict1,dict2)``. Elle fusionne les deux dictionnaires (dans le sens de la réunion) ``dict1`` et ``dict2`` dans un seul dictionnaire et puis le retourne.

Voici un exemple.

``>>> dict1={4: 'X', 2: 'Y', 1: 'Z'}``

``>>> dict2={6: 'X', 2: 'Y', 1: 'Z'}``

``>>> fusionnerDicts(dict1,dict2)``

``{4: 'X', 2: 'Y', 1: 'Z', 6: 'X'}``
==

tag=dictionary

samplesol==
def fusionnerDicts(dict1,dict2):
    return {**dict1, **dict2}
==


before==
==

pltest0==
>>> dict1={3: 'X', 2: 'Y', 1: 'Z'}  # 
>>> fusionnerDicts(dict1, {}) == {3: 'X', 2: 'Y', 1: 'Z'}  # Test Avec Vide
True
>>> dict2={4: 'X', 2: 'Y', 1: 'Z'}  # 
>>> fusionnerDicts(dict1,dict2) == {3: 'X', 2: 'Y', 1: 'Z', 4: 'X'}  # Test Non Vide
True
==