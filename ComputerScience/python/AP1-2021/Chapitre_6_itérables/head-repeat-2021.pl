# Author: Wenjie Fang

extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
builder=/builder/before.py

author=Wenjie Fang
Title=Répétition au début

text==
Prenons une chaîne de caractères. Il peut y avoir des motifs répétitifs au début de la chaîne.

Par exemple, la chaîne ``'pikapikachu'`` a le motif ``'pika'`` qui se répète deux fois au début.

Cependant, le motif le plus court n'est pas forcément celui qui se répète le plus.
Par exemple, dans ``'ananas-ananas-ananas-est-bien'``, même si ``'an'`` est le plus court motif qui se répète plus qu'une fois,
le motif ``'ananas-'`` se répète le plus (trois fois).

Ecrire une fonction ``rep_debut(s)`` qui prendre un paramètre ``s``, qui est une chaîne de caractères,
et qui renvoie le motif qui se répète le plus de fois. En cas d'égalité, on en prend le plus grand.
S'il n'y a pas de répétition, on renvoie ``s``.
==

tag=

samplesol==
def rep_debut(s):
    n = len(s)
    max = 0
    for i in range(n):
        motif = s[:i]
        cnt = 1
        while cnt * i < n and 
==

before==

==

pltest0==

==


