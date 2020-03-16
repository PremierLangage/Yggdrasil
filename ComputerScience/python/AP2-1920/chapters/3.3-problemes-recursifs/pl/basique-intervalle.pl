extends = ../../../templates/generic/generic.pl

title = Fonctions : appartenance à un intervalle
# author = Antoine Meyer

text==
Écrire une fonction `dans_intervalle(n, a, b)` 
renvoyant `True` si l'objet `n` est strictement compris 
entre `a` et `b`, et `False` sinon.

Exemples d'appels :

    >>> dans_intervalle(4, 1, 12)
    True
    >>> dans_intervalle(40, 1, 12)
    False
    >>> dans_intervalle("oui", "non", "peut-être")
    True
    >>> dans_intervalle("certainement", "non", "peut-être")
    False

==

grader==#|python|

#import sys
#print(pl_context, file=sys.stderr)

def tests(cases):
    for n, a, b in cases:
        run(f'dans_intervalle({n!r}, {a!r}, {b!r})', 
            title = f'Appartenance de {n!r} dans l\'intervalle [{a!r}, {b!r}]',
            result = a < n < b)

run(title='Évaluation du code', 
    output='')

tests([
    (4, 1, 12), 
    (40, 1, 12), 
    ("oui", "non", "peut-être"),
    ("certainement", "non", "peut-être")
])
==



