extends = /model/progpython.pl

title = Fonctions : appartenance à un intervalle

text==
Écrire une fonction `filtre_pairs(lst)` qui renvoie la liste des entiers pairs 

Exemples d'appels :

    >>> filtre_pairs([0,31,3,4,3])
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
def ref(lst):
    return [num for num in lst if num % 2 == 0]     

run(title='Évaluation du code',output='')

run('dans_intervalle(4,1,12)',title = 'Test 1',result = True)
run('dans_intervalle(0,1,12)',title = 'Test 1',result = True)

==




