
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title = Création d'une liste de répétitions

text==

Ecrire une fonction `repete` à deux paramètres (un entier `n` une liste `l`)  qui retourne une nouvelle liste composée de n copies de chaque éléments de `l`.

Par exemple,  `repete(6, ["Non"])` renvoie `["Non", "Non", "Non", "Non", "Non", "Non"]`, et `repete(2, [4, "a", [42,13]]` renvoie `[4, "a", [42,13], 4, "a", [42,13]]`.

taboo: Ne pas utiliser la fonction <font style="color:red;">{{taboo}}</font> des listes.
==

taboo=extend



Xeditor.code==
def repete(n,lst):
    l=[]
    for i in range(n):
        for e in lst:
            l.append(e)
    return l

==
pltest0==
>>> repete(6,["Non"])
['Non', 'Non', 'Non', 'Non', 'Non', 'Non']
>>> repete(0,[1])
[]
>>> repete(5,[1,2])
[1, 2, 1, 2, 1, 2, 1, 2, 1, 2]
>>> repete(4,repete(3,[]))
[]
==

