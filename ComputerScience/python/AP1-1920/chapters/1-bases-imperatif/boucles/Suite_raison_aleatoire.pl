# author=OCE
# Heritage d'un type d'exercice 
extends=/ComputerScience/python/template/loopsoluce.pl
@ /builder/before.py [builder.py]

before==#|python|
import random
val1=random.randint(8,12)
val2=random.randint(2,5)
==

title = Suite géométrique de raison {{val2}}

text==  
En utilisant une boucle de type "for...in...range", écrire un programme qui affiche une suite de {{val1}} nombres dont chaque terme soit 
égal à {{val2}} fois le terme précédent.
==

code== 
# écrivez votre code ici
a=input("Entrez un nombre : ")
==

taboo=while
needed=for

soluce==
a=int(input("Entrez un nombre : "))
for i in range({{val2}}):
    print(i+1,a)
    a = a * {{val1}}
==

plsoluce==
test1 | 5
test2 | 3
==



