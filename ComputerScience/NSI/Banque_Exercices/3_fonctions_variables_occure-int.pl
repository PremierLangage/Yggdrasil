


extends = /ComputerScience/python/template/pltest.pl
@ /ComputerScience/python/template/before.py [builder.py]

# author = Zip
title=Distinguer un nombre !
tag=function|variable|if|elif|else|conditionnelles

before==
inconnu = 6
inconnugrand = 7
inconnupetit = 5
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

pltest==
>>> comparaison({{inconnugrand}})
'Trop grand !'
>>> comparaison({{inconnupetit}})
'Trop petit !'
==




Xeditor.code==

==
