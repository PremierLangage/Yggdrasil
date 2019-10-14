#author=OCE

# Diviseur
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Diviseurs

code==
entier = int(input())
chaine=""
somme=0


==

text==  
Ecrire un programme qui : <br>
* affiche tous les diviseurs d'un entier n saisi par l'utilisateur <br>
* rechercher tous les nombres parfaits inférieurs à n <br>
* On rappelle qu'un nombre est parfait si la somme de ses diviseurs est égale au double du nombre. <br>
  Par exemple, 6 a pour diviseurs 1, 2, 3 et 6. Leur somme fait 12 = 6 * 2 <br>

Vous compléterez le code en partie fourni pour créer votre programme.
Indice : la longeur d'une chaine de caractère se code comme cela : len(chaine)

Exemple de résultat attendu du programme pour la valeur 6 : 

6
Les diviseurs de 6 : 1, 2, 3, 6
Il s'agit d'un nombre parfait
En effet, le total des diviseurs : 12 = 6 * 2

Remarque : il n'y a pas de " ," à la fin de la présentation des diviseurs.
==

soluce==
entier = int(input())
chaine=""
somme=0

for i in range(entier):
    if entier % (i+1) == 0 :
        if len(chaine) > 0:
            chaine +=(", ")
        chaine += (str(i+1))
        somme+=(i+1)

print("Les diviseurs de " + str(entier) + " : " + chaine)

if somme == entier * 2:
    print("Il s'agit d'un nombre parfait")
    print("En effet, le total des diviseurs : " + str(somme) + " = " + str(entier) + " * 2")
else:
    print("Il ne s'agit pas d'un nombre entier puisque la somme des diviseurs n'est pas le double du nombre")
==

mplsoluce0==
Simple
6
==
mplsoluce1==
long 
24
==
mplsoluce2==
Grand 
30
46
==
mplsoluce5==
nul
0
0
==











