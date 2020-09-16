# author zip

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

@ rectest.py

title = Numérotation du plan

text==

On numérote les points du quart de plan $%N \times N %$ par les entiers naturels suivant l'ordre des diagonales montantes:<br>
. . .<br>
9 . . . <br>
5 8 . . .    <br>
2 4 7 11 .   <br>
0 1 3 6 10 . <br> 
Ecrire une fonction récursive qui reçoit les coordonnées d'un point sous forne de  deux entiers positifs
et renvoie le numéro associé.
(aide : distinguez les cas (0,y),(x,0) et (x,y) avec x non nul et y non nul
==

before==
def numero(x,y):
    if x==0:
        if y==0:
           return 0
        else:
            return numero(1,y-1)+1
    if y==0:
        return numero(0,x-1)+1
    else:
        return numero(x+1,y-1)+1

from random import *
x=randint(4,12)
y=randint(5,20)
ff=numero(x,y)

pltest3 = f"""
>>> numero{x,y}=={ff}
True
""" 


after=before
==
pltest0==
>>> from rectest import test_recursion
>>> test_recursion(lambda:numero(3,5))
True
==

pltest1==
>>> numero(2,4)
25
==

pltest2==
>>> numero(10,6)
142
==
