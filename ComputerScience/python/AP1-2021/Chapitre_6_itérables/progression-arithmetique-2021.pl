# Author: Wenjie Fang

extends=/ComputerScience/python/template/pltest.pl

@ /builder/before.py [builder.py]

author=Wenjie Fang
title=Progression arithmétique, mais sans boucle

text==
Ecrire une fonction ``progression(p, r, l)`` qui prend en paramètre le premier terme ``p``, la raison ``r``
et la longueur ``l`` **d'une progression arithmétique formée par des entiers**, et retourner la progression sous forme d'une liste.
Si ``l <= 0``, alors la fontion retourne une liste vide. La raison ``r`` pourrait être négative.

Par exemple, l'appel ``progression(1, 2, 4)`` doit retourner la liste ``[1, 3, 5, 7]``, et l'appel ``progression(1, 2, -4)`` doit retourner ``[]``.

Cependant, **les boucles sont interdites** dans cette exercice. Vous pouvez utiliser ``range``, puis le convertir en liste avec ``list``.
Il faut faire attention au cas où ``r = 0``.
==

taboo=for|while

tag=range

samplesol==
def progression(p, r, l):
    if r == 0:
        return [p] * l
    else:
        return list(range(p, p + r * l, r))
==

before==
from random import randint

pp = randint(-10, 10)
rr = randint(-10, 10)
ll = randint(-4, 10)
res = [pp + rr * i for i in range(ll)]

pltest3 = f"""
>>> progression({pp}, {rr}, {ll}) # Random
{res}
"""

pp = randint(-10, 10)
rr = randint(-10, 10)
ll = randint(-4, 10)
res = [pp + rr * i for i in range(ll)]

pltest4 = f">>> progression({pp}, {rr}, {ll}) # Random\n{res}\n"

pp = randint(-10, 10)
rr = randint(-10, 10)
ll = randint(-4, 10)
res = [pp + rr * i for i in range(ll)]

pltest5 = f">>> progression({pp}, {rr}, {ll}) # Random\n{res}\n"

pp = randint(-10, 10)
rr = randint(-10, 10)
ll = randint(-4, 10)
res = [pp + rr * i for i in range(ll)]

pltest6 = f">>> progression({pp}, {rr}, {ll}) # Random\n{res}\n"


==

pltest0==
>>> progression(1, 1, 5) # Normal 1
[1, 2, 3, 4, 5]
>>> progression(-5, 2, 7) # Normal 2
[-5, -3, -1, 1, 3, 5, 7]
>>> progression(-10, 0, 4) # Normal 3
[-10, -10, -10, -10]
==

pltest1==
>>> progression(0, 2, -3) # Vide 1
[]
>>> progression(0, 100000, 0) # Vide 2
[]
==

pltest2==
>>> progression(1, -2, 6) # Négative 1
[1, -1, -3, -5, -7, -9]
>>> progression(10, -3, 7) # Négative 2
[10, 7, 4, 1, -2, -5, -8]
==


