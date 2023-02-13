title= Un split sur la parité
extends=/ComputerScience/python/template/pltest.pl

text==

Ecrire une fonction ``pair_impair`` qui prend une liste d'entiers en paramètre et qui
retourne une liste avec deux éléments : d'abord une liste des éléménts pairs dans la liste en paramètre, puis la liste des éléments impairs.

Par exemple, ``pair_impair([1, 7, 8, 9, 0, 7, 1, 4])`` doit renvoyer ``[[8, 0, 4], [1, 7, 9, 7, 1]]``.
==

tag=elementAccess|append|listCreate


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

samplesol==
def pair_impair(l):
    pair=[]
    impair=[]
    for e in l:
        if e%2==0:
            pair.append(e)
        else:
            impair.append(e)
    return [pair,impair]

# alternative
def pair_impair2(l):
    res = [[], []]
    for e in l:
        res[e%2].append(e)
    return res
==






