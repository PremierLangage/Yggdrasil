
# author = Antoine Meyer
extends = ../templates/generic/generic.pl

title = Rebonds de balle

text==
On suppose qu'il existe une variable `h` désignant un nombre positif.

Une balle chute d'une hauteur de `h` cm et rebondit. À chaque rebond, la hauteur diminue de
10 %.

Réalisez un programme qui affiche la hauteur de rebond tant que celle-ci est
supérieure à 5 cm (sans afficher l'unité). Affichez alors le nombre de rebonds effectués. 
(On affichera pour commencer la hauteur initiale de la balle, 
et on la comptabilisera dans le décompte.)

Par exemple, si `h` vaut initialement `20`, le programme doit afficher :


==

grader==#|python|
def expected_output(hauteur):
    res = ""
    for i in range(nb):
        res += str(hauteur) + '\n'
    return res

def tests(nbs):
    for nb in nbs:
        run(title = f'Rebonds depuis {h} cm',
            globals = {'h': h}, 
            output = expected_output(h))

begin_test_group("Hauteurs fixées")
tests([20, 3, 5, 20, 400])

begin_test_group("Hauteurs aléatoires")
from random import sample
tests(sample(list(range(100, 200)), 3))
==

