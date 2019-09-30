
# author zip

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Diviseurs d'un entier 


text==  
Ecrire un programme qui lit un  entier (s'il est négatif le remplace par son opposé)
Affiche "diviseurs:" suivi 
d'un diviseur par ligne 
puis de
"nombre de diviseurs ??".
==
code==

print("diviseurs:")

print("nombre de diviseurs",??)
==

soluce==
n=int(input())
nb=0
if n<0:
    n=-n
print("diviseurs:")
for i in range(2,n):
    if n%i==0:
        print(i)
        nb+=1
print("nombre de diviseurs",nb)
==
plsoluce==
Simple |2 
Puissance de 2 |-1024
Produit | 120
Un plus gros | 5870865
==


