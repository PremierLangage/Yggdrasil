
#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl
@ /builder/bbefore.py [builder.py]

title = 

before==
import random
nombres=[0,"un","deux","trois","quatre","cinq","six","sept","huit","neuf","dix"]
nb1= random.randint(1,10)
tx1 = nombres[nb1]
nb2=nb1
while nb1==nb2:
    nb2 = random.randint(1,10)
    tx2= nombres[nb2]

title = f"Divisible par {tx1} mais pas apr {tx2}"
==

code==
# On utilisera pour les entrées 
input("Saisie : ")

==

needed=def

text==  

Programmer une fonction qui teste si un entier est divisible par 10 mais pas par 3. <br>

Puis écrivez un programme qui récupère un entier au clavier, 
appelle la fonction et affiche le résultat booléen.


On utilisera pour les entrées 
**input("Saisie : ")**

==

soluce==#|python|
def dix_mais_pas_trois(n):
    return n%10==0 and n%3!=0

n = int(input("Saisie : "))
print(dix_mais_pas_trois(n))
==

plsoluce==
Test1 | 2
Test2 | 3
Test3 | 30
Test4 | 40
==






