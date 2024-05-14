extends = /ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Bob

text ==
Lire une liste d'entiers et afficher le résultat de la fonction somme()
Ecrire une fonction somme() qui prend une liste et qui retourne la somme des éléments de la liste.
==

soluce ==
def somme(l):
    return sum(l)

l = []
n = int(input())
for i in range(n):
    a = int(input())
    l.append(a)

print(somme(l))
==

mplsoluce0==
monpremiertest
3
4
6
8
==

before =