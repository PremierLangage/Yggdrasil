
#author=Zip


# Heritaged'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Triplet de Pythagore
code==
n = int(input("Entrez l'entier maximum : "))




print("il y a", ??, "triplet(s) inférieur(s) à", n)
==

taboo=while
needed=for

text==  
Un triplet de Pythagore est un triplet d'entiers naturels **non nuls** *(a,b,c)*
avec $% a \lt b \lt c%$ et $%a^2+b^2=c^2%$. 

On dira que le triplet est inférieur à un nombre $%n%$   
si $%c \lt n %$.

 Ecrire un programme qui:
 
 * lit un entier
 * affiche le nombre de triplets de Pythagore inférieurs à cet entier.<br>

Exemple  :

Entrez l'entier maximum : 30

il y a 10 triplet(s) inférieur(s) à 30<br>
<br>
*D'après le "projet Euler"*
==

before==
import random
N=random.randint(4,150)
mplsoluce3="Test aléatoire \n"
mplsoluce3+=str(N)+"\n"
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
==



mplsoluce0==
un 
7
==
mplsoluce1==
Aucun terme
1
==
mplsoluce2==
Grand
100
==




