extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title = Fusion de deux listes 

text==

Ecrire une fonction `fusion` à deux paramètres (des listes) qui retourne la liste composée des éléments de la première suivis par des éléments de la seconde. 

La fonction **ne doit pas modifier les deux listes** en paramètre. On ne peut pas utiliser la fonction <font style="color:red;">{{taboo}}</font>.

Par exemple, ``fusion([1,1],[2,2])`` doit retourner ``[1, 1, 2, 2]``.
==

taboo=extend

tag=append|elementAccess|reference|listCopy

samplesol==
def fusion(l1, l2):
    return l1+l2
==

pltest0==
>>> fusion([1,1],[2,2])
[1, 1, 2, 2]
==

pltest1==
>>> l1 = [7]
>>> l2 = [1]
>>> fusion(l1, l2)
[7, 1]
>>> l1
[7]
>>> l2
[1]
==



