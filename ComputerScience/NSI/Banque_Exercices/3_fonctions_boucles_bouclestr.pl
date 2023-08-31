
extends = /ComputerScience/python/template/pltest.pl
@ /ComputerScience/python/template/before.py [builder.py]
tag=function|InstructionsRepetitives|ForInRange
title = Liste des multiples

before==#|python|
from random import choice
x = choice([13,17,23,27,51])

def listemultiples(n):
    res = ""
    for i in range(1, n + 1):
        res += str(x*i)
    return res

y = listemultiples(4)

==

text==

Ecrire une fonction `listemultiples` ayant un paramètre entier strictement positif `n` et retourne la chaine de caractères formée des n premiers (à partir de 1) multiples de {{x}}.

Exemple:

    >>> listemultiples(4)
    {{y}}

==