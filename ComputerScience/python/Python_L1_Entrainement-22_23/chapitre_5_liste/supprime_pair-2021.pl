# author FLQ

# comment
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
builder= /builder/before.py

title = Supprimer les éléments pairs 
text == 
Écrire une fonction `suppair` qui prend en argument une liste d'entiers et supprime tous les éléments pairs de celle-ci.
Par exemple, si on avait une liste `l = [2, 6, 5, 8, 9]`, alors après l'appel `suppair(l)`, **qui ne retourne rien et n'affiche rien**, la valeur de `l` doit devenir `[5, 9]`.

**Hint** : vous pouvez modifier directement la liste en utilisant la méthode `pop` pour une liste (`l.pop(i)` efface l'élément d'indice `i` dans la liste `l`). Attention, il faut tenir en compte que cette méthode change aussi les indices des éléménts qui viennent après !

**Hint** : pour une autre façon de faire, vous pouvez aussi créer une nouvelle liste qui retient tous les éléments impairs de la liste en paramètre, puis vider la liste originale et la remplir avec les éléments gardés dans la nouvelle liste.

==

tag=reference|elementAccess|pop

samplesol==
# solution --- utilise pop, len
def suppair(lst) :
    i=0
    while i<len(lst) :
        if lst[i]%2 == 0 :
            lst.pop(i)
        else :
            i=i+1

# solution alternative -- créer une nouvelle liste
def suppair2(l):
    ll = [e for e in l if e%2 != 0]
    l.clear()
    for e in ll:
        l.append(e)
==

pltest0==
>>> lst=[2,6,5,8,9] #
>>> suppair(lst) #
>>> lst
[5, 9]
==

pltest1==
>>> lst=[] #
>>> suppair(lst) #
>>> lst
[]
==

pltest2==
>>> lst=[2,6,5,8,10] #
>>> suppair(lst) #
>>> lst
[5]
==

pltest3==
>>> lst=[1,6,5,8,10] #
>>> suppair(lst) #
>>> lst
[1, 5]
==








