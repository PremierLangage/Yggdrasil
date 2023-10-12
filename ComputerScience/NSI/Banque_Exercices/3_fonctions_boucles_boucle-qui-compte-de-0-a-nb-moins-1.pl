extends = /ComputerScience/python/template/pltest.pl
@ /ComputerScience/python/template/before.py [builder.py]
tag=function|InstructionsRepetitives|ForInRange
title = Boucle qui compte de 0 à `nb - 1`

before==#|python|
from random import randint
n = randint(7,77)

def afficheboucle(n):
    res = ''
    for i in range(n):
        res += str(i) + '\n'
    return res

pltest1=f">>> afficheboucle({n})\n{afficheboucle(n)!r}"

==

text==
Écrire une fonction `afficheboucle` ayant pour paramètre `nb` un nombre entier positif qui retourne une chaine de caractère contenant les nombres de 
`0` à `nb-1` (chacun suivi d'un retour à la ligne), à l'exclusion de tout autre caractère.

Par exemple:

    >>> print(afficheboucle(5))
    0
    1
    2
    3
    4
    
    >>> afficheboucle(5)
    '0\n1\n2\n3\n4\n'

==

editor.code==
==

pltest0==
>>> afficheboucle(5)
'0\n1\n2\n3\n4\n'
==