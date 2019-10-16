
#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Afficher les k premiers carrés de 0 à (k-1)^2

code==
#
#
#
#
#
#
#
n = ??(input("Saisisez un entier :"))
#

==

text==  

Programmer une fonction "carre" qui prend en paramètre un entier et retourne son carré.<br>

Programmer ensuite une fonction "premiers_carres" qui : <br>
* prend en paramètre un entier k <br>
* imprime les k premiers entiers de 0 à (k-1)^2 <br>

Pour finir écrivez un code : 
* qui demande à l'utilisateur un entier, 
* appel la fonction "premiers_carres" qui imprimera le résultat attendu.

==

soluce==#|python|
def carre(n):
    return(n*n)

def premiers_carres ( k ) :
    for i inrange ( k ) :
        print carre ( i )

n = int(input("Saisisez un entier :"))
premiers_carres (n)
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





