# author FLQ

# comment
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
builder= /builder/before.py

title = Remplace les éléments d'une liste
text == 
Ecrire une fonction `remppair` qui prend en argument une liste d'entiers et remplace tous les entiers pairs dedans par 1.

Par exemple, si on avait une liste `l = [2, 4, 5, 6, 7]`, alors après l'appel `remppair(l)`, **qui ne retourne rien et n'affiche rien**,
la valeur de `l` doit devenir `[1, 1, 5, 1, 7]`.
==

tag=reference|mutable|ForInRange|len

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







