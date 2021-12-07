author= DR
title=En place

tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]


text==

Ecrire une fonction place qui prend deux paramêtres une liste et une valeur : $%l et v%$.
Qui ajoute $%v%$ {{position}} dans la liste $%l%$.

==

before==
position, f= random.choice([
('au début',lambda l,v:l.insert(0,v)),
('en deuxième position',lambda l,v:l.insert(1,v)),
('a la fin',lambda l,v:l.insert(len(l),v))])


pltest= f"""
>>> place([1,2,3],4)
{f([1,2,3],4)}
>>> place([],1)
[1]
"""
==

