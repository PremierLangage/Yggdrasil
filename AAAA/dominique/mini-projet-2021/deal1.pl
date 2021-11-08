




title= Distribution 

text==


Ecrire une fonction **deal** qui vérifie le doctest suivant :

```python

la fonction deal(deck,nbcard,rand=False) retourne un tuple de deux listes 

la première contient nbcard cartes choisi (aléatoirement rand ou pas) 

la deuxième contient les cartes du deck non selectionnés.

Si le deck ne contient pas assez de carte retourne None.
```

==


pltest==
>>> deal([],3)
>>> deal([(1,2),(3,4)],1)
[(1,2)],[(3,4)]
==

