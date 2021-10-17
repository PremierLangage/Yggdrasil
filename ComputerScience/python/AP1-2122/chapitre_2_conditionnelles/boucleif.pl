
# author zip

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl

title = nombres divisibles

before == 
from random import randint, choice
nb_entiers = randint(9,25)
diviseur = choice([3,5,7,11])
==

text==  

Ecrire un programme qui lit {nb_entiers} entiers et affiche combien parmi eux sont divisibles par {diviseur}

(Remarque: on utilise l=int(input()) pour lire un chiffre dans ce programme)
==
code==


print("Il y a",nb,"multiples de {diviseur}")
==
soluce==
nb=0
for i in range(12):
    l=int(input())
    if l%7==0:
       nb+=1
print("Il y a",nb,"multiples de 7")
==
mplsoluce0==
essai 1
2 
3
5
14
77
0
81 
7749
15 
98
11
35
==
mplsoluce1==
essai 2
0
0
0
0
0
0
0
0
0
0
0
0
==
mplsoluce2==
essai 3
10
101
20
30
40
50
60
71
11
10
20
30
==




