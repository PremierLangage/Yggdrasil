extends = /ComputerScience/python/AP1-1920/templates/prosoluce.pl

before=

title = Python - Factoriel
text = Ecrire une fonction qui prend en paramètreun entier et renvoie son factoriel.

soluce==
def factorielle(n):
    if n == 0:
        return 1
    else:
        F = 1
        for k in range(2,n+1):
            F = F * k
        return F
==

plsoluce==
Simple | 4
Plus lourd | 56
Zéro | 0
==

