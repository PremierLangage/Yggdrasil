# Author: Wenjie Fang

extends=/ComputerScience/python/AP1-1920/templates/pltest.pl
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

pltest0==
>>> compter_lignes("sample1.txt")
710
==

pltest1==
>>> compter_lignes("sample2.txt")
0
==

pltest2==
>>> compter_lignes("sample3.txt")
75
==

pltest3==
>>> compter_lignes("sample4.txt")
97
==

pltest4==
>>> compter_lignes("sample5.txt")
65
==
