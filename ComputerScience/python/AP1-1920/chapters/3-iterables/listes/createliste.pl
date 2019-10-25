


extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
@ /builder/before.py [builder.py]

title = Création d'une liste 

text==

Ecrire une fonction `create` à deux paramètres qui retourne la liste composée des deux paramètres.

==


pltest0==
>>> create(2,"4")
[2, '4']
==

editor.code==

def create(a,b):
    return [a, b]
    
==
