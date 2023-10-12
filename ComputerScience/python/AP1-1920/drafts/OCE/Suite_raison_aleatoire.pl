# author=OCE corrigé par DR 2023
# Heritage d'un type d'exercice 
extends=/ComputerScience/python/template/loopsoluce.pl
@ /builder/before.py [builder.py]

before==#|python|
import random
val1=random.randint(8,12)
val2=random.randint(2,5)

title = f"Suite géométrique de raison {val2}"

soluce=f"""
a=int(input("Entrez un nombre : "))
for i in range({val1}):
    print(a)
    a = a * {val2}
"""



==

title=Suite géométrique de raison Entière


text==  
En utilisant une boucle de type "for ... in range(...):",  
écrire un programme qui demande à l'utilisateur l'entier $%U_0%$ et à partir de cet entier,  
affiche les {{val1}} premiers termes de la suite géométrique de raison {{val2}}.  

Rappel: $%U_{n+1} = U_n*R%$ où $%R%$ est la raison.

==



code== #|python|
# écrivez votre code ici
U0 =int(input("Entrez un nombre : "))



==

taboo=while
needed=for




plsoluce==
Suite constante | 0
Départ à 1 | 1
Départ Géant | 972548156
==



