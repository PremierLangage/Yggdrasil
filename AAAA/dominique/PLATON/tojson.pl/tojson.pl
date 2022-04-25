



extends=/ComputerScience/python/template/pltest.pl

author=DR
title= Initialisation d'une variable (3).
tag=variable | affectation
text==


Initialisez les variables jour, mois, annee avec la date du jour.

==

@ /builder/before.py [builder.py]

before==
import json 
bob = globals()

for k in  globals().keys():
    if k.startswith('__'):
        del bob[k]

text = bob.__str__()
==

code==

==





