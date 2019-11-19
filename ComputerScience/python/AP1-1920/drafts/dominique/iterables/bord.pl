
# author dr
# Heritage d'un type d'exercice
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl


title = Préfixe ou Suffixe  
text== 
On appel préfixes propres de w tout les mots x non vide tel qu'il existe un mot y non vide telque w=xy.
On appel le mot y un suffixe propre.

On appel **bord propre** un mot qui est à la fois Préfixe et Suffixe

Ecrire un fonction __bord__ qui prend deux iterables (liste ou chaine de caractère) de même type. 
Et retourne un booleen indiquant si le premier est un bord du second

On appel **pgbp** (plus grand bord propre) le pus grand des bords propre d'un mot.

Ecrire une fonction __pgbp__ qui prend un seul iterable et retourne la longueur du plus grand bord propre de cet iterable.
Et zéro si il n'en a pas.

==

pltest1==
>>> bord("to","toto") # to bord de toto
True
>>> bord("ot","toto") # to pas bord de toto
False
==
pltest2==
>>> bord("tot","totot") # tot bord de toto
True
>>> bord("toto","toto") # toto pas bord propre de toto
False
==
pltest3==
>>> import random  #
>>> l= [ random.randint(4,25) for x in range(random.randint(3,6))] #
>>> l2= l+[0]+l #
>>> pgbp(l,l2) == len(l)
True
>>> bord(l2,l) == 0
True
==

