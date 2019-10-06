
#author=Zip


# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = nombre factoriel


text==  

Ecrire un programme qui lit un entier et

s'il est égal à la factorielle d'un nombre 

affiche "??=??!" 

sinon 

affiche "n'est pas factoriel"

Exemple

40320=8!

22 n'est pas factoriel

==

before==
import random
N=random.randint(4,10)
mplsoluce4="Test aléatoire\n"
f=1
for i in range(N+1):
    f*=i
mplsoluce4 += str(f)+"\n"
==
soluce==
n=int(input())
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
24
==

