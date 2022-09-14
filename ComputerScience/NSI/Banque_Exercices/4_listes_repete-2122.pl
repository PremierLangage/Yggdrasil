extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title = Création d'une liste de répétitions

text==

Ecrire une fonction `repete` à deux paramètres (un entier `n` et une liste `lst`)  qui retourne une nouvelle liste composée de n copies de `lst`, jointes de façon consécutive.

Si `n` est négatif, la liste retournée doit être vide.

Par exemple,  `repete(3,['Non', 'Oui'])` donne `['Non', 'Oui', 'Non', 'Oui', 'Non', 'Oui']`

taboo: Ne pas utiliser la fonction <font style="color:red;">{{taboo}}</font> des listes.
==

taboo=extend

tag=listRepeat|ForInRange|append

pltest0==
>>> repete(3,['Non', 'Oui'])
['Non', 'Oui', 'Non', 'Oui', 'Non', 'Oui']
>>> repete(6, ['Non'])
['Non', 'Non', 'Non', 'Non', 'Non', 'Non']
>>> repete(0,['toto'])
[]
>>> repete(-4,['toto'])
[]
>>> repete(5,[[1,2]])
[[1, 2], [1, 2], [1, 2], [1, 2], [1, 2]]
>>> repete(4,[repete(3,[[]])])
[[[], [], []], [[], [], []], [[], [], []], [[], [], []]]
>>> repete(4,repete(2,[[]]))
[[], [], [], [], [], [], [], []]
>>> repete(1000, [])
[]
==

samplesol==
def repete(n, l):
    return n * l
==





