

author=DR

extends=/ComputerScience/python/AP1-1920/templates/prosoluce.pl

title = Suite géométrique

text==
On suppose qu'il existe deux variables `a` et `b` désignant des nombres flottants quelconque, et une variable `nb` désignant un entier positif quelconque. 
Écrire un programme dont l'exécution affiche sur la sortie standard les `nb` premiers termes de la suite géométrique de premier terme `a` et de raison `b`
(chacun suivi d'un retour à la ligne), à l'exclusion de tout autre caractère.

On rappelle la définition de la suite :

$%
\begin{cases}
u_0 & = a\\\
u_{n+1} & = b \times u_n
\end{cases}
%$

Par exemple, si `a` vaut 3, `b` vaut 2 et `nb` vaut 5, votre programme doit afficher :

    3
    6
    12
    24
    48

**Attention**, *le programe doit fonctionner quelles que soient les valeurs 
de `a`, `b` et `nb`.*<br>
==

before==
import random
a,b,nb=random.randint(1,10),random.randint(1,10),random.randint(1,10)
mplsoluce2= f"Aléatoire \n{a}\n{b}\n{nb}\n"
a,b,nb=random.randint(1,10),random.randint(1,10),random.randint(1,10)
mplsoluce3= f"Aléatoire \n{a}\n{b}\n{nb}\n"
==

front==

a=  int(input())
b= int(input())
nb= int(input())

==

back==

print(a,b,nb)

==


soluce==
for i in range(nb):
    print(a)
    a=a*b
==


mplsoluce0==
Enonce
1
2
5
==

mplsoluce1==
Une autre 
2
3
12
==



