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

title = {{val1}} premiers termes de la table de {{val2}}

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
for i in range({{val1}}):
    multiple=(i+1)*{{val2}}
    if multiple%{{val3}} == 0:
        chaine+="  "+str(i+1)+"*"+str(val2)+" = "+"*"+str((i+1)*val2)+"\n"
    else: 
        chaine+="  "+str(i+1)+"*"+str(val2) = "+str((i+1)*str(val2))+"\n"
        print(chaine)
==

mplsoluce0==
5 termes de la table de 2 et multiples de 3
5
2
3
==
mplsoluce1==
10 termes de la table de 4 et multiples de 2
10
4
2
==
mplsoluce2==
8 termes de la table de 7 et multiples de 3
8
7
3
==




