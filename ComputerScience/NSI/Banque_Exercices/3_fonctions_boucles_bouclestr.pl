
extends = /ComputerScience/python/template/pltest.pl
@ /ComputerScience/python/template/before.py [builder.py]
tag=function|InstructionsRepetitives|ForInRange
title = Liste des multiples

before==#|python|
from random import choice, randint
x = choice([13,17,23,27,51])
n = randint(10,30)

def listemultiples(n):
    res = ""
    for i in range(1, n + 1):
        res += str(x*i)
    return res

y = listemultiples(4)

pltest0 = f">>> listemultiples(4)\n{listemultiples(4)!r}"

pltest1 = f">>> listemultiples({n})\n{listemultiples(n)!r}"

==

text==

Ecrire une fonction `listemultiples` ayant un paramètre entier strictement positif `n` et retourne la chaine de caractères formée des n premiers (à partir de 1) multiples de {{x}}.

Exemple:

    >>> listemultiples(4)
    {{y}}

==

editor.code ==
==
