
#author=Zip


# Heritaged'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Approximation de $%\frac{\pi^2}{6}%$

code==
 n= int(input("Entrez un nombre : "))



print("avec(1)",??,"avec(2),??)

==

text==  
On veut comparer les valeurs  (informatique) de deux séries (identiques) qui convergent (mathématiquement) vers $%\frac{\pi^2}{6}%$


$%(1): \sum\limits_{i=1}^{+\infty}\frac{1}{i}%$


$%\(2):\sum\limits_{+\infty}^1 \frac{1}{i}%$
 

Ecrire un programme qui lit un entier positif n et calcule et affiche les sommes 
partielle (i=1 à n et i=n à 1, borne comprises) pour chaque série.

Si l'entier n est négatif, on affiche "erreur"
==
soluce==
#import math
croiss,decroi=0,0
n=int(input()) 
if n<0:
    print("erreur")
    else:
    for i in range(1,n+1):
        croiss+=1/(i*i)
    for i in range(n,0,-1):
        decroi+=1/(i*i)
    print("avec(1)",croiss,"avec(2)",decroi)
#print(math.pi*math.pi/6)
==
plsoluce==
erreur | -4
un | 1
petit | 10
grand | 10000
==
