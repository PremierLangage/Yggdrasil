
#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]
title = Afficher les "n" premiers multiples d'un entier "x"

before==
import random
def table(x,n):
    lst = []
    for i in range(n):
        lst.append(str(i * x))
    return "\n".join(lst)
x, n = random.randint(4,20), random.randint(4,20)
pltest1= ">>> affiche_table({}, {})\n{}".format(x, n, table(x, n))
==

text==  

Ecrire une fonction `affiche_table` qui : <br> 
* prend en paramètre deux entiers strictement positif : <br>
    + un entier x  <br>
    + un entier n <br>
* imprime les n premiers multiples de x.

Exemple:

    >>> affiche_table(4, 6)
    0
    4
    8
    12
    16
    20
==

editor.code==
==

Xeditor.code==
def affiche_table(x,n):
    for i in range(n):
        print(i * x)
==

pltest0==
>>> affiche_table(4, 6)
0
4
8
12
16
20
==
