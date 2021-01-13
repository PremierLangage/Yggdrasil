
# Author: Chaohui Wang

extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

title= Retourner les clés et les valeurs de tous les éléments d'une manière compacte

text==
Ecrire une fonction ``returnClesValeurs(dic)`` qui contient seulement une ligne (après ``def returnClesValeurs(dic):``).
Elle mets les clés et les valeurs de tous les elements dans deux variables de type liste, respectivement, et les renvoie.
On utilisera ``a, b = returnClesValeurs(dic)`` pour appeler cette fonction-là.
Par exemple:
a, b = returnClesValeurs({3: 'X', 1: 'X'})
a est [3, 1] et b est ['X', 'X']
==

tag=dictionary

samplesol==
def returnClesValeurs(dic):
    return list(dic.keys()), list(dic.values())
==


before==
==

pltest==
>>> dic={3: 'X', 2: 'Y', 1: 'Z'}
>>> a, b=returnClesValeurs(dic)
>>> a
[3, 2, 1]
>>> b
['X', 'Y', 'Z']
==