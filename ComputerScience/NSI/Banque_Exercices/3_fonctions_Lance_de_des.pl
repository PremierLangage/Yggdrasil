# author oce
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/template/pltest.pl

title = Lancés de dés

text==  
Coder une fonction `Lances_Des` qui prend en paramètre un entier "n" compris entre 3 et 18 et renvoie le nombre de façons de faire "n" en lançant trois dés.

Exemple:

    >>> Lances_Des(1)
    0 # Il est impossible de faire 1 avec la somme de 3 dés
    >>> Lances_Des(3)
    1 # Il n'y a qu'une manière de faire 3 avec la somme de 3 dés
    >>> Lances_Des(4)
    3 # Il y a trois manières de faire 4 avec la somme de 3 dés (1 + 1 + 2 ou 1 + 2 + 1 ou 2 + 1 + 1)
==

editor.code==
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


