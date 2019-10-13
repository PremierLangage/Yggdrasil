
#author=Zip


# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Jeu de flechette

code==
n = int(input("Un nombre : "))


print("Il y a",nb,"façons d'obtenir",n)

==

taboo=import

text==  
Une cible de flechettes contient 3 zones:

. 1 points<br>
. 2 points<br>
. 5 points<br>
toute fléchette en dehors compte 0 points<br>
On cherche à déterminer le nombre de façons 
Ecrire un programme qui :

* force la lecture d'un entier compris entre 0 et 50

* affiche le nombre de façon d'obtenir ce nombre de pointsavec 10 fléchettes 


==

before==
import random
N=random.randint(0,50)
mplsoluce3="Test aléatoire\n"

mplsoluce3 += str(N)+"\n"
==
soluce==
n = int(input("Un nombre : "))
while n<0 or n>50:
    n = int(input("Un nombre : "))
nb=0
somme=0
for f1 in range(11):
    somme=f1
    for f2 in range(11-f1):
        somme+=f2*2
        for f3 in range(11-(f1+f2)):
            somme+=f3*5
            if somme==n:
                nb+=1
            somme-=f3*5    
        somme-=f2*2

print("Il y a",nb,"façons d'obtenir",n)
==




mplsoluce0==
Valeur hors limite 
-5
65
1
==
mplsoluce1==
Min
0
==
mplsoluce2==
Max
50
==

mplsoluce4==
Impossible
48
==



