#author=OCE

# Diviseur
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Diviseurs

code==
p=int(input())
q=int(input())

==

taboo=while

text==  
Ecrire un programme qui : 
affiche tous les diviseurs d'un entier n (choisi au hasard)
rechercher tous les nombres parfaits inférieurs à n (choisi au hasard)
On rappelle qu'un nombre est parfait si la somme de ses diviseurs est égale au double du nombre. 
Par exemple, 6 a pour diviseurs 1, 2, 3 et 6. Leur somme fait 12 = 6 * 2
==

soluce==
p=int(input())
q=int(input())
for i in range(p):
    ligne=""
    for j in range(q):
        ligne += "("+str(i+1)+","+str(j+1)+") "
    print(ligne)
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











