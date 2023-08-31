title=Est-ce qu'il y a un impair ?
extends=/ComputerScience/python/template/pltest.pl

editor.code==
==

text==

Ecrire une fonction ``exist_impairs`` qui prend une liste en paramètre 
et qui retourne True s'il existe un entier impair dans la liste.

Par exemple, ``exist_impairs([2, 0, 1, 9])`` doit renvoyer ``True``, parce qu'il y a 1 et 9 dans la liste,
mais ``exist_impairs([2, 0, 2, 0])`` et ``exist_impairs([])`` doivent renvoyer ``False``.
==

tag=elementAccess

samplesol==
def exist_impairs(l):
    for x in l:
        if x%2 == 1:
            return True
    return False
==


pltest==
>>> not exist_impairs([2,4,5,6,77])
False
>>> exist_impairs([])
False
>>> import random #
>>> l=[ random.randint(1,100)*2 for x in range(10)] #
>>> exist_impairs(l) # Test avec longue liste de pairs
False
>>> exist_impairs([ x+1 for x in l])# Longue liste d'impairs
True
==





