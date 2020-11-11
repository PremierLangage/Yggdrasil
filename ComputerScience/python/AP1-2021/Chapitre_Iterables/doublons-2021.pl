extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title = Ignorer les doublons d'une liste

text==
Ecrire une fonction `ignoredoublons` à un paramètre (une liste)
qui retourne une nouvelle liste composée d'une seule copie de chaque éléments.

Quand un élémént est en double seule la première occurence est copiée.

Par exemple, `ignoredoublons([3, 1, 2, 2, 1, 3])` renvoie `[3, 1, 2]`
==

tag=append|elementAccess

taboo=set

pltest0==
>>> ignoredoublons([3,1,2,2,1,3])
[3, 1, 2]
>>> ignoredoublons([])
[]
>>> ignoredoublons([1,1,1,1,1,1,1])
[1]
>>> ignoredoublons([1,2,1,2,1,2,1])
[1, 2]
>>> ignoredoublons([2,1,2,1,2,1])
[2, 1]
>>> ignoredoublons([True, 'toto', 3, 7])
[True, 'toto', 3, 7]
==

Xeditor.code==
def ignoredoublons(l):
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
            "answer" : "def ignoredoublons(l):\n    l2=[]\n    for x in l:\n         if x not in l2:\n             l2.append(x)\n    return l2"
        },
        "grade" : 100,
        "seed":12
    },
     "Incorrect" : {
        "response" : {
            "answer" : "def ignoredoublons(a,b):\n    return [a, b]\n"
        },
        "grade" : 0,
        "seed":12
    }
}
==







