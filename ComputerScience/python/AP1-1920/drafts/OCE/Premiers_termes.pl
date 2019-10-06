# author=OCE
# Heritage d'un type d'exercice 
extends=/ComputerScience/python/template/loopsoluce.pl
@ /builder/before.py [builder.py]

before==#|python|
import random
val1=random.randint(5,25)
val2=random.randint(1,10)
val3=random.randint(2,3)
==

title = {{val1}} premiers termes de la table de 

text==  
Écrire un programme qui affiche les {{val1}} premiers termes de la table de multiplication par {{val2}},
 en signalant au passage (à l'aide d'une astérisque) ceux qui sont des multiples de {{val3}}.
==

code==#|python| 
# écrivez votre code ici
==

taboo=while
needed=for

soluce==#|python|
chaine=""
for i in range(20):
    multiple=(i+1)*7
    if multiple%3 == 0:
        chaine+="  "+str(i+1)+"*7 = "+"*"+str((i+1)*7)+"\n"
    else: 
        chaine+="  "+str(i+1)+"*7 = "+str((i+1)*7)+"\n"
        print(chaine)
==

plsoluce==
test1 | 5
test2 | 3
==




