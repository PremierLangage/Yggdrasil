





author= DR
title=Triangles 


tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]


text==

Une des propriétés des triangles est la somme des longueurs deux cotés est toujours plus grande que la longueur du troisième coté.

Ecrie une fonction **check** qui prend une liste de chaines de caractère contenant trois entiers et qui retourne le nombre de chaine contenant des triangles.

Exemple de chaine :

    "5 10 25" qui n'est pas un triangle 
    "685  748  471" qui peut en être un

en cas d'égalité ce n'est pas un triangle.
==

pltest==
>>> def file2list():#
...    with open("triangles.txt","r") as f:
...        l = []
...        for line in f:
...            l.append(line.strip())
...    return l
...
>>> R=check(file2listq())#
>>> if r > 1050: #
...     print("Trop grand")
... elif r < 1050: #
...     print("trop petit")
...
==

