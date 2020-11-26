extends = /ComputerScience/python/AP1-1920/templates/plsoluce.pl


title = Python - Factoriel
text = Ecrire une fonction qui prend en paramètreun entier et renvoie son factoriel.

mplsoluce0==
def factorielle(n):
    if n == 0:
        return 1
    else:
        F = 1
        for k in range(2,n+1):
            F = F * k
        return F
==

