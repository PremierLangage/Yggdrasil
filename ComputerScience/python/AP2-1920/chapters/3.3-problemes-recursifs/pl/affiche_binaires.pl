extends = ../../../templates/generic/generic.pl

@ ../../../templates/generic/utils/ast_analyzer.py

title = Affichage des mots binaires
# author = Antoine Meyer

text==
On souhaite écrire une fonction récursive `affiche_binaires(n)` permettant
d'afficher tous les mots à `n` caractères dans l'alphabet binaire ('0' ou '1'). 
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

-   Si `prefixe` est de taille `n`, on l'affiche ;
-   Sinon, on affiche tous les nombres binaires de longueur `n` commençant par
    `prefixe + '0'`, puis tous ceux commençant par `prefixe + '1'`.

Le travail demandé est d'écrire la fonction récursive 
`affiche_binaires_prefixe(n, prefixe)` décrite ci- dessus, ainsi que la 
fonction `affiche_binaires(n)`.
==

grader==#|python|

import inspect
from ast_analyzer import *
#print(pl_context, file=sys.stderr)

from types import FunctionType

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


begin_test_group("Test de la fonction <tt>affiche_binaires_prefix</tt>")

run(title='Existence de la fonction <tt>affiche_binaires_prefix</tt>', 
    output='',
    types={"affiche_binaires_prefix":FunctionType})

run(title='Respect des consignes', 
    output='',
    types={"affiche_binaires_prefix":FunctionType})
assert_no_loop("affiche_binaires_prefixe")
assert_simple_recursion("affiche_binaires_prefixe")

run(f'affiche_binaires_prefix(3, "000")', 
    title = f'Chaînes binaires de longueur 3 et de préfixe "000"',
    result = None,
    output = '000\n')

run(f'affiche_binaires_prefix(3, "0")', 
    title = f'Chaînes binaires de longueur 3 et de préfixe "0"',
    result = None,
    output = chaines_binaires_aux(3, "0"))

end_test_group()

begin_test_group("Test de la fonction <tt>affiche_binaires</tt>")

run(title='Existence de la fonction <tt>affiche_binaires</tt>', 
    output='',
    types={"affiche_binaires":FunctionType})

run(f'affiche_binaires(0)', 
    title = f'Chaînes binaires de longueur 0',
    result = None,
    output = '')

run(f'affiche_binaires(3)', 
    title = f'Chaînes binaires de longueur 3',
    result = None,
    output = chaines_binaires(3))
==










