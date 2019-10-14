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

Vous compléterez le code suivant pour créer votre programme.
Indice : la longeur d'une chaine de caractère se code comme cela : len(chaine)
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

print(chaine)

if somme == entier * 2:
    print("il s'agit d'un nombre parfait")
    print("En voici la preuve : ")
    print("Total des diviseurs : " + str(somme) + " = " + str(entier) + " * 2")
else:
    print("Il ne s'agit pas d'un nombre entier puisque la somme des diviseurs n'est pas le double du nombre")
==

mplsoluce0==
Négatif 
-1
-2
==
mplsoluce1==
Facile 
1
2
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











