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
#    print("Il y a",s,"facon(s) de faire",n,"avec trois des.")
#==

pltest0==
>>> Lances_Des(5)
Il y a 6 facon(s) de faire 5 avec deux des.
==
pltest1==
>>> Lances_Des(12)
Il y a 25 facon(s) de faire 12 avec trois des.
==
pltest2==
>>> conv(50,1)
122.0
==
pltest3==
>>> conv(50,1)
122.0
==
pltest4==
>>> conv(-58,2)
-50.0
==




