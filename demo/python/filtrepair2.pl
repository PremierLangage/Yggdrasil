





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

def maketest(n,str):


l=[random.randint(1,1000) for i in range(20)]
l2=[ x for x in l if x%2 ==1] 


pltest0=f""">>> filtre_pair({repr(l)}) 
{repr(l2)}
"""


==



editor.code==
def filtre_pair(lx):
    return [ x for x in lx if x%2 ==1] 
==
editor.height=145










