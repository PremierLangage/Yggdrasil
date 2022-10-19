





# Boris Jabot 10/09/2019 OK
# Copyright 2016 Dominique Revuz <dr@univ-mlv.fr>
#author=
title=Une fonction carre

tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]
piste=verte
text==
Ecire une fonction filtre_pair(liste) qui élimine de la liste les valeur paires.
==

before==
import random 

l=[random.randint(1,1000) for i in range(20)]#
l2=[ x for x in l if x%2 ==1] 
pltest0=""">>> filtre_pair({repr(l)}) 
{repr(l2)}
"""


==

pltest0==
>>> import types #
>>> "carre" in globals() # carre existe 
True
>>> type(carre)  # est carre est une fonction 
<type 'function'>
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










