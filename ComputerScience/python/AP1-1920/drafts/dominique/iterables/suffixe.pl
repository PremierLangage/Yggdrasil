
# author dr
# Heritage d'un type d'exercice
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl


title = Préfixe ou Suffixe  
text== 
On appel préfixes propres de w tout les mots x non vide tel qu'il existe un mot y non vide telque w=xy.
On appel le mot y un suffixe propre.

Ecrire un fonction suffix qui prend deux iterables (liste ou chaine de caractère) de même type. 
Et retourne un booleen indiquant si le premier est un suffix du second




==

pltest1==
>>> suffix("to","toto") # to suffixe de toto
True
>>> suffix("ot","toto") # to pas suffixe de toto
False
==
pltest2==
>>> suffix("tot","toto") # tot suffixe de toto
True
>>> suffix("toto","toto") # toto pas suffixe propre de toto
False
==
pltest3==
>>> import random  #
>>> l= [ x for x in range(random.randint(3,6))] #
>>> suffix(l,l.extend(l))
True
>>> suffix(l.extend(l),l)
False
==

