author= FLQ

# comment
extends=../../templates/pltest.pl
builder= /builder/before.py

title = Construction de liste
text == 
Ecrire une fonction "tab3" qui modifie une liste "lst" passée en argument et 
qui y les 10 premiers éléments de la table de 3, en commençant par le multiple de 1.

==

before==
# solution --- utilise append
def tab3(lst) :
    for i in range(10) :
        lst.append((i+1)*3)
after=before
==

pltest0==
>>> lst=[] #
>>> tab3(lst) #
>>> lst
[3, 6, 9, 12, 15, 18, 21, 24, 27, 30]
==

pltest1==
>>> lst = [5] #
>>> tab3(lst) #
>>> lst
[5, 3, 6, 9, 12, 15, 18, 21, 24, 27, 30]
==





