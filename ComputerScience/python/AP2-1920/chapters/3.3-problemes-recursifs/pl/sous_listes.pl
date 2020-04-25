extends = ../../../templates/generic/generic.pl

title = Récursivité : liste des sous-listes
# author = Antoine Meyer

text==
# Liste des sous-listes {.exo}

On souhaite écrire une fonction récursive `sous_listes(lst)` renvoyant
la liste de toutes les sous-listes de `lst`, c'est à dire de toutes les listes contenant certains éléments de `lst`, dans le mêême ordre.

    >>> liste_binaires(2)
    ['00', '01', '10', '11']

Pour résoudre ce problème plus aisément, on introduit une fonction auxiliaire
`liste_binaires_prefixe(n, prefixe)` permettant d'afficher tous les nombres
binaires à `n` chiffres commençant par la chaîne `prefixe` (chaîne supposée
contenir uniquement des caractères `'0'` et `'1'`). Par exemple :

    >>> liste_binaires_prefixe(4, '01')
    ['0100', '0101', '0110', '0111']

Le travail demandé est d'écrire la fonction **récursive** 
`liste_binaires_prefixe(n, prefixe)` décrite ci- dessus, ainsi que la 
fonction `liste_binaires(n)`. On pourra s'inspirer pour cela de l'algorithme
utilisé dans l'exercice *affichage des mots binaires*.
==

grader==#|python|

#import sys
#print(pl_context, file=sys.stderr)

#TODO : réorganiser les tests (groupes), tester la récursivité, l'absence de boucles

from types import FunctionType

def liste_binaires_aux(n, prefixe):
    if n <= len(prefixe):
        return [prefixe]
    else:
        return liste_binaires_aux(n, prefixe + '0')
               + liste_binaires_aux(n, prefixe + '1')

def liste_binaires(n):
    return liste_binaires_aux(n, '')
    
run(title='Existence de la fonction <tt>liste_binaires_aux</tt>', 
    output='',
    types={"liste_binaires_aux":FunctionType})

run(f'liste_binaires_aux(3, "000")', 
    title = f'Chaînes binaires de longueur 3 et de préfixe "000"',
    result = liste_binaires_aux(3, "000"))

run(f'liste_binaires_aux(3, "0")', 
    title = f'Chaînes binaires de longueur 3 et de préfixe "0"',
    result = liste_binaires_aux(3, "0"))

run(title='Existence de la fonction <tt>liste_binaires</tt>', 
    output='',
    types={"liste_binaires":FunctionType})

run(f'liste_binaires(0)', 
    title = f'Chaînes binaires de longueur 0',
    result = [])

run(f'liste_binaires(3)', 
    title = f'Chaînes binaires de longueur 3',
    result = liste_binaires(3))
==

