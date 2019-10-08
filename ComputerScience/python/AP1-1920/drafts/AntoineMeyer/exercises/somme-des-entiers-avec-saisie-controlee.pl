# author = Antoine Meyer
extends = ../templates/generic/generic.pl

title = Somme des entiers (avec saisie contrôlée)

text==
Écrire un programme Python qui demande à l'utilisateur un entier positif `n`,
puis calcule et affiche la somme des `n` premiers entiers.

Voici un exemple d'exécution de votre programme :

    Donnez moi un entier positif : -4
    Mauvaise saisie
    Donnez moi un entier positif : -10
    Mauvaise saisie
    Donnez moi un entier positif : 10
    La somme des entiers de 1 à 10 vaut 55

Il est important de respecter *précisément* cet affichage pour que la solution 
soit considérée comme correcte.
==

grader==#|python|
def expected_output(h):
    res = ""
    nb = 0
    while h > 5:
        res += str(h) + ' cm\n'
        h *= .9
        nb += 1
    return res + f'nombre de rebonds : {nb}\n'

def tests(hauteurs):
    for h in hauteurs:
        run(title = f'Rebonds depuis {h} cm',
            globals = {'h': h}, 
            output = expected_output(h))

begin_test_group("Hauteurs fixées")
tests([20, 3, 5, 20, 400])

begin_test_group("Hauteurs aléatoires")
from random import sample
tests(sample(list(range(100, 200)), 3))
==



