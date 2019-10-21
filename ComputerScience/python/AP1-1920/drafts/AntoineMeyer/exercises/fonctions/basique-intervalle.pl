extends = ../../templates/generic/generic.pl

title = Fonctions : appartenance à un intervalle
# author = Antoine Meyer

text==
Écrire une fonction `dans_intervalle(n, a, b)` 
renvoyant `True` si l'objet `n` est strictement compris 
entre `a` et `b`, et `False` sinon.

Exemples d'appels :

```pycon
>>> dans_intervalle(4, 1, 12)
True
>>> dans_intervalle(40, 1, 12)
False
>>> dans_intervalle("oui", "non", "peut-être")
True
>>> dans_intervalle("certainement", "non", "peut-être")
False
```
==

grader==#|python|

#import sys
#print(pl_context, file=sys.stderr)

def tests_call(cases):
    for n, a, b in cases:
        run(title = f'Appartenance de {n} dans [{a}, {b}]',
            expr = f'dans_intervalle({n}, {a}, {b})', 
            result = a < n < b)

import random
begin_test_group("Valeurs fixées")
tests([
    (4, 1, 12), 
    (40, 1, 12), 
    ("oui", "non", "peut-être"),
    ("certainement", "non", "peut-être")
])
==

