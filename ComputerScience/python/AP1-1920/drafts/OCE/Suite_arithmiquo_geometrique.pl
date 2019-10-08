# author=OCE
# Heritage d'un type d'exercice 
extends=/ComputerScience/python/template/loopsoluce.pl
@ /builder/before.py [builder.py]

before==#|python|
import random
val1=random.randint(8,12)
val2=random.randint(2,5)
==

title = Suite arithmético géométrique

text==  
Ecrire un programme permettant d'afficher le Nème entier de la suite arithmético géométrique croissante suivante : 

Un+1 = aUn + b
avec Uo > 0
a>1
b>0

pour a et b vous prendrez les valeurs : X et Y
==

code== 
# écrivez votre code ici
==

taboo=while
needed=for

soluce==
a=input("Entrez un nombre : ")
for i in range({{val2}}):
    print(i+1,a)
    a = a * {{val1}}
==

plsoluce==
test1 | 5
test2 | 3
==



