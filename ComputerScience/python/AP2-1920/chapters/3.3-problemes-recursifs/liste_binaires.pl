extends = ../../templates/generic/generic.pl
author = Antoine Meyer &lt;<a href='mailto:antoine.meyer@u-pem.fr'>antoine.meyer@u-pem.fr</a>&gt;
title = Liste des mots binaires

text ==
On souhaite écrire une fonction récursive `liste_binaires(n)` renvoyant la
liste des mots à `n` caractères dans l 'alphabet binaire (' 0 ' ou ' 1 '). Par
exemple:

    >>> liste_binaires(2)
    ['00', '01', '10', '11']

Pour résoudre ce problème plus aisément, on introduit une fonction auxiliaire
`liste_binaires_prefixe(n, prefixe)` permettant d 'afficher tous les nombres
binaires à `n` chiffres commençant par la chaîne `prefixe`(chaîne supposée
contenir uniquement des caractères `'0'` et `'1'`).Par exemple:

    >>> liste_binaires_prefixe(4, '01')
    ['0100', '0101', '0110', '0111']

Le travail demandé est d 'écrire la fonction **récursive**
`liste_binaires_prefixe(n, prefixe)` décrite ci - dessus, ainsi que la
fonction `liste_binaires(n)`.On pourra s 'inspirer pour cela de l' algorithme
utilisé dans l 'exercice *affichage des mots binaires*.
==

grader ==
def liste_binaires_aux(n, prefixe):
    if n <= len(prefixe):
        return [prefixe]
    else:
        return (liste_binaires_aux(n, prefixe + '0')
                + liste_binaires_aux(n, prefixe + '1'))


def liste_binaires(n):
    return liste_binaires_aux(n, '')


begin_test('Exécution sans erreur')
execute_source()
assert_output("")
assert_no_exception()

begin_test('Respect des consignes', fail_fast=False)
assert_defines_function("liste_binaires")
assert_no_loop("liste_binaires")
assert_recursion("liste_binaires(3)")

for i in range(10):
    begin_test(f'Chaînes binaires de longueur {i}', fail_fast=False)
    evaluate(f'liste_binaires({i})')
    assert_output('')
    assert_result(liste_binaires(i))
==
