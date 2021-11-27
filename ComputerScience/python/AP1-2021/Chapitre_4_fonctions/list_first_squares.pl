
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

Programmer ensuite une fonction **premiers_carres** qui :

* prend en paramètre un entier k 

* imprime les k premiers carrés de 0 à (k-1)^2 

* retourne la somme des carrés affichés 

Pour finir écrivez un programme :

* qui demande à l'utilisateur un entier, 
* appelle la fonction `premiers_carres` et imprime le résultat attendu.

==

soluce==#|python|
def carre(n):
    return(n*n)

def premiers_carres(k) :
    sum=0
    for i in range(k) :
        print (carre(i))
        sum+=carre(i)
    return sum
n = int(input("Saisissez un entier :"))
print(premiers_carres(n))
==
before==
def carre(n):
    return(n*n)

def premiers_carres(k) :
    for i in range(k) :
        print(carre(i))

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










