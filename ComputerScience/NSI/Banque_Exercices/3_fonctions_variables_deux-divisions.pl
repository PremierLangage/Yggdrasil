
# author=Wenjie Fang



extends = /ComputerScience/python/template/pltest.pl
@ /ComputerScience/python/template/before.py [builder.py]

# author = Zip
title=Deux divisions
tag=function|variable|if|elif|else|conditionnelles

before==
from random import randint
inconnu = randint(5, 70)
inconnugrand = inconnu + randint(1,20)
inconnupetit = inconnu - randint(1,20)
inconnugrand1 = inconnu + randint(1,20)
inconnupetit1 = inconnu - randint(1,20)

pltest=f"""
>>> comparaison({inconnugrand})
'Trop grand !'
>>> comparaison({inconnupetit})
'Trop petit !'
>>> comparaison({inconnu})
'Tout juste !'
>>> comparaison({inconnugrand1})
'Trop grand !'
>>> comparaison({inconnupetit1})
'Trop petit !'
"""
==


text==
Ecrivez une fonction `division` qui prend en paramètre deux entiers **n** et **m** et qui renvoie deux chaines de caractère si m est différent de 0:

- le résultat de **n** divisé par **m**, 
- ainsi que la division euclidienne de **n** par **m**. 

Si **m** est égal à 0, alors votre fonction doit renvoyer "Division par 0".

**Exemple :**

    >>> division(10, 4)
    '10 / 4 = 2.5', '10 = 4 * 2 + 2'
    >>> division(1, 4)
    '1 / 4 = 0.25', '1 = 4 * 0 + 1'
    >>> division(10, 0)
    'Division par 0'

==

editor.code==


==






Xeditor.code==

==






