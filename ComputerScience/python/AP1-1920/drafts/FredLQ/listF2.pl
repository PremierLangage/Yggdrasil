author= FLQ

# comment
extends=../../templates/pltest.pl
builder= /builder/before.py

title = Construction de liste 
text == 
Ecrire une fonction "remppair" qui remplace tous les éléments pairs d'une liste "lst" par 1
==

before==
# solution --- utilise len
def remppair(lst) :
    for i in range(len(lst)) :
        if lst[i]%2 == 0 :
            lst[i]=1
after=before
==

pltest0==
>>> lst=[2,6,5,8,9]
>>> remppair(lst)
>>> lst
[1, 1, 5, 1, 9]
==

pltest1==
>>> lst=[]
>>> remppair(lst)
>>> lst
[]
==
