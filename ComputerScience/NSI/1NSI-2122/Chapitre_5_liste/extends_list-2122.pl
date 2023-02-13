# author FLQ
# + DR

# comment
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
builder= /builder/before.py

title = Ajout de N éléments à une liste 
text == 
Ecrire une fonction `tab3` à deux arguments; une liste, un entier n, qui modifie la liste passée en argument en
lui ajoutant la liste des n premiers éléments de la table de multiplication par 3, commençant par le multiple de 1.

Par exemple, si on avait une liste `l = [9, 5]`, alors après l'appel `tab3(l, 4)`, **qui ne retourne rien et n'affiche rien**, 
la valeur de `l` doit devenir `[9, 5, 3, 6, 9, 12]`.

taboo: Ne pas utiliser la fonction <font style="color:red;">{{taboo}}</font> des listes.
==

taboo=append

tag=reference|extend|ForInRange

samplesol==
# solution --- utilise extends
def tab3(lst,n) :
    lst.extend([i*3 for i in range(1,n+1)])
==

pltest0==
>>> lst=[]
>>> tab3(lst,10)
>>> lst
[3, 6, 9, 12, 15, 18, 21, 24, 27, 30]
==

pltest1==
>>> lst = [5]
>>> tab3(lst,10)
>>> lst
[5, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30]
==

pltest2==
>>> lst = [5]
>>> tab3(lst,3)
>>> lst
[5, 3, 6, 9]
==












