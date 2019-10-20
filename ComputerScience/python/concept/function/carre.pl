# Boris Jabot 10/09/2019 OK
# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
author=l'équipe de l'UPEM vous propose des exercices
title=Une fonction carrément carrée

tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
piste=verte
text==
## Une fonction carrément carrée ##
Ecrivez une fonction **carre** qui retourne le carré de son paramêtre.
==

@ /builder/before.py [builder.py]
before==
import random 
p=random.randint(23,77)
pltest1=""">>> carre({})\n{}\n""".format(p, p**2)
pltest2=""">>> carre({})=={}# Hidden value test\nTrue\n""".format(p, p**2)

==


pltest==
>>> carre(510) == 260100 # le carre de 510
True
>>> carre(0)
0
>>> carre(10)
100
>>> 
==
editor.code==
def carre(n):
    return n*6
==
editor.height=145





