




extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title = Création d'une liste 

text==

Ecrire une fonction `retiredoublons` à un paramètres (des listes)  qui retourne la liste composée d'une seule copie de chaque éléments.

Quand un élémént est en double seul la première occurence est gardée.

>>> retiredoublons([3, 1,2,2,1,3])
[3, 1, 2]
==

taboo=extend

pltest0==
>>> retiredoublons([3, 1,2,2,1,3])
[3, 1, 2]
>>> retiredoublons([])
[]
>>> retiredoublons([1,1,1,1,1,1,1])
[1]
>>> retiredoublons([1,2,1,2,1,2,1])
[1, 2]
>>> retiredoublons([2,1,2,1,2,1])
[2, 1]
==

Xeditor.code==
def retiredoublons(l):
    l2=[]
    for x in l:
         if x not in l2:
             l2.append(x)
    return l2

==

tests %=
{
    "correct" : {
        "response" : {
            "answer" : "def retiredoublons(l):\n    l2=[]\n    for x in l:\n         if x not in l2:\n             l2.append(x)\n    return l2"
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

