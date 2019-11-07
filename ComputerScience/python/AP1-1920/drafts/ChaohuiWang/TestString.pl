#author=

title=Une fonction test

tag=function # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]
piste=verte
text==
## Une fonction longeurChaineChar ## 
Ecrivez une fonction `longeurChaineChar` qui retourne le longueur de son paramêtre
==
before==
import random 
l = [random.randint(0,10) for i in range(10)]
pltest1=""">>> carre({})\n{}\n""".format(p, p**2)
p+=17
pltest2=""">>> carre({})=={}# Hidden value test\nTrue\n""".format(p, p**2)

L = [8, 5, 6, 1, 17]
print (L[0])
L[1] = 17
L[3] = L[2] + L[4]
print(L)
for i in range (0, 12) :
     print(L[len(L)-1])
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
