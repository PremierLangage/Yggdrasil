# Author: Wenjie Fang

extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
builder=/builder/before.py

author=Wenjie Fang
title=Rotation de chaîne de caractères

text==
On définit l'opération de rotation suivante pour les chaînes de caractères. Pour une chaîne ``s``, sa **rotation à droite**
s'agit de la chaîne obtenue en déplaçant la dernière caractère de ``s`` au début. Par exemple, si ``s = 'avogadro'``,
alors sa rotation à droite vaudra ``'oavogadr'``.

Ecrire une fonction ``rotation(s, k)`` qui retourne le résultat de répéter ``k`` fois la rotation à droite sur la chaîne ``s``.
Par exemple, si ``s = 'avogadro'`` et ``k = 3``, alors la valeur de ``rotation(s, k)`` doit être ``'droavoga'``. 

Le paramètre ``k`` pourrait aussi **être négatif**, qui signifie une **rotation à gauche**. Par exemple,
si ``s = 'avogadro'`` et ``k = -2``, alors la valeur de ``rotation(s, k)`` doit être ``'ogadroav'``.

Il faut bien penser à l'efficacité du code. Dans le test, il y aura des instances où ``k = 100000000000000``.
Si on fait simplement ``k`` fois la rotation, le calcul ne terminera pas en temps raisonnable.
Veuillez tester votre code sur votre machine avant de le soumettre.
==

tag=substring

samplesol==
def rotation(s, k):
    return s[-(k%len(s)):] + s[:-(k%len(s))]
==

before==
from random import randint

def rotation(s, k):
    return s[-(k%len(s)):] + s[:-(k%len(s))]

test = 'Ceci est bien une pipe.'

rint = randint(-100, 100)
rres = rotation(test, rint)
pltest2 = f">>> rotation('{test}', {rint}) \n'{rres}'\n"

rint = randint(-100, 100)
rres = rotation(test, rint)
pltest3 = f">>> rotation('{test}', {rint}) \n'{rres}'\n"

rint = randint(-100, 100)
rres = rotation(test, rint)
pltest4 = f">>> rotation('{test}', {rint}) \n'{rres}'\n"

after = before
==

pltest0==
>>> rotation('avogadro', 3)
'droavoga'
>>> rotation('avogadro', 0)
'avogadro'
>>> rotation('avogadro', 10)
'roavogad'
>>> rotation('avogadro', -2)
'ogadroav'
==

pltest1==
>>> rotation('avogadro', 100000000000000)
'avogadro'
>>> rotation('avogadro', 100000000000002)
'roavogad'
==
