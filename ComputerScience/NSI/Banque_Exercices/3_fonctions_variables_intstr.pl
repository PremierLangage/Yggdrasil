#author=Wenjie Fang

title=Entiers et chaîne

tag=fonction|variable|if|else|conditionnelles|type|operation

extends = /ComputerScience/python/template/pltest.pl
@ /ComputerScience/python/template/before.py [builder.py]



editor.code==

==

text==
Ecrivez une fonction `entierchaine` qui prend en paramètre deux entiers **n** et **m** et qui retourne la somme de **n** et **m**, 
et aussi la concaténation de l'écriture de **n** et **m** en chaîne de caractères.

**Exemples :**

    >>> entierchaine(10, 4)
    (14, '104')
    >>> entierchaine(1, -4)
    (-3, '1-4')
    >>> entierchaine(-9, 0)
    (-9, '-90')
==

before==#|python|
from random import randint

n = randint(-100, 100)
m = randint(-100, 100)

def entierchaine(n, m):
    return n + m, str(n)+str(m)

pltest1=f"""
>>> entierchaine({n},{m})
{entierchaine(n, m)}
"""
==


pltest==
>>> entierchaine(10, 4)
(14, '104')
>>> entierchaine(1, -4)
(-3, '1-4')
>>> entierchaine(-9, 0)
(-9, '-90')
==