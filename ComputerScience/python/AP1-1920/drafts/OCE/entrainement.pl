# author=OCE
# Heritage d'un type d'exercice 
extends=/ComputerScience/python/template/loopsoluce.pl
@ /builder/before.py [builder.py]

before==#|python|
import random
val1=random.randint(8,12)
val2=random.randint(2,5)
==

title = Suite géométrique de raison {{val1}}

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


