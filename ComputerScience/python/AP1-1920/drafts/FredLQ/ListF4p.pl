author= FLQ

# comment
extends=../../templates/pltest.pl
builder= /builder/before.py

title = Manipulation de liste 
text == 
Ecrire une fonction "remone" qui supprime toutes les éléments égaux à 1 d'une liste "lst"
==

before==
# solution --- utilise remove, len
def remone(lst) :
    i=0
    while i < (len(lst)):
        lst.remove(1)
        i=i+1


after=before
==

pltest0==
>>> lst=[1,6,1,8,9]
>>> remone(lst)
>>> lst
[6, 8, 9]
==


