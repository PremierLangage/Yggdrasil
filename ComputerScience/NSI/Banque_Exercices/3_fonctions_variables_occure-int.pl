


extends = /ComputerScience/python/template/pltest.pl
@ /ComputerScience/python/template/before.py [builder.py]

# author = Zip
title=Distinguer un nombre !
tag=function|variable|if|elif|else|conditionnelles

beforef==
inconnu = 6
==


text==
Ecrivez une fonction `comparaison` ayant un unique paramètre `nombre` utilisant un **if elif else** retournant la chaîne de caractères:

- "Trop petit !", si `nombre` est plus petit que {inconnu}.
- "Tout juste !", si `nombre` est exactement 6.
- "Trop grand !", si `nombre` est plus grand que 6.

Exemples :

	>>> comparaison(7)
    'Trop grand !'
    >>> comparaison(-5)
    'Trop petit !'
==

editor.code==


==

pltest==
>>> comparaison(7)
'Trop grand !'
>>> comparaison(-5)
'Trop petit !'
==


pltest1==
>>> val_abs(4) == 4
True
==

Xeditor.code==

==
