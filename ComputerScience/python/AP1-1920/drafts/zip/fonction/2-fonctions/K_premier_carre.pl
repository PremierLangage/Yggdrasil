
#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Afficher les k premiers carrés (de 0 à (k-1)^2)

code==
#
#
#
#
#
#
#
?? = ??(input("Saisisez un entier :"))
#
==

text==  

Programmer une fonction **carre** qui prend en paramètre un entier et retourne son carré.<br>

Programmer ensuite une fonction **premiers_carres** qui : <br>
* prend en paramètre un entier k <br>
* imprime les k premiers carrés de 0 à (k-1)^2 <br>

Pour finir écrivez un e : <br>
* qui demande à l'utilisateur un entier, <br>
* appelle la fonction `premiers_carres` et imprime le résultat attendu.

==

soluce==#|python|
def carre(n):
    return(n*n)

def premiers_carres(k) :
    for i in range(k) :
        print (carre(i))

n = int(input("Saisissez un entier :"))
premiers_carres(n)
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









