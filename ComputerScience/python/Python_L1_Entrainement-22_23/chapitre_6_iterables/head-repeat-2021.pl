# Author: Wenjie Fang

extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
builder=/builder/before.py

author=Wenjie Fang
title=Répétition au début

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

tag=substring|algo|stringRepeat

samplesol==
def rep_debut(s):
    n = len(s)
    max = 0
    maxs = ''
    for i in range(1, n + 1):
        motif = s[:i]
        idx = i
        while idx + i < n and motif == s[idx : idx + i]:
            idx += i
        cnt = idx // i
        if cnt >= max:
            maxs = motif
            max = cnt
    return maxs
==

before==
==

pltest0==
>>> rep_debut('') # Vide
''
>>> rep_debut('pikapikachu') # pika !
'pika'
>>> rep_debut('ananas-ananas-ananas-est-bien') # ananas
'ananas-'
>>> rep_debut('Université Gustave Eiffel') # la fac
'Université Gustave Eiffel'
>>> rep_debut('01101001100101101001011001101001') # Thue-Morse
'01101001100101101001011001101001'
>>> rep_debut('0100101001001') # Fibonacci
'01001'
==
