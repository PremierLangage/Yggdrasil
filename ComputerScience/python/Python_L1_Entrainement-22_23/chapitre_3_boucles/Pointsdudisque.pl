
#author=Zip

tag=boucle|bouclesImbriquées|While|Conditionnelles

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = Points du disque

text==  

Ecrire un programme qui force la saisie d'un réel strictement positif `d`
puis affiche le nombre de points à coordonnées entières situés à l'intérieur strictement du disque de rayon `d` et dont le centre est l'origine du repère **(0, 0)**.

<br>
Exemples :

* <pre>
Entrez un réel strictement positif: 1
Il y a 1 point(s) à coordonnées entières
</pre>
* <pre>
Entrez un réel strictement positif: -2
Entrez un réel strictement positif: 24.32
Il y a 1861 point(s) à coordonnées entières
</pre>

*Indice : La distance d'un point de coordonnées **(x, y)** à l'origine du repère **(0, 0)** est la racine de **x² + y²**.*
==

code==
d = float(input("Entrez un réel strictement positif: "))

==

before==
import random
d=random.randint(92,10000)
d=d/100
mplsoluce3="Test aléatoire\n"
mplsoluce3 += str(d)+"\n"

==

soluce==


d=float(input("Entrez un réel strictement positif: "))
while d<=0:
    d=float(input("Entrez un réel strictement positif: "))
x=0
nb=0
while x<=d:
    y=0
    while y<=d:
        if x*x+y*y<d*d:
            if x==0 and y==0:
                nb+=1
            elif x==0 or y==0:
                nb+=2
            else  :
                nb+=4
        y+=1
    x+=1
print("Il y a",nb,"point(s) à coordonnées entières")
==


mplsoluce0==
Entr&eacute;e ok
5.5
==
mplsoluce1==
Entr&eacute;e n&eacute;gative
-1.5
1
==
mplsoluce2==
Entr&eacute;e grande
24.32
==









