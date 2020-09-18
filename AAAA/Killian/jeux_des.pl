author = Killian Blanchard

title = Premier Test

extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

text = Initialiser une liste "attaquant" de longueur 3 et une liste "defenseur" de longueur 2 qui possèdent chacune des entiers aléatoire de 1 à 6, et écrire une fonction "fight" qui affichera : "L'attaquant a gagné !" si la liste "attaquand" possède le chiffre le plus grand des 2 listes, "Le défenseur a gagné !" si c'est la liste défenseur, "Personne n'a gagné..." sinon.

pltest0==
from random import randint
>>> len(attaquant)
3
>>> len(defenseur)
2
==

pltest1==
>>> fight([3,4,5], [2,2])
L'attaquant a gagné !
>>> fight([1,2,3], [3,4])
Le défenseur a gagné !
>>> fight([1,1,3], [1,3])
Personne n'a gagné...
==


