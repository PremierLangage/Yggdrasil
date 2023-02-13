
#author=Zip

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

tag=boucle|float|somme|math

title = Approximation de $%\frac{\pi^2}{6}%$

code==
from math import *

n = int(input("Entrez un nombre : "))

print("avec suite (1)", ??, "avec suite (2)", ??, "valeur de pi²/6", ??)

==

before==
==

text==  
On veut comparer les valeurs (informatiques) de deux séries (identiques) qui convergent (mathématiquement) vers $%\frac{\pi^2}{6}%$


$%(1): \sum\limits_{i=1}^{+\infty}\frac{1}{i^2}%$


$%\(2):\sum\limits_{+\infty}^1 \frac{1}{i^2}%$
 

Ecrire un programme qui lit un entier positif n,
 puis affiche:

 * les sommes partielles (i=1 à n et i=n à 1, bornes comprises) pour chaque série.
 * la valeur de $%\frac{\pi^2}{6}%$ (`from math import *` est obligatoire pour utiliser `pi`)

Si l'entier n est négatif, on affiche "erreur"

**Testez dans python, en dehors de Premier Langage (pour n=10,100,10000) et réfléchissez à une explication**
==

soluce==
import math
croiss,decroi=0,0
n=int(input("Entrez un nombre : ")) 
if n<0:
    print("erreur")
else:
    for i in range(1,n+1):
        croiss+=1/(i*i)
    for i in range(n,0,-1):
        decroi+=1/(i*i)
    print("avec suite (1)",croiss,"avec suite (2)",decroi, "valeur de pi²/6", math.pi*math.pi/6)
==

plsoluce==
erreur | -4
un | 1
petit | 14
grand | 10001
==





