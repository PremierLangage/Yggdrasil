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
Écrire un programme qui affiche les 20 premiers termes de la table de multiplication par 7,
 en signalant aupassage (à l'aide d'une astérisque) ceux qui sont des multiples de 3.
==

code== 
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




