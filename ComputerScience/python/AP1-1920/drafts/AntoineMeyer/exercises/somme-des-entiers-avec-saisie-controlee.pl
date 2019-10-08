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

saisie1 = ["-4", "-10", "10"]
affichage1 = """
Saisir un entier positif : -4
Mauvaise saisie
Saisir un entier positif : -10
Mauvaise saisie
Saisir un entier positif : 10
La somme des entiers de 1 à 10 vaut 55
"""

run(
    inputs=saisie1,
    output=affichage1
)

==



