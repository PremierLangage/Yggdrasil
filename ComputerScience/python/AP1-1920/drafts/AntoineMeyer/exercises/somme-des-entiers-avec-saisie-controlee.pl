# author = Antoine Meyer
extends = ../templates/generic/generic.pl

title = Somme des entiers (avec saisie contrôlée)

text==
Écrire un programme Python qui demande à l'utilisateur un entier positif `n`,
puis calcule et affiche la somme des `n` premiers entiers. 

En cas de saisie d'un entier négatif, le programme doit demander une nouvelle saisie. 
En cas de saisie d'une chaîne impossible à convertir, le programme doit provoquer une erreur.

Voici un exemple d'exécution possible :

    Saisir un entier positif : -4
    Mauvaise saisie
    Saisir un entier positif : -10
    Mauvaise saisie
    Saisir un entier positif : 10
    La somme des entiers de 1 à 10 vaut 55

Il est important de respecter *précisément* cet affichage pour que la solution 
soit considérée comme correcte.
==

grader==#|python|

solution = """
n = int(input("Saisir un entier positif : "))
while n < 0:
    print("Mauvaise saisie")
    n = int(input("Donnez moi un nombre : "))
somme = 0
for i in range(n + 1):
    somme += i
print("La somme des entiers de 1 à " + str(n) + " vaut " + str(somme))
"""

saisie1 = ["-4", "-10", "10"]
affichage1 = """Saisir un entier positif : -4
Mauvaise saisie
Saisir un entier positif : -10
Mauvaise saisie
Saisir un entier positif : 10
La somme des entiers de 1 à 10 vaut 55
"""

set_inputs(inputs=saisie1, verbose=True)
run(output=affichage1)

==



