
#author=Zip


# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = nombre factoriel

code==
nb = int(input("Un nombre : "))


==

text==  
On cherche à déterminer si un nombre est égal à la factorielle
d'un autre nombre entier.
Pocur cela,écrire un programme qui :

* lit un entier

* affiche "??=??!" s'il est égal à la factorielle d'un nombre

* affiche "n'est pas factoriel" sinon.



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
if n==1:
    print("1=0!")
f=1
i=1
while f <n:
    f*=i
    i+=1
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



