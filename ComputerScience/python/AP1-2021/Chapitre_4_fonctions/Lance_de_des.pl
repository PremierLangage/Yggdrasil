# author oce
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl

title = Lancés de dés

text==  
Coder une fonction `Lances_Des` qui prend en paramètre un entier "n" compris entre 3 et 18
 et renvoie le nombre de façons de faire "n" en lançant trois dés.

==

@ /builder/before.py [builder.py]

#correction==
#def Lances_Des(n):
#    s = 0
#    for i in range(1, 7):
#        for j in range(1, 7):
#            for k in range(1, 7):
#                if i + j + k == n:
#                    s += 1
#    print("Il y a",s,"facon(s) de faire",n,"avec trois des.")
#==

before==
def Lances_Des(n):
    s = 0
    for i in range(1, 7):
        for j in range(1, 7):
            for k in range(1, 7):
                if i + j + k == n:
                    s += 1
    return s
import random 

for i in range(7):

    n=random.randint(2,19)
    p=Lances_Des(n)
    globals()[f"pltest{i}"]=f""">>> Lances_Des({n})\n{p}\n"""

==


