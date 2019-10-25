# Boris Jabot 10/09/2019 OK
# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
#author=


# PL database (or background system) -> PL client

# the title shown in the PL test instance
title=Une fonction carre

# what candidates are there? and their meaning?
tag=function # N'oubliez pas de remplir ce champs svp

# what candidates are there? and their meaning?
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

# what candidates are there? and their meaning?
piste=verte

# the subject of the exercise shown in the PL test instance
text==
## Une fonction carre ## 
Ecrivez une fonction `carre` qui retourne le carré de son paramêtre
==

# the codes executed when creating the PL test instance (before transferring to the client's machine)
before==
import random 
p=random.randint(23,77)
pltest1=""">>> carre({})\n{}\n""".format(p, p**2)
p+=17
pltest2=""">>> carre({})=={}# Hidden value test\nTrue\n""".format(p, p**2)

==

# the codes of the representatvie tests executed after the client answers the question (transferred from the client's machine), so as to check their codes
pltest==
>>> carre(510) == 260100 # le carre de 510
True
>>> carre(0)
0
>>> carre(10)
100
>>> 
==

# the codes provided in the PL test instance and the client can use/modify it directly (shown in the client's webpage if using "editor.code")
editor.code==
def carre(n):
    return n*6
==
editor.height=145
