
# Author: Justine Falque

extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

#author=Justine Falque
title=Ajouter une entrée à un dictionnaire

text==

Ecrire une fonction ``ajoute_dico(d, cle)`` qui ajoute au dictionnaire ``d`` la clé ``cle`` (si elle n'y est pas déjà), associée à la valeur 0.

La fonction renverra ``True`` si l'entrée a été ajoutée, ``False`` sinon.
==

tag=dictionary

samplesol==
def ajoute_dico(d, cle):
    if cle not in d :
        d[cle] = 0
        return True
    return False
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




