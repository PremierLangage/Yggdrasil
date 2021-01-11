
# Author: Chaohui Wang

extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

title= Retourner les clés et les valueurs de tous les elements d'une manière compacte

text==
Ecrire une fonction ``returnClesValeurs(dic)`` qui contient seulement une ligne (après ``def returnClesValeurs(dic):``).
Elle mets les clés et les valueurs de tous les elements dans deux variable de type listes, respectivement, et les retourner.
On va utiliser ``a, b=returnClesValeurs(dic)`` pour appeler cette fonction-là.
==

tag=dictionary

samplesol==
def returnClesValeurs(dic):
    return list(dic.keys()), list(dic.values())
==


before==
==

pltest0==
>>> dic={3: 'X', 2: 'Y', 1: 'Z'}
>>> a, b=returnClesValeurs(dic)
False
>>> a
[3, 2, 1]
>>> b
['X', 'Y', 'Z']
==