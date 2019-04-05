
title= Un split sur la parité
extends=/ComputerScience/python/template/pltest.pl

text==

Ecrire une fonction **pair_impair** qui prend une liste d'entiers en paramêtre et qui
retourne une liste avec deux éléments la liste des entier pairs et la liste de entiers impairs du paramètre.

Remarque: (a, b) est un tuple et [a, b] une liste.
==

pltest==
>>> pair_impair == pair_impair #
True
>>> pair_impair([2,4,5,6,77])
[[2, 4, 6], [5, 77]]
>>> pair_impair([])
[[], []]
>>> import random #
>>> l=[ random.randint(1,100)*2 for x in range(10)] #
>>> pair_impair(l) == [[x for x in l], []] # une liste de 10 pairs 
True
>>> pair_impair([ x+1 for x in l]) == [[], [ x+1 for x in l]] # une liste de 10 impairs
True
>>> l2=l+[ x+1 for x in l] #
>>> pair_impair(l2) == [[x for x in l], [ x+1 for x in l]]  # 10 pairs 10 impairs
True
==

testcode==
def pair_impair(l):
    pair=[]
    impair=[]
    for e in l:
        if e%2==0:
            pair.append(e)
        else:
            impair.append(e)
    return [pair,impair]
==

