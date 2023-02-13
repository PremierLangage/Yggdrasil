author=Emmanuel Brunache
name= Retourne bonjour
title= Retourne bonjour # N'oubliez pas de remplir ce champs svp
tag=def|parameters|return # N'oubliez pas de remplir ce champs svp
extends=/ComputerScience/python/template/pltest.pl
@ /builder/before.py [builder.py]
piste=verte


text==

Écrire une fonction **bonjour()** qui ne prend aucun argument et retourne la chaine de caractère `bonjour`.

Exemple :

    >>> bonjour()
    'bonjour'

==

pltest==
    >>> bonjour()
    'bonjour'
==


testcode==
def bonjour():
    return 'bonjour'
==
