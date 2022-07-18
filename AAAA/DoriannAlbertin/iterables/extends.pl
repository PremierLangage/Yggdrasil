



extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title = Fusion de deux listes 

text==

Ecrire une fonction `fusion` à deux paramètres (des listes) qui retourne la liste composée
 des ééments de la première suivis des éléments de la seconde

>>> fusion([1,1],[2,2])
[1, 1, 2, 2]
==

taboo=extend

pltest0==
>>> fusion([1,1],[2,2])
[1, 1, 2, 2]
>>> fusion([],[])
[]
==

Xeditor.code==
def fusion(a,b):
    a.extend(b)
    return a

==

tests %=
{
    "correct" : {
        "response" : {
            "answer" : "def fusion(a,b):\n    a.extend(b)\n    return a\n"
        },
        "grade" : 100,
        "seed":12
    },
     "Incorrect" : {
        "response" : {
            "answer" : "def fusion(a,b):\n    return [a, b]\n"
        },
        "grade" : 0,
        "seed":12
    }
}
==




