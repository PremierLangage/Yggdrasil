#author=Zip


# Heritaged'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Triplet de Pythagore
code==
?? = int(input("Entrez l'entier maximum : "))




print("il y a",??,"triplet(s) inférieur(s) à",??)

==

text==  

 Ecrire un programme qui:
 
 lit un entier

 affiche le nombre de triplets de Pythagore inférieurs à cet entier 

Exemple  :

Entrez l'entier maximum : 30

il y a 10 triplet(s) inférieur(s) à 30
==

soluce==
n= int(input("Entrez l'entier maximum : "))
nb=0
for a in range(1,n):
    for b in range(a,n):
        c=(a*a + b*b)**0.5
        if c==int(c) and c<n:       
            nb+=1
print("il y a",nb,"triplet(s) inférieur(s) à",n)

n
==

plsoluce==
un | 7
Aucun terme| 1
Grand | 3245
==


