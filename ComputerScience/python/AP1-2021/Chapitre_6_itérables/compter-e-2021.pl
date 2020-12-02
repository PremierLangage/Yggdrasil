# Author: Wenjie Fang

extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
builder=/builder/before.py

author=Wenjie Fang
title=Compter les lettres "e"

text==
Ecrire une fonction ``compter_e(s)`` qui retourner le nombre de lettre ``e`` dans la chaîne de caractères ``s``.

Par exemple, pour ``s = "ceci n'est pas une pipe"``, l'appel ``compter_e(s)`` doit retourner ``4``.
==

tag=ForIn|string

samplesol==
def compter_e(s):
    cnt = 0
    for c in s:
        if c == 'e':
            cnt += 1
    return cnt
==

before==
==

pltest0==
>>> compter_e('') # Vide
0
>>> compter_e('la France') # Vive
1
>>> compter_e('eeeeeee') # Répétition
7
>>> compter_e('abracadabra') # Magique
0
>>> compter_e('templates') # PL
2
==
