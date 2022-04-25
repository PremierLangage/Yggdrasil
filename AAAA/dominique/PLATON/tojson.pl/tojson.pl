



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
bob = {}
l = list(globals().items())
for k,v in globals().items():
     if not k.startswith('__'):
        bob[k]=v

text = bob.__str__()
==

code==

==





