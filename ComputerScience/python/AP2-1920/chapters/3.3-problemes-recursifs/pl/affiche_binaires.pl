extends = ../../../templates/generic/generic.pl

title = Fonctions : appartenance à un intervalle
# author = Antoine Meyer

text==
# Liste des mots binaires {.exo}

On souhaite écrire une fonction récursive `affiche_binaires(n)` permettant
d'afficher tous les nombres binaires écrits sur `n` chiffres. Par exemple :

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

#import sys
#print(pl_context, file=sys.stderr)

from types import FunctionType

def chaines_binaires_aux(n, prefixe):
    if n <= len(prefixe):
        return prefixe + '\n'
    else:
        return (chaines_binaires_aux(n, prefixe + '0')
                + chaines_binaires_aux(n, prefixe + '1'))

def chaines_binaires(n):
    return chaines_binaires_aux(n, '')
    
run(title='Existence de la fonction <tt>affiche_binaires_aux</tt>', 
    output='',
    types={"affiche_binaires":FunctionType})

run(f'affiche_binaires_aux(3, "000")', 
    title = f'Chaînes binaires de longueur 3 et de préfixe "000"',
    result = None,
    output = '000\n')

run(f'affiche_binaires_aux(3, "0")', 
    title = f'Chaînes binaires de longueur 3 et de préfixe "0"',
    result = None,
    output = chaines_binaires_aux(3, "0"))

run(title='Existence de la fonction <code>affiche_binaires</code>', 
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







