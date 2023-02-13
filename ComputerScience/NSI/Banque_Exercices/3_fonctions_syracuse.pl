

# author zip
# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl
@ /builder/before.py [builder.py]
title =Suite de Syracuse
text==  
La suite de Syracuse est une suite d'entiers définie par :

* $%u_0 \gt 0%$
* $%u_{n+1}=u_n/2%$ si $% u_n %$ est pair<br>
* $%u_{n+1}=3u_n+1%$ si $% u_n %$ est impair<br>

Pour tout entier strictement positif $%u_0%$ testé, la suite converge vers 1. 
Le premier n tel que $%u_n=1%$ est appelé temps de vol de la suite.

Le but de l'exercice est de déterminer le temps de vol pour plusieurs valeurs de $%u_0%$.
<br>
<br>
Pour cela:<br>
* écrire une fontion `saisie_strict_positif()` qui renvoie un entier strictement positif<br>
  entré par l'utilisateur.<br>
* écrire une fontion `syracuse_temps(u)` qui reçoit un entier strictement positifs<br> 
  et renvoie le temps de vol de la suite pour $%u_0=u%$<br>
* utilisez ces fonctions pour écrire un programme qui lit 5 entiers strictement positifs<br>
  et affiche le temps de vol pour chacun de ces entiers.<br> 
<br>
Exemples :<br>
 
Entrez un entier strictement positif : 5 <br>
Le temps de vol pour 7 est 16<br>
Entrez un entier strictement positif : 3<br>
Le temps de vol pour 3 est 7<br>
Entrez un entier strictement positif : -1<br>
Entrez un entier strictement positif : 11<br>
Le temps de vol pour 14 est 17<br>
Entrez un entier strictement positif : 155 <br>
Le temps de vol pour 1256 est 39<br>
Entrez un entier strictement positif : 1 <br>
Le temps de vol pour 1 est 0<br>
==
code==
??=int(input("Entrez un entier strictement positif : "))



print("Le temps de vol pour",?? ,"est",??)
==
before==
import random

mplsoluce2="Test aléatoire\n"
for i in range(5):
    n=random.randint(4,17)
    mplsoluce2 += str(n)+"\n"
after=before    
==

soluce==
def saisie_strict_positif():
    n=int(input("Entrez un entier strictement positif : "))
    while n<=0: 
        n=int(input("Entrez un entier strictement positif : "))
    return n
def syracuse_temps(u):
    n=0
    while u!=1:
        if u%2==0:
            u=u//2
        else:
            u=3*u+1
        n+=1
    return n
for i in range(5):
    u0= saisie_strict_positif()
    print("Le temps de vol pour",u0 ,"est",syracuse_temps(u0))

==
mplsoluce0==
classique
3
8
7
19
155
==
mplsoluce1==
negatif
-9
2
1
5
16
0
11

==










