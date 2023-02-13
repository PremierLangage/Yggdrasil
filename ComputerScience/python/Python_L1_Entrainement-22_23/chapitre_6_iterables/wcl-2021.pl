# Author: Wenjie Fang

extends=/ComputerScience/python/template/pltest.pl
builder=/builder/before.py

author=Wenjie Fang
title=Compter les lignes

text==
Ecrire une fonction ``compter_lignes(filename)`` qui prend en paramètre le nombre d'un fichier et qui retourne le nombre de lignes dans ce fichier
==

tag=file|ForIn

samplesol==
def compter_lignes(fn):
    cnt = 0
    with open(fn, "r") as file:
        for _ in file:
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

pltest0==
>>> compter_lignes("sample1.txt")
711
==

pltest1==
>>> compter_lignes("sample2.txt")
2
==

pltest2==
>>> compter_lignes("sample3.txt")
76
==

pltest3==
>>> compter_lignes("sample4.txt")
98
==

pltest4==
>>> compter_lignes("sample5.txt")
66
==
