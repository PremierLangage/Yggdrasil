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


