author = Killian Blanchard

title = Premier Test

extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

text==
Initialiser une liste "attaquant" de longueur 3 
et une liste "defenseur" de longueur 2 qui possèdent 
chacune des entiers aléatoire de 1 à 6, pour cela écrivez 
une fonction random_value() qui renverra un aléatoire. 
Puis écrire une fonction "fight" qui retournera 2
si la liste "attaquand" possède le chiffre le plus grand des 2 listes, 
-2 si c'est la liste défenseur, 0 sinon.
==

pltest0==
from random import randint
>>> len(attaquant)
3
>>> len(defenseur)
2
==

pltest1==
>>> for i in range(0,100):
...     val = random_value()
...     if val < 1 or val > 6:
...         False
...         break

==

pltest2==
>>> fight([3,4,5], [2,2])
2
>>> fight([1,2,3], [3,4])
-2
>>> fight([1,1,3], [1,3])
0
==

editor.code==
def random_value():

def fight():

==
