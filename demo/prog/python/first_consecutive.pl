extends = /model/progpython.pl

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
        

run(title='Évaluation du code',output='')

run('dans_intervalle(4,1,12)',title = 'Test 1',result = True)

tests([
    (4, 1, 12), 
    (40, 1, 12), 
    ("oui", "non", "peut-être"),
    ("certainement", "non", "peut-être")
])
==




