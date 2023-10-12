# Author: Wenjie Fang

extends=/ComputerScience/python/template/pltest.pl
builder=/builder/before.py

author=Wenjie Fang
title=Recherche de motif dans un fichier

text==
Ecrire une fonction ``grep(filename, pattern)`` qui cherche le motif ``pattern`` dans le fichier indiqué par ``filename``. La fonction imprime tous les lignes du fichier recherché qui contient le motif.

Par exemple, supposons que le fichier ``test.txt`` contient

    Aujourd'hui on apprend un peu plus de Python.
    Hier on ne savait pas coder,
    Demain probablement non plus.

Alors l'appel ``grep('test.txt', 'plus')`` doit imprimer

    Aujourd'hui on apprend un peu plus de Python.
    Demain probablement non plus.
    
Chaque ligne termine bien avec un et un seul retour à la ligne.
==

tag=file|ForIn|substring

samplesol==
def grep(fn, s):
    res = ''
    with open(fn, "r") as f:
        for l in f:
            if s in l:
                res += l
    print(res, end = '')
    return
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
>>> grep('sample1.txt', 'liberté de circulation')
2. La liberté de circulation et de séjour peut être accordée, conformément
==

pltest1==
>>> grep('sample2.txt', 'math')
==

pltest2==
>>> grep('sample3.txt', 'affiche_etat')
def affiche_etat(endurance, portefeuille, salle):
    affiche_etat(endurance, portefeuille, salle)
==

pltest3==
>>> grep('sample4.txt', 'Patrie')
Allons, enfants de la Patrie,
Amour sacré de la Patrie,
==

pltest4==
>>> grep('sample5.txt', 'chocolate')
sous chef to make the "Hello" chocolate sauce, it gets put into the baking dish
actually cooking, I'm interpreting the chocolate sauce baking dish to be
33 g chocolate chips
Put chocolate chips into the mixing bowl.
Serve with chocolate sauce.
chocolate sauce.
101 g dark chocolate
72 g milk chocolate
Liquefy the dark chocolate.
Put dark chocolate into the mixing bowl.
Liquefy the milk chocolate.
Put milk chocolate into the mixing bowl.
==

