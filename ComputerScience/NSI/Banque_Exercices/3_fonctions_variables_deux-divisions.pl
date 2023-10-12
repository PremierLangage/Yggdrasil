
# author=Wenjie Fang



extends = /ComputerScience/python/template/pltest.pl
@ /ComputerScience/python/template/before.py [builder.py]

# author = Zip
title=Deux divisions
tag=function|variable|if|elif|else|conditionnelles

before==
from random import randint
n = randint(5, 70)
m = randint(5, 7)

def division(n, m):
    if m == 0:
        return 'Division par 0'
    else:
        reelle = f'{n} / {m} = {n/m}'
        euclidienne = f'{n} = {m} * {n//m} + {n%m}'
        return reelle, euclidienne


pltest1=f"""
>>> division({n}, {m})
{division(n, m)}
"""
==


text==
Ecrivez une fonction `division` qui prend en paramètre deux entiers **n** et **m** et qui renvoie deux chaines de caractère si m est différent de 0:

- le résultat de **n** divisé par **m**, 
- ainsi que la division euclidienne de **n** par **m**. 

Si **m** est égal à 0, alors votre fonction doit renvoyer "Division par 0".

**Exemple :**

    >>> division(10, 4)
    ('10 / 4 = 2.5', '10 = 4 * 2 + 2')
    >>> division(1, 4)
    ('1 / 4 = 0.25', '1 = 4 * 0 + 1')
    >>> division(10, 0)
    'Division par 0'

==

editor.code==


==

pltest==
>>> division(10, 4)
('10 / 4 = 2.5', '10 = 4 * 2 + 2')
>>> division(1, 4)
('1 / 4 = 0.25', '1 = 4 * 0 + 1')
>>> division(10, 0)
'Division par 0'
==




Xeditor.code==

==






