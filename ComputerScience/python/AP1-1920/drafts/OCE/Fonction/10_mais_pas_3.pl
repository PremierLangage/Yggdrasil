
#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Dix mais pas trois

code==
#
#
#
n = ??(input("Saisisez un entier :"))
#

==

text==  

Programmer une fonction qui teste si un entier est divisible par 10 mais pas par 3. <br>

vous écrirez naturellement un programme qui récupère un entier au clavier, appel la fonction et affiche le résultat.

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





