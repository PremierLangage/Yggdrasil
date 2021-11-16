

doc==

# Objectif de ce model proposer un exercice 
Ou l'on affiche deux fonctions de même non mais avec un code différent 

    f1==
    def f():
        return 3
    ==

    f2==
    def f():
        return 4
    ==

l'objectif de l'étudiant est d'écrire un doc test qui passe pour f1 mais pas pour f2.

Par exemple ici 
    doctest==
    >>> f()
    3
    ==
vas fonctionner pour f1 mais pas pour f2.

==

title = Exercice de doctest boucle 

f1==
def f(n):
    p=1
    for n in range(n):
        p += n
    return p
==

f2==
def f(n):
    p=1
    while n >0 :
        p += n
        n = n -1 
    return p
==


text==

Soit la version 1 de la fonction :
```
{f1}
```
et la version 2 de la fonction :
```
{f2}
```

Ecrivez un doctest qui 'passe' pour f1 et qui échoue pour f2.

==

