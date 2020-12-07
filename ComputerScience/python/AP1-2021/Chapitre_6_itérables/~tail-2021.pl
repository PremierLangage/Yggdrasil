# Author: Wenjie Fang

extends=/ComputerScience/python/template/pltest.pl
builder=/builder/before.py

author=Wenjie Fang
title=Lire les dernières lignes

text==
Ecrire une fonction ``tail(filename)`` qui prend en paramètre le nom d'un fichier et qui imprime **les dernières 5 lignes du fichier**.
Si le fichier contient moins que 5 lignes, alors imprimer tous les lignes. On peut faire ça en lisant le fichier une et une seule fois.

**Attention**, une ligne lue depuis un fichier pourrait contenir un '\n' à la fin. Il faut bien traiter ce cas pour l'imprimer sans des lignes en trop.
==

tag=file|ForIn|algo

samplesol==
def tail(fn):
    with open(fn, 'r') as file:
        cnt, lines = 0, []
        for s in file:
            if cnt < 5:
                cnt += 1
                lines.append(s)
            else:
                lines.pop(0)
                lines.append(s)
        res = ""
        for s in lines:
            res += s
        print(res)
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
>>> tail("sample1.txt")
<BLANKLINE>
Le texte ci-dessus reprend, en l'adaptant, la Charte proclamée le 7 décembre
2000 et la remplacera à compter du jour de l'entrée en vigueur du traité
de Lisbonne.
<BLANKLINE>
==

pltest1==
>>> tail("sample2.txt")
<BLANKLINE>
==

pltest2==
>>> tail("sample3.txt")
    affiche_etat(endurance, portefeuille, salle)
    salle += 1
print("Fin d'aventure.")
print("J'étais comme vous avant de prendre une flèche dans mes genoux...")
<BLANKLINE>
==

pltest3==
>>> tail("sample4.txt")
Nous aurons le sublime orgueil
De les venger ou de les suivre.
<BLANKLINE>
Refrain 
<BLANKLINE>
==

pltest4==
>>> tail("sample5.txt")
Put milk chocolate into the mixing bowl.
Liquefy contents of the mixing bowl.
Pour contents of the mixing bowl into the baking dish.
Refrigerate for 1 hour.
<BLANKLINE>
==

pltest5==
>>> tail("sample6.txt")
Albert Einstein
David Hilbert
Leonard Riemann
==

