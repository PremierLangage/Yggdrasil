





extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title = Création d'une liste de répétitions

text==

Ecrire une fonction `repete` à deux paramètres (un entier `n` une liste `ll`)  qui retourne la liste composée de n copies de chaque éléments de `l`.

Quand un élément est en double seul la première occurence est gardée.

>>> repete([3, 1,2,2,1,3])
[3, 1, 2]
==

taboo=extend

pltest0==
>>> repete(6,"Non")
['Non', 'Non', 'Non', 'Non', 'Non', 'Non']
>>> repete(0,1)
[]
>>> repete(5,[1,2])
[[1, 2], [1, 2], [1, 2], [1, 2], [1, 2]]
>>> repete(4,repete(3,[]))
[[[], [], []], [[], [], []], [[], [], []], [[], [], []]]
==

editor.code==
 

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

