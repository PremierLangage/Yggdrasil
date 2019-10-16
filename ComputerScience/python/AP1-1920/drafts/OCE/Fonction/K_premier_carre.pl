
#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Afficher les k premiers carrés de 0 à (k-1)^2

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
0
==





