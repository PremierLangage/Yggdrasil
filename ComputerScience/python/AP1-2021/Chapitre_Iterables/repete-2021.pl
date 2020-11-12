extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title = Création d'une liste de répétitions

text==

Ecrire une fonction `repete` à deux paramètres (un entier `n` une liste `ll`)  qui retourne une nouvelle liste composée de n copies de chaque éléments de `l`.

Par exemple,  `repete(3,['Non', 'Oui'])` donne `['Non', 'Oui', 'Non', 'Oui', 'Non', 'Oui']`

taboo: Ne pas utiliser la fonction <font style="color:red;">{{taboo}}</font> des listes.
==

taboo=extend

pltest0==
>>> repete(6,"Non")
['Non', 'Non', 'Non', 'Non', 'Non', 'Non']
>>> repete(0,1)
[]
>>> repete(5,[1,2])
[[1, 2], [1, 2], [1, 2], [1, 2], [1, 2]]
>>> repete(4,repete(3,[]))
[[[], [], []], [[], [], []], [[], [], []], [[], [], []]]
==

Xeditor.code==
def repete(n, l):
    return n*[l]

==

