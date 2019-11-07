author= FLQ

# comment
extends=../../templates/pltest.pl
builder= /builder/before.py

title = Manipulation de liste 
text == 
Ecrire une fonction "suppair" qui supprime toutes les éléments pairs d'une liste "lst"
==

before==
# solution --- utilise pop, len
def suppair(lst) :
    i=0
    while i<len(lst) :
        if lst[i]%2 == 0 :
            lst.pop(i)
        else :
            i=i+1

after=before
==

pltest0==
>>> lst=[2,6,5,8,9]
>>> suppair(lst)
>>> lst
[5, 9]
==

pltest1==
>>> lst=[]
>>> suppair(lst)
>>> lst
[]
==

pltest2==
>>> lst=[2,6,5,8,10]
>>> suppair(lst)
>>> lst
[5]
==

pltest3==
>>> lst=[1,6,5,8,10]
>>> suppair(lst)
>>> lst
[1, 5]
==
