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

Questions :

1.  Écriture des fonctions de base : 
    
    1.  Pour un `n` quelconque, combien de nombres l'appel
        `affiche_binaires(n)` devrait-il afficher ?
    1.  Combien de nombres l'appel `affiche_binaires_prefixe(n, prefixe)`
        devrait-il afficher ?
    1.  Écrire la fonction récursive `affiche_binaires_prefixe(n, prefixe)`
        décrite ci- dessus.
    1.  En déduire une écriture de la fonction `affiche_binaires(n)`.

1.  Variantes :

    1.  Écrire une fonction récursive `liste_binaires(n, prefixe)` qui
        *construit* la liste des nombres binaires à $n$ chiffres (représentés
        par des chaînes de caractères).

    1.  $\bigstar$ Écrire une fonction récursive `liste_binaires_bis` qui
        construit la liste des listes d'entiers (`0` ou `1`) décrivant les mots
        binaires de longueur $n$.

    1.  Écrire une fonction récursive `liste_nombres_base(n, b)` qui
        construit la liste des listes d'entiers de `0` à `b-1` décrivant tous
        les nombres en base `b` de longueur $n$.
    
    1.  Vérifiez sur machine que la liste renvoyée par `liste_nombres_base(3,
        10)` contient bien 1000 éléments. Plus généralement, combien la liste
        renvoyée par `liste_nombres_base(n, b)` contient-elle d'éléments ?
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



