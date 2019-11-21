# author FLQ
# + DR

# comment
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl
builder= /builder/before.py

title = Somme des nombres paires d'une liste 
text == 
Ecrire une fonction "lpairs" qui calcule la somme "somp" de toutes les valeurs paires d'une liste d'au moins 5 entiers. 
Exemple: L = [1, 8, 48, 2, 19]
==

taboo=extend

before==
# solution ---
L = [1, 8, 48, 2, 19]
n = len(L)
def lpairs(lst,n) :
    somp = 0
    for i in range(n) :
        if lst[i] %2 == 0 :
            somp = somp + lst[i]
    print ("Somme des valeurs paires : ", somp)

==

pltest0==
>>> lst=[L = [1, 8, 48, 2, 19] #
>>> lpairs(lst,5) #
>>> lst
[8, 48, 2]

==





