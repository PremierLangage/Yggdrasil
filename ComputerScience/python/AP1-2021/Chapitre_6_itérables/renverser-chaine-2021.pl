# Author: Wenjie Fang

extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]

author=Wenjie Fang
title=Renverser une chaîne

text==
Ecrire une fonction ``renverser(s)`` qui prend en paramètre une chaîne de charactères ``s``, puis retourner la même chaîne **mais lue à l'envers**. 

Par exemple, si ``s = "Ceci n'est pas une pipe."``, alors l'appel ``renverser(s)`` doit retourner la chaîne ``".epip enu sap tse'n iceC"``.
==

tag=string|stringIndex

samplesol==
def renverser(s):
    res = ''
    for e in s:
        res = e + res
    return res 
    
def renverser2(s):
    return s[::-1]
==

before==
from random import randint

l = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', '.', ' ', ',', '?']
n = len(l)

def buildstr():
    sl = randint(10, 30)
    res = ''
    for i in range(sl):
        res += l[randint(0, n-1)]
    return res

s = buildstr()
res = s[::-1]
pltest1 = f">>> renverser('{s}')\n'{res}'"

s = buildstr()
res = s[::-1]
pltest2 = f">>> renverser('{s}')\n'{res}'"

s = buildstr()
res = s[::-1]
pltest3 = f">>> renverser('{s}')\n'{res}'"

s = buildstr()
res = s[::-1]
pltest4 = f">>> renverser('{s}')\n'{res}'"

after = before
==

pltest0==
>>> renverser('') # Vide
''
>>> renverser('asdf')
'fdsa'
>>> renverser('anana')
'anana'
>>> renverser('Copernic')
'cinrepoC'
==

