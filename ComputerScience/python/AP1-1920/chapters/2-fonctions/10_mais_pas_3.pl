
#author=OCE

# Heritage d'un type d'exercice 
extends=/ComputerScience/python/AP1-1920/templates/plsoluce.pl
@ /builder/none.py [builder.py]

title = Dix mais pas trois

code==
# On utilisera pour les entrées 
input("Saisie : ")

==

needed=def

text==  

1) Programmer une fonction qui teste si un entier est divisible par 10 mais pas par 3. <br>

2) Ecrivez un programme qui récupère un entier au clavier, 
puis appelle la fonction précédente et affiche le résultat booléen.
<br>

Pour les entrées de l'utilisateur, on utilisera le code suivant : <br>
**input("Saisie : ")**
<br>
<br>
Plus précisemment, un exemple d'utilisation du programme produit la sortie suivante :
<br>
<br>
Saisie : 17
True
<br>
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







