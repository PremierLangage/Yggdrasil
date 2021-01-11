
# Author: Chaohui Wang

extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

title= Retourner les clés et les valueurs de tous les elements d'une manière compacte

text==
Ecrire une fonction ``returnClesValeurs(dic)`` qui contient seulement une ligne (``def returnClesValeurs(dic):``)
et qui
faire mettre les clés et les valueurs de tous les elements dans deux listes, respectivement
==

tag=dictionary

samplesol==
def returnClesValeurs(dic):
    a, b=returnClesValeurs(dic)
==


before==
==

pltest0==
>>> d1 = {'a':1, 'b':2}  # initialisation
>>> ajoute_dico(d1, 'a') # dedans renvoie False
False
>>> len(d1) == 2    # pas de modification
True
==

pltest1==
>>> d1 = {'a':1, 'b':2}  # initialisation
>>> ajoute_dico(d1, 'c') # pas dedans renvoie True
True
>>> len(d1) == 3    # entrée ajoutée
True
>>> d1['c']    # nouvelle valeur à 0
0
==