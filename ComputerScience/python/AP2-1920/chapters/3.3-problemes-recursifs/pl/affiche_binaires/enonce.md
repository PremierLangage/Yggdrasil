On souhaite écrire une fonction récursive `affiche_binaires(n)`{.python} permettant
d'afficher tous les mots à `n` caractères dans l'alphabet binaire (`'0'` ou `'1'`). 
Par exemple :

```python
>>> affiche_binaires(2)
00
01
10
11
```

Pour résoudre ce problème plus aisément, on introduit une fonction auxiliaire
`affiche_binaires_prefixe(n, prefixe)`{.python} permettant d'afficher tous les nombres
binaires à `n` chiffres commençant par la chaîne `prefixe`{.python} (chaîne supposée
contenir uniquement des caractères `'0'`{.python} et `'1'`{.python}). Par exemple :

```python
>>> affiche_binaires_prefixe(4, '01')
0100
0101
0110
0111
```

Un algorithme possible est le suivant :

- Si `prefixe`{.python} est de taille `n`{.python}, on l'affiche ;
- Sinon, on affiche tous les nombres binaires de longueur `n`{.python} 
  commençant par `prefixe + '0'`{.python}, puis tous ceux commençant par 
  `prefixe + '1'`{.python}.

Le travail demandé est d'écrire la fonction récursive 
`affiche_binaires_prefixe(n, prefixe)` décrite ci- dessus, ainsi que la 
fonction `affiche_binaires(n)`.

