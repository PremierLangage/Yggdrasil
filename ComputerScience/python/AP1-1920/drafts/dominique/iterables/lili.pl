# author dr
# Heritage d'un type d'exercice
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl


title = Préfixe ou Suffixe  
text== 
On appel préfixes propres de w tout les mots x non vide tel qu'il existe un mot y non vide telque w=xy.
On appel le mot y un suffixe propre.

Ecrire un fonction prefix qui prend deux iterables (liste ou chaine de caractère) de même type. 
Et retourne un booleen indiquant si le premier  est un prefix du second




==

pltest1==
>>> prefix("to","toto") # to Préfixe de toto
True
>>> prefix("ot","toto") # to pas Préfixe de toto
False
==
pltest2==
>>> prefix("tot","toto") # tot Préfixe de toto
True
>>> prefix("toto","toto") # toto pas Préfixe propre de toto
False
==
pltest3==
>>> import random  #
>>> l= [ random.randint(4,25) for x in range(random.randint(3,6))] #
>>> prefix(l,l.extend(l))
True
>>> prefix(l.extend(l),l)
False
==

