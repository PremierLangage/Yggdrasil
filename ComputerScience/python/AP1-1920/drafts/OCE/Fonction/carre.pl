
#author=OCE

# DR

si la fonction imprime le carré ton test foncitonne 
Hors c'est très différent si la fonction retourne ou affiche 
il faut que ton test vérifie cette nuance


# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Calculer le carré d'un nombre

code==
#
#
#
n = ??(input("Saisisez un entier :"))
#

==

text==  

Programmer une fonction "carre" qui prend en paramètre un entier et retourne son carré.<br>

Ecrivez ensuite un code qui demande à l'utilisateur un entier, appel la fonction et imprime le résultat.

==

soluce==#|python|
def carre(n):
    return(n*n)

n = int(input("Saisisez un entier :"))
print(carre(n))
==

mplsoluce0==
paire
2
==
mplsoluce1==
impaire 
3
==

mplsoluce2==
Grand 
10
==

mplsoluce3==
nul
0
==





