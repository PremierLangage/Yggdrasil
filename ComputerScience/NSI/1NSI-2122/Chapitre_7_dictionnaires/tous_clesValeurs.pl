
# Author: Chaohui Wang

extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

title= Renvoyer les clés et les valeurs de tous les éléments d'une manière compacte

text==
Ecrire une fonction ``returnClesValeurs(dic)`` qui contient seulement une ligne (après ``def returnClesValeurs(dic):``).
Elle mets les clés et les valeurs de tous les elements dans deux variables de type liste, respectivement, et les renvoie sous forme de couple.
Les clés et valeurs doivent apparaître dans les listes dans le même ordre que dans le dictionnaire.
Voici un exemple d'utilisation.

``>>> a, b = returnClesValeurs({3: 'X', 1: 'X'})``

``>>> a``

``[3, 1]``

``>>> b``

``['X', 'X']``
==

tag=dictionary

samplesol==
def returnClesValeurs(dic):
    return list(dic.keys()), list(dic.values())
==


before==
==

pltest==
>>> dic = {3: 'X', 2: 'Y', 1: 'Z'}  # 
>>> a, b = returnClesValeurs(dic)
>>> a
[3, 2, 1]
>>> b
['X', 'Y', 'Z']
==