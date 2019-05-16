# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
author=Dominique Revuz 
title=L'éponge Carrée

tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/template/pltest.pl
piste=verte
text==
## Une fonction bob ##
Ecrivez une fonction **bob** qui retourne le carré de son paramêtre.
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

