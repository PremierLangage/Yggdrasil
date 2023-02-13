# Author: Wenjie Fang

extends=/ComputerScience/python/template/pltest.pl
builder=/builder/before.py

author=Wenjie Fang
title=Lire une matrice

text==
Nous avons des matrices (tableaux bidimensionnels d'entiers) stocker dans les fichiers sous la forme

    -3 4 -1 0
    2 0 -2 0
    1 -4 3 0

Chaque ligne du fichier consiste aux éléments d'une ligne de la matrice, avec des entiers séparés par un espace. Les entiers pourraient être positifs ou négatifs.

Maintenant, nous voulons lire les matrices dans ces fichiers et les stocker comme des listes de listes.
La structure de données sera une liste dont chaque élément est une liste des entiers dans la même ligne.
Par exemple, la matrice dans le fichier précédente doit être représentée comme la liste suivante en Python :

    [[-3, 4, -1, 0], [2, 0, -2, 0], [1, -4, 3, 0]]

Ecrire une fonction ``lire_matrice(filename)`` qui prend en paramètre le nom ``filename`` du fichier à lire, qui lit le fichier
et qui retourne la liste de listes représentant la **matrice d'entiers** dans le fichier.
Vous pouvez utiliser la méthode ``split`` des chaînes de caractères. On peut supposer que le fichier n'est jamais vide.

**Attention**, une ligne lu depuis un fichier contient possiblement un caractère '\n' à la fin,
qui pourrait être supprimé avec la méthode ``rstrip()`` des chaînes de caractères.
==

tag=file|listoflist|split|ForIn

samplesol==
def lire_matrice(fn):
    res = []
    with open(fn, 'r') as file:
        for s in file:
            l = s.rstrip().split(" ")
            res.append([int(e) for e in l])
    return res
==

before==
import psutil
==

@ testcase/mat2.txt [mat2.txt]
@ testcase/mat3.txt [mat3.txt]
@ testcase/mat4.txt [mat4.txt]
@ testcase/mat5.txt [mat5.txt]

pltest0==
>>> lire_matrice("mat2.txt")
[[-3, 4, -1], [2, 0, -2], [1, -4, 3]]
==

pltest1==
>>> lire_matrice("mat3.txt")
[[1, 1, 1, 1, 1], [1, 1, 1, 1, 1], [1, 1, 1, 1, 1]]
==

pltest2==
>>> lire_matrice("mat4.txt")
[[0, 0, 0, 0, 0, 9, 43789543, -3418594, 0, 0, 0, 0, 0, 0]]
==

pltest3==
>>> lire_matrice("mat5.txt")
[[3], [4], [5], [6], [-353289], [5427832], [0], [0], [0], [-1]]
==



