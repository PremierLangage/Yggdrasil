
# author zip

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title =diviseurs


text==  

Ecrire un programme qui lit un  entier (s'il est négatif le remplace par son opposé) puis affiche ses diviseurs et leu nombre.
==


soluce==
n=int(input())
nb=1
if n<0:
    n=-n
for i in range(n**0.5):
    if n%(i+1)==0:
        print(i+1)
        nb+=1
print(n)
print(nb)
==
plsoluce==
essai1|2 
essai2|4
==

