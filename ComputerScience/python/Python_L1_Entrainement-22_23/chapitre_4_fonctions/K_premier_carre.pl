
#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Afficher les k premiers carrés $% (%$de $%0%$ à $%(k-1)^2 \big )%$

code==

==

text==  

1.  Programmer une fonction **carre** qui prend en paramètre un entier et retourne son carré.<br>
<br>

2.  Programmer ensuite une fonction **premiers_carres** qui : <br>
    * prend en paramètre un entier $%k%$ ; <br>
    * imprime les k premiers carrés de $%0%$ à $%(k - 1)^2%$. <br>
<br>

3.  Pour finir écrivez un programme qui demande à l'utilisateur
un entier, appelle la fonction `premiers_carres` et imprime le résultat attendu.<br>
<br>

Un exemple d'exécution du programme est :<br>
`Saisissez un entier : 4`<br>
`0`<br>
`1`<br>
`4`<br>
`9`<br>
==

soluce==#|python|
def carre(n):
    return(n*n)

def premiers_carres(k) :
    for i in range(k) :
        print (carre(i))


n = int(input("Saisissez un entier : "))
premiers_carres(n)
==
before=
mplsoluce0==
paire
2
==
mplsoluce4==
impaire 
7
==

mplsoluce7==
Grand 
10
==

mplsoluce1==
nul
0
==












