# Author: Wenjie Fang

extends=/ComputerScience/python/template/pltest.pl
builder=/builder/before.py

author=Wenjie Fang
title=Lire les premiers lignes

text==
Ecrire une fonction ``head(filename)`` qui prend en paramètre le nom d'un fichier et qui imprime les premières 5 lignes du fichier. 
Si le fichier contient moins que 5 lignes, alors imprimer tous les lignes. On doit lire le fichier une et une seule fois.

**Attention**, une ligne lu depuis un fichier contient possiblement un caractère '\n' à la fin. Vous pouvez utiliser la méthode ``rstrip()`` pour l'éliminer.
==

tag=file|ForIn|break

samplesol==
def head(fn):
    with open(fn, 'r') as file:
        cnt = 0
        for s in file:
            print(s.rstrip())
            cnt += 1
            if cnt >= 5:
                break
==

@ testcase/sample1.txt [sample1.txt]
@ testcase/sample2.txt [sample2.txt]
@ testcase/sample3.txt [sample3.txt]
@ testcase/sample4.txt [sample4.txt]
@ testcase/sample5.txt [sample5.txt]
@ testcase/sample6.txt [sample6.txt]

before==
import psutil
==

pltest0==
>>> head("sample1.txt")
CHARTE DES DROITS FONDAMENTAUX DE L'UNION EUROPÉENNE
<BLANKLINE>
Le Parlement européen, le Conseil et la Commission proclament solennellement
en tant que Charte des droits fondamentaux de l'Union européenne le texte
repris ci-après.
==

pltest1==
>>> head("sample3.txt")
from random import randint
<BLANKLINE>
MIN = 2
MAX = 5
<BLANKLINE>
==

pltest2==
>>> head("sample4.txt")
La Marseillaise
<BLANKLINE>
Premier couplet
<BLANKLINE>
Allons, enfants de la Patrie,
==

pltest3==
>>> head("sample5.txt")
Hello World Cake with Chocolate sauce.
<BLANKLINE>
This prints hello world, while being tastier than Hello World Souffle. The main
chef makes a " world!" cake, which he puts in the baking dish. When he gets the
sous chef to make the "Hello" chocolate sauce, it gets put into the baking dish
==

pltest4==
>>> head("sample6.txt")
Albert Einstein
David Hilbert
Leonard Riemann
<BLANKLINE>
==
