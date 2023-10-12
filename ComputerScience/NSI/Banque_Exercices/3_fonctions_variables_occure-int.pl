


extends = /ComputerScience/python/template/pltest.pl
@ /ComputerScience/python/template/before.py [builder.py]

# author = Zip
title=Distinguer un nombre !
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
Ecrivez une fonction `comparaison` ayant un unique paramètre `nombre` utilisant un **if elif else** retournant la chaîne de caractères:

- "Trop petit !", si `nombre` est plus petit que {{inconnu}}.
- "Tout juste !", si `nombre` est exactement {{inconnu}}.
- "Trop grand !", si `nombre` est plus grand que {{inconnu}}.

Exemples :

	>>> comparaison({{inconnugrand}})
    'Trop grand !'
    >>> comparaison({{inconnupetit}})
    'Trop petit !'
==

editor.code==


==






Xeditor.code==

==
