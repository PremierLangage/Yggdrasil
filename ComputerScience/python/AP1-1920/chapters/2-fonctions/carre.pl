
# Boris Jabot 10/09/2019 OK
# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
#author=
title=Une fonction carre

tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]
piste=verte
text==
Ecrivez une fonction `carre` qui retourne le carré de son paramêtre
==
before==
import random 
p=random.randint(23,77)
pltest2=""">>> carre({})\n{}\n""".format(p, p**2)
p+=17
pltest3=""">>> carre({})=={}# Hidden value test\nTrue\n""".format(p, p**2)

==

pltest0==
>>> import types #
>>> "carre" in globals() # carre existe 
True
>>> type(carre)  # est carre est une fonction 
types.FunctionType
==

pltest1==
>>> carre(510) == 260100 # le carre de 510
True
>>> carre(0)
0
>>> carre(-10)
100
>>> 
==


editor.code==

==
editor.height=145










