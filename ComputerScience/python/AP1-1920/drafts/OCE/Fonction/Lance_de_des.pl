# author oce
# Heritage d'un type d'exercice 
extends= /ComputerScience/python/AP1-1920/templates/pltest.pl

title = Lancés de dés

text==  
Coder une fonction "Lances_Des" qui prend en paramètre un entier "n" compris entre 3 et 18 et retournant le nombre de façons de faire "n" en lançant trois dés.

==

#correction==
#def Lances_Des(n):
#    s = 0
#    for i in range(1, 7):
#        for j in range(1, 7):
#            for k in range(1, 7):
#                if i + j + k == n:
#                    s += 1
#   return s
#

pltest0==
>>> Lances_Des(5)
6
==
pltest1==
>>> Lances_Des(12)
25
==
pltest2==
>>> Lances_Des(1)
0
pltest3==
>>> Lances_Des(3)
1
==






