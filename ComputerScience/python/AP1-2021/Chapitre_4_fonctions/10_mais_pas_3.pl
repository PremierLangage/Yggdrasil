
extends=/ComputerScience/python/AP1-2122/template/pltest2023.pl

@ /builder/bbefore.py [builder.py]

title = 

before==
import random
nombres=[0,"un","deux","trois","quatre","cinq","six","sept","huit","neuf","dix"]
nb1= random.randint(2,10)
tx1 = nombres[nb1]
nb2=nb1
while nb1==nb2:
    nb2 = random.randint(2,10)
    tx2= nombres[nb2]
if nb1 % nb2 == 0 :
    nb1,nb2= nb2,nb1
    tx1, tx2 = tx2 , tx1

title = f"Divisible par {tx1} mais pas par {tx2}."

text=f"""  

Programmer une fonction **oui_mais(n)** qui teste si un entier n est divisible par {tx1} mais pas par {tx2}. <br>
"""



==



==

code==
# utiliser la ligne suivante pour l'
int(input())

==

needed=def



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






