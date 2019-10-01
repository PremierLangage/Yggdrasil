


# author zip

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Liste des multiples


text==  

Ecrire un programme qui lit un  entier  et affiche la chaine de caractères formeé des n premiers multiples de 17
(si n vaut 4 on affiche 0173451).
.
==


soluce==
n=int(input())
s=""
for i in range(n):
    s+=str(i*17)
print(s)
==
plsoluce==
court|2 
tres court |0
long | 11
==


