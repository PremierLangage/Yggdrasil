

# author zip
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title = Echiquier
text== 
On place des dames sur un echiquier (8X8). La place de chaque dame est donné par un couple d'entiers.<br>
Une dame se déplace dans tous les sens (horizontalement, verticalement, diagonalement).<br>
Le problème consiste à déterminer le nombre de cases qui sont attaquée par au moins une dame.<br>
Ecrire une fonction 'attaque' qui reçoit une position de dames et un échiquier et renvoie le nombre 
de nouvelles cases attaquées
>>> attaque((0,0),echiquier)
22 (si la dame en [0,0) est la premiuére traitée)
 Ecrire une fonction `dames` qui reçoit la  liste des positions des dames et renvoie le nombres de cases attaquées.<br>
 
on considère qu'une dame attaque sa propre case.
>>> dames([(0,0),(7,7)]
38
==
