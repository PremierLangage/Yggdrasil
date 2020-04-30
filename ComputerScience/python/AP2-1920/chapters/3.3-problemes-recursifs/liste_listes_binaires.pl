extends = ../../templates/generic/generic.pl
author = Antoine Meyer &lt;<a href='mailto:antoine.meyer@u-pem.fr'>antoine.meyer@u-pem.fr</a>&gt;
title = Liste des listes binaires

text ==
On souhaite écrire une fonction récursive `liste_listes_binaires(n)` renvoyant 
la liste des mots à `n` caractères dans l'alphabet binaire (`'0'` ou `'1'`). 
Par exemple:

    >>> liste_listes_binaires(2)
    [[0, 0], [0, 1], [1, 0], [1, 1]]

Le travail demandé est d'écrire la fonction **récursive**
`liste_binaires_prefixe(n, prefixe)` décrite ci-dessus. On pourra s'inspirer 
pour cela de l' algorithme utilisé dans les exercices *Affichage des mots
 binaires* et *Liste des mots binaires*.
==

grader ==
def liste_listes_binaires_aux(n, acc):
    if n == len(acc):
        return [acc]
    else:
        res = liste_listes_binaires_aux(n, acc + [0])
        res.extend(liste_listes_binaires_aux(n, acc + [1]))
        return res


def liste_listes_binaires(n):
    return liste_listes_binaires_aux(n, [])


begin_test('Exécution sans erreur')
execute_source()
assert_output("")
assert_no_exception()

begin_test('Respect des consignes', fail_fast=False)
assert_defines_function("liste_listes_binaires")
assert_recursion("liste_listes_binaires(3)")

for i in range(10):
    begin_test(f'Listes binaires de longueur {i}', fail_fast=False)
    evaluate(f'liste_listes_binaires({i})')
    assert_output('')
    assert_result(liste_listes_binaires(i))
==

