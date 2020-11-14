title= Statistiques sur une liste
extends=/ComputerScience/python/template/pltest.pl

text==

Ecrire une fonction ``stat_list`` qui prend une liste d'entiers en paramètre et qui retourne le nombre des éléments pairs et le nombre des éléments impairs.

Par exemple, ``stat_list([2, 0, 1, 9])`` doit renvoyer ``(2, 2)``, et ``stat_list([2, 0, 2, 0])`` doit renvoyer ``(4, 0)``.

Remarque: ``(a, b)`` est un tuple et ``[a, b]`` une liste.
==

tag=elementAccess|tuple

pltest==
>>> stat_list == stat_list#
True
>>> stat_list([2,4,5,6,77])
(3, 2)
>>> stat_list([])
(0, 0)
>>> import random #
>>> l=[ random.randint(1,100)*2 for x in range(10)] #
>>> stat_list(l) # une liste de 10 pairs 
(10, 0)
>>> stat_list([ x+1 for x in l]) # une liste de 10 impairs
(0, 10)
>>> l2=l+[ x+1 for x in l] #
>>> stat_list(l2) # 10 pairs 10 impairs
(10, 10)
==



