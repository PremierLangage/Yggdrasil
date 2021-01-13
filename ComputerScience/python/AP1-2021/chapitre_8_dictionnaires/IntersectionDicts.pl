
# Author: Chaohui Wang

extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]


title= Intersection de deux dictionnaires

text==
Ecrire une fonction ``intersectDicts(dict1,dict2)``. Elle trouve le élements en commun
(i.e. la clé et la valeur sont les mêmes) dans les deux dictionnaires (``dict1`` et ``dict2``),
les mets dans un dictionnaire et puis le retourne.
==

tag=dictionary

samplesol==
def intersectDicts(dict1,dict2):
    return {k: dict1[k] for k in dict1 if k in dict2 and dict1[k] == dict2[k]}
==


before==

==

pltest0==
>>> dict1={3: 'X', 2: 'Y', 1: 'Z'}  # 
>>> intersectDicts(dict1, {}) == {}  # Test Avec Vide
True
>>> dict2={4: 'X', 2: 'Y', 1: 'Z'}  # 
>>> intersectDicts(dict1,dict2) == {2: 'Y', 1: 'Z'}  # Test Non Vide
True
==
