extends = ../../templates/generic/generic.pl
author = Antoine Meyer &lt;<a href='mailto:antoine.meyer@u-pem.fr'>antoine.meyer@u-pem.fr</a>&gt;
title = Sous-listes d'une liste

text ==
On souhaite écrire une fonction *récursive* `sous_listes(lst)` renvoyant la
liste de toutes les sous-listes de `lst`, c'est à dire de toutes les listes
contenant une partie des éléments de `lst`, dans l'ordre où ils apparaissent
dans `lst`. On pourra s'inspirer pour cela de l'algorithme utilisé dans 
l'exercice *affichage des mots binaires*.

Exemples :

    >>> sous_listes([])
    [[]]

    >>> sous_listes([1, 2])
    [[], [2], [1], [1, 2]]

La fonction ne doit provoquer aucun affichage. Votre programme ne doit pas 
créer d'autres variables globales que la fonction `sous_listes`. L'ordre dans
lequel les sous-listes apparaissent dans le résultat n'est pas imposé, mais 
l'ordre des éléments dans chaque sous-liste l'est.  

==

grader ==
from random import randrange


def sous_listes_corr(lst, indice=0):
    if indice >= len(lst):
        return [[]]
    else:
        tmp = sous_listes_corr(lst, indice + 1)
        tmp.extend([[lst[indice]] + sub for sub in tmp])
        return tmp


def sorted_cmp(lst1, lst2):
    return sorted(lst1) == sorted(lst2)


begin_test('Exécution sans erreur')
execute_source()
assert_output("")
assert_no_exception()

begin_test('Respect des consignes')
assert_defines_function('sous_listes')
assert_no_loop('sous_listes', ('while', ))
assert_recursion('sous_listes([1, 2])')

begin_test('Sous-listes de <tt>[]</tt>')
evaluate('sous_listes([])')
assert_result([[]])
assert_output("")

begin_test('Sous-listes de <tt>[1, 2, 3]</tt>')
evaluate('sous_listes([1, 2, 3])')
assert_result(sous_listes_corr([1, 2, 3]), cmp=sorted_cmp)
assert_output("")

begin_test("Sous-listes d'une liste aléatoire")
lst = [randrange(10) for _ in range(4)]
evaluate(f'sous_listes({lst})')
assert_result(sous_listes_corr(lst))
assert_output("")
==
