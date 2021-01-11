
# Author: Chaohui Wang

extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]


title= Fusionner deux dictionnaires

text==
Ecrire une fonction ``fusionnerDicts(dict1,dict2)``. Elle fusionne les deux dictionnaires (dict1 et dict2) dans un dictionnaire et puis le retourne.
==

tag=dictionary

samplesol==
def fusionnerDicts(dict1,dict2):
    return {**dict1, **dict2}
==


before==
==

pltest0==
>>> dict1={3: 'X', 2: 'Y', 1: 'Z'}
>>> dict2={4: 'X', 2: 'Y', 1: 'Z'}
>>> fusionnerDicts(dict1,dict2) == {3: 'X', 2: 'Y', 1: 'Z', 4: 'X'}
True
==