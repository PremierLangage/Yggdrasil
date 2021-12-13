





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

@ fileread.py 

pltest==
>>> import fileread #!
>>> r=check(fileread.f2l("triangles.txt")) #!
>>> if r > CORRECT: #!
...     print("Trop grand")
... elif r < CORRECT: #
...     print("trop petit")
...
==



@ /ComputerScience/python/AP1-2122/Remediation/triangles.txt