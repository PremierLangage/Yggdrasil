


extends= /ComputerScience/python/AP1-1920/templates/pltest.pl


title = Liste composée

text==

Ecrire une fonction `create` à deux paramètres qui retourne la liste composée des deux paramètres.

==


pltest0==
>>> create(2,"4")
[2, '4']
>>> create(3.14,"titi")
[3.14, 'titi']
==

xeditor.code==


==

tests %=
{
    "correct" : {
        "response" : {
            "answer" : "def create(a,b):\n    return [a, b]\n"
        },
        "grade" : 100,
        "seed":12
    },
     "Incorrect" : {
        "response" : {
            "answer" : "def creatA(a,b):\n    return [a, b]\n"
        },
        "grade" : 0,
        "seed":12
    }
}
==


