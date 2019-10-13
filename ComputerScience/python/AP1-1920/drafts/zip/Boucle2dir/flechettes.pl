
#author=Zip


# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Jeu de flechette

code==
n = int(input("Un nombre : "))


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

* lit un entier compris entre 0 et 500

* affiche le nombre de façon d'obtenir ce nombre de pointsavec 10 fléchettes 



Exemples d'affichage :

40320=8!

22 n'est pas factoriel

==

before==
import random
N=random.randint(4,15)
mplsoluce4="Test aléatoire\n"
f=1
for i in range(1,N+1):
    f*=i
test=random.randint(0,1)
f+=test
mplsoluce4 += str(f)+"\n"
==
soluce==
n = int(input("Un nombre : "))

f=1
i=0
while f <n:
    i+=1
    f*=i
if n==f:
    print(str(n)+"="+str(i)+"!")
else:
    print(n,"n'est pas factoriel")
==




mplsoluce0==
Négatif 
-5
==
mplsoluce1==
Facile 
24
==
mplsoluce2==
Grand 
479001600
==
mplsoluce3==
tres grand
35184372088833
==
mplsoluce5==
nul
1
==






