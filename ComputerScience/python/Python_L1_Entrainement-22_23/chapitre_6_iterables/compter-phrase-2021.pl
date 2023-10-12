# Author: Wenjie Fang

extends=/ComputerScience/python/template/pltest.pl
builder=/builder/before.py

author=Wenjie Fang
title=Compter les phrases dans un fichier

text==
On veut compter le nombre de phrases dans un fichier. On peut considérer qu'une phrase termine toujours avec un point ("."), un point d'intérogation ("?") ou un point d'exclamation ("!"). Ce sont les puncutations à la fin d'une pharse qu'on va considérer. Il y a aussi des fichiers qui ne contient pas de phrase.

Ecrire une fonction ``nbPhrase(filename)`` qui prend en paramètre le nom d'un fichier, et qui retourne le nombre de phrases dans ce fichier, en comptant les trois pontuations mentionnées auparavant.
==

tag=file|ForIn|stringIndex

samplesol==
def nbPhrase(fn):
    with open(fn, "r") as file:
        cnt = 0
        for s in file:
            for c in s:
                if c == '.' or c == '?' or c == '!':
                    cnt += 1
        return cnt
==

before==
import psutil
==

@ testcase/sample1.txt [sample1.txt]
@ testcase/sample2.txt [sample2.txt]
@ testcase/sample3.txt [sample3.txt]
@ testcase/sample4.txt [sample4.txt]
@ testcase/sample5.txt [sample5.txt]
@ testcase/sample6.txt [sample6.txt]

pltest0==
>>> nbPhrase("sample1.txt")
184
==

pltest1==
>>> nbPhrase("sample2.txt")
0
==

pltest2==
>>> nbPhrase("sample3.txt")
8
==

pltest3==
>>> nbPhrase("sample4.txt")
28
==

pltest4==
>>> nbPhrase("sample5.txt")
41
==

pltest5==
>>> nbPhrase("sample6.txt")
0
==
