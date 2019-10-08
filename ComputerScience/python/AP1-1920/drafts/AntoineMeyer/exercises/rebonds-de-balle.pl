# author = Antoine Meyer
extends = ../templates/generic/generic.pl

title = Rebonds de balle

text==
On suppose qu'il existe une variable `h` désignant un nombre positif.
Une balle chute d'une hauteur de `h` cm et rebondit. À chaque rebond, la hauteur diminue de
10 %.

Réalisez un programme qui affiche la hauteur de rebond en cm tant que celle-ci est
supérieure à 5 cm. Affichez alors le nombre de rebonds effectués. 
(On affichera pour commencer la hauteur initiale de la balle, 
et on la comptabilisera dans le décompte.)

Par exemple, si `h` vaut initialement `20`, le programme doit afficher :

    20 cm
    18.0 cm
    16.2 cm
    14.58 cm
    13.122 cm
    11.809800000000001 cm
    10.628820000000001 cm
    9.565938000000001 cm
    8.6093442 cm
    7.748409780000001 cm
    6.973568802000001 cm
    6.276211921800001 cm
    5.64859072962 cm
    5.083731656658 cm
    nombre de rebonds : 14

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


