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
a = input()
while a:
    l.append(a)
    a = input()

print(somme(l))
==

mplsoluce0==
monpremiertest
2
4
6
8
==

before =