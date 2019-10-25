


extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title = Création d'une liste 

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
            "answer" : """def create(a,b):
    return [a, b]
    """
        },
        "grade" : 100,
        "feedback" : "Bonne réponse\n"
    },
}
