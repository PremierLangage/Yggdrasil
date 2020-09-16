extends = ../../templates/generic/generic.pl
author = Antoine Meyer &lt;<a href='mailto:antoine.meyer@u-pem.fr'>antoine.meyer@u-pem.fr</a>&gt;
title = Affichage des mots binaires

text ==
On souhaite écrire une fonction récursive `affiche_binaires(n)` permettant
d'afficher tous les mots à `n` caractères dans l'alphabet binaire (`'0'` ou `'1'`). 
Par exemple :

    >>> affiche_binaires(2)
    00
    01
    10
    11

Pour résoudre ce problème plus aisément, on introduit une fonction auxiliaire
`affiche_binaires_prefixe(n, prefixe)` permettant d'afficher tous les nombres
binaires à `n` chiffres commençant par la chaîne `prefixe` (chaîne supposée
contenir uniquement des caractères `'0'` et `'1'`). Par exemple :

    >>> affiche_binaires_prefixe(4, '01')
    0100
    0101
    0110
    0111

Un algorithme possible est le suivant :

- Si `prefixe` est de taille `n`, on l'affiche ;
- Sinon, on affiche tous les nombres binaires de longueur `n` 
  commençant par `prefixe + '0'`, puis tous ceux commençant par 
  `prefixe + '1'`.

Le travail demandé est d'écrire la fonction récursive 
`affiche_binaires_prefixe(n, prefixe)` décrite ci- dessus, ainsi 
que la fonction `affiche_binaires(n)`.


==

grader ==
def chaines_binaires_aux(n, prefixe):
    if n <= len(prefixe):
        return prefixe + '\n'
    else:
        return (chaines_binaires_aux(n, prefixe + '0')
                + chaines_binaires_aux(n, prefixe + '1'))


def chaines_binaires(n):
    if n == 0:
        return ''
    else:
        return chaines_binaires_aux(n, '')


begin_test('Exécution sans erreur')
execute_source()
assert_output("")
assert_no_exception()

begin_test_group("Test de la fonction <code>affiche_binaires_prefixe</code>")

begin_test('Respect des consignes')
assert_defines_function("affiche_binaires_prefixe")
assert_returns_none("affiche_binaires_prefixe")
assert_no_loop("affiche_binaires_prefixe")
assert_recursion("affiche_binaires_prefixe(3, '')")

begin_test('Chaînes binaires de longueur 3 et de préfixe "000"')
evaluate('affiche_binaires_prefixe(3, "000")')
assert_output('000\n')
assert_result(None)

begin_test('Chaînes binaires de longueur 3 et de préfixe "0"')
evaluate('affiche_binaires_prefixe(3, "0")')
assert_output(chaines_binaires_aux(3, "0"))
assert_result(None)

begin_test_group("Test de la fonction <code>affiche_binaires</code>")

begin_test('Respect des consignes')
assert_defines_function("affiche_binaires")
assert_returns_none("affiche_binaires")
assert_no_loop("affiche_binaires")
assert_calls_function("affiche_binaires", "affiche_binaires_prefixe")

begin_test('Chaînes binaires de longueur 0')
evaluate('affiche_binaires(0)')
assert_output('')
assert_result(None)

begin_test('Chaînes binaires de longueur 3')
evaluate('affiche_binaires(3)')
assert_output(chaines_binaires(3))
assert_result(None)
==
