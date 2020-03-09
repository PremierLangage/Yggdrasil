extends = /model/progpython.pl

title = Filtrer une liste

text==
Écrire une fonction `filtre_pairs(lst)` qui renvoie la liste des entiers pairs 

Exemples d'appels :

    >>> filtre_pairs([0,31,3,4,3])

==

grader==#|python|


def ref(lst):
    return [num for num in lst if num % 2 == 0]     

run(title='Évaluation du code',output='')

begin_test_group("Tests de base")
run('filtre_pairs([2,21,5,7,4,4,13,0])',title = 'Test 1', result = [2,4,4,0])
run('filtre_pairs([3,13,7])', title = 'Test 1', result = [])

begin_test_group("Tests aléatoires")
run('filtre_pairs([2,21,5,7,4,4,13,0])',title = 'Test 1', result = [2,4,4,0])
run('filtre_pairs([3,13,7])', title = 'Test 1', result = [])

==

