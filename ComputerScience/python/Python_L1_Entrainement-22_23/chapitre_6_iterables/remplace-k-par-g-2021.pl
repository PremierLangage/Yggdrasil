# Author: Wenjie Fang

extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
builder=/builder/before.py

author=Wenjie Fang
title=Remplacer les k par g

text==
La lettre k n'est utilisé que dans des rares occasions. Pourquoi pas les tous remplacer par la lettre g ?

Ecrire une fonction ``subs_k_par_g(s)`` qui prend une chaîne de caractères ``s`` et qui retourne la chaîne ``s`` avec tous les occurrences de ``k``
remplacé par ``g``. Par exemple, si ``s = 'kalm krach'``, alors ``subs_k_par_g(s)`` doit retourner ``'galm grach'``.
==

tag=immutable|ForIn|stringConcat

samplesol==
def subs_k_par_g(s):
    res = ''
    for c in s:
        if c == 'k':
            res += 'g'
        else:
            res += c
    return res
==

before==
==

pltest0==
>>> subs_k_par_g('')
''
>>> subs_k_par_g('kraken')
'gragen'
>>> subs_k_par_g('okokokok')
'ogogogog'
>>> subs_k_par_g('kokokoko')
'gogogogo'
>>> subs_k_par_g('kkkkkkk')
'ggggggg'
>>> subs_k_par_g('Ceci est bien une pipe.')
'Ceci est bien une pipe.'
==
