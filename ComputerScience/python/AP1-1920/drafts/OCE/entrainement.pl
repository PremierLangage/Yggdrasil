# author=OCE
# Heritage d'un type d'exercice 
extends=/ComputerScience/python/template/loopsoluce.pl

before==#|python|
import random
X=random.randint(8,12)
R=random.randint(2,5)
==

title = Suite géométrique de raison **{{X}}**

text==  
En utilisant une boucle de type "for...in...range", écrire un programme qui affiche une suite de" + X + "nombres dont chaque terme soit 
égal à Y fois le terme précédent."
==

code== 
# écrivez votre code ici
==

taboo=while
needed=for

soluce==
a=input("Entrez un nombre : ")
for i in range(X):
    print(i+1,a)
    a = a * R
==

plsoluce==
test1 | 5
test2 | 3
==


