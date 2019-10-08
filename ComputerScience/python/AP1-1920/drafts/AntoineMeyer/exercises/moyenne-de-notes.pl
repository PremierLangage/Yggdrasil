# author = Antoine Meyer
extends = ../templates/generic/generic.pl

title = Moyenne de notes

text==
Écrivez un programme qui permet à l'utilisateur de saisir une suite de notes 
(nombres flottants compris entre 0 et 20), et qui affiche le nombre de notes 
saisies et leur moyenne. 

Le nombre de notes n'est pas connu à l'avance, l'utilisateur devra saisir le 
texte `'stop'` pour indiquer qu'il souhaite s'arrêter. 

Le programme devra également afficher un message d'erreur si une note saisie 
est incorrecte, et ne devra pas la prendre en compte dans le calcul.

Voici un exemple d'interaction avec le programme :

    Saisir une note entre 0 et 20 ou stop pour arrêter : 12
    Saisir une note entre 0 et 20 ou stop pour arrêter : 14
    Saisir une note entre 0 et 20 ou stop pour arrêter : -5
    Note non prise en compte
    Saisir une note entre 0 et 20 ou stop pour arrêter : 21
    Note non prise en compte
    Saisir une note entre 0 et 20 ou stop pour arrêter : stop
    Nombre de notes : 2
    Moyenne : 13
==

grader==#|python|
def expected_output(nb):
    res = ""
    for i in range(1, nb+1):
        res += ' ' * (nb - i) + '*' * (2 * i - 1) + '\n'
    return res

def tests(nbs):
    for nb in nbs:
        run(title = f'Hauteur {nb}',
            globals = {'nb': nb}, 
            output = expected_output(nb))

begin_test_group("Hauteurs fixées")
tests([0, 4, 5])

begin_test_group("Hauteurs aléatoires")
from random import sample
tests(sample(list(range(10, 20)), 3))
==

