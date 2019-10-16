

# author zip
# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title =Suire de Syracuse
text==  
La suite de Syracuse est une suite d'entiers définie par :

* $%u_0 \gt 0%$

* $%u_{n+1}=u_n/2%$ si n est pair<br>
* $%u_{n+1}=3u_n+1%$ si n est impair<br>
Pour tout entier strictement positif $%u_0%$ testé, la suite converge vers 1. Le premier n 
tel que $%u_n=1%$ est appelé temps de vol de la suite.
Le but de l'exercice est dedéterminer de temps de vol pour plusieurs valeurs de
$%u_0%$.<br>
Pour cela:
* écrire une fontion *Saisie_strict_positif* qui renvoie un entier strictement positif
entré par l'utilisateur.

Ecrire une fontion *syracuse_temps(u)* qui reçoit un entier strictement positifs 
et renvoie le temps de vol de lasuite pour $%u_0=u%$<br>

Utilisez ces fonctions pour écrire un programme qui lit 5 entiers strictement positifs
 et affiche le temps de vol pour chacun de ces entiers n 
Exemples
 
Entrez un entier strictement positif : 5 <br>
Le temps de vol pour 5 est <br>
Entrez un entier strictement positif : 3<br>
Le temps de vol pour 3 est <br>
Entrez un entier strictement positif : -1<br>
Entrez un entier strictement positif : 11<br>
Le temps de vol pour 11 est <br>
Entrez un entier strictement positif : 155 <br>
Le temps de vol pour 155 est <br>
Entrez un entier strictement positif : 1 <br>
Le temps de vol pour 1 est 0<br>

==
before==
import random
n=random.randint(4,7)
mplsoluce3="Test aléatoire\n"
mplsoluce3 += str(n)
==

soluce==
def factoriel(n):
    if n<0:
        return None
    f=1
    for i in range(n):
        f*=i+1 
    return f 
def combinaison(n,p):
    if n<0 or p>n:
        return 0
    return factoriel(n)/(factoriel(n-p)*factoriel(p))

n=int(input("n"))
if n<0:
    print("non défini")
else:
    s=""
    for p in range(n+1):
        s+=str(int(combinaison(n,p)))+" "
    print(s)

==
mplsoluce0==
classique
3
==
mplsoluce1==
negatif
-9
==

mplsoluce2==
nul
0
==
mplsoluce4==
un
1
==




