
# Author: Justine Falque

extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

#author=Justine Falque
title=Ajouter une entrée à un dictionnaire

text==

Ecrire une fonction ``ajoute_dico(d, cle)`` qui ajoute au dictionnaire ``d`` la clé ``cle`` (si elle n'y est pas déjà), associée à la valeur 0.

La fonction renverra ``True`` si l'entrée a été ajoutée, ``False`` sinon.
==

tag=dictionary|ForIn|algo

samplesol==
def ajoute_dico(d, cle):
    if cle not in d :
        d[cle] = 0
        return True
    return False
==

before==
from random import randint

d1 = {'a':1, 'b':2}
l_d1 = len(d1)
d1_ini = d1.copy()
d1_plus_c = {'a':1, 'b':2, 'c':0}

pltest0 = f">>> ajoute_dico({d1}, {'a'})\n{False}\n"

after = before
==

pltest0==
>>> ajoute_dico(d1, 'a') # dedans
False
>>> len(d1) == l_d1
True
>>> ajoute_dico(d1, 'c') # pas dedans
True
>>> len(d1) == l_d1 + 1
True
>>> d1['c'] == 0
True
==




