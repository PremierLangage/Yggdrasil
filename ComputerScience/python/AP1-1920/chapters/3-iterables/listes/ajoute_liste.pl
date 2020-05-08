# author FLQ
# + DR

# comment
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
builder= /builder/before.py

title = Ajout d'éléments dans une liste
text == 
Ecrire une fonction **tab3** à deux arguments : une liste, un entier **n** et  qui modifie la liste passée en argument en
lui y ajoute les n premiers  multiples de 3 commençant par le multiple de 1.

taboo: Ne pas utiliser la fonction <font style="color:red;">{{taboo}}</font> des listes.
==

taboo=extend

before==
# solution --- utilise append
def tab3(lst,n) :
    for i in range(1,n+1) :
        lst.append(i*3)

==

pltest0==
>>> lst=[] #
>>> tab3(lst,10) #
>>> lst
[3, 6, 9, 12, 15, 18, 21, 24, 27, 30]
==

pltest1==
>>> lst = [5] #
>>> tab3(lst,10) #
>>> lst
[5, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30]
==

pltest2==
>>> lst = [5] #
>>> tab3(lst,3) #
>>> lst
[5, 3, 6, 9]
==







