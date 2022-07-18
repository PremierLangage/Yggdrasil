# author FLQ

# comment
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
builder= /builder/before.py

title = Remplace les éléments d'une liste
text == 
Ecrire une fonction `remppair` qui prend en argument une liste  et  remplace tous ses éléments pairs par 1
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
>>> lst=[2,6,5,8,9] #
>>> remppair(lst) #
>>> lst
[1, 1, 5, 1, 9]
==

pltest1==
>>> lst=[] #
>>> remppair(lst) #
>>> lst
[]
==





