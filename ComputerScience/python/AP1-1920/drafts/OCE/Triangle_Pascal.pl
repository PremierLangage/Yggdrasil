# author = Olivier Champalle
extends = /ComputerScience/python/AP1-1920/templates/generic/generic.pl

title = Triangle de Pascal

text==
On souhaite afficher le fameux triangle de Pascal (cf. Triangle de Pascal) donnant la représentation
des coefficients binomiaux (cf. Coefficient binomial), couramment utilisé en probabilité pour connaître
le nombre de façons de choisir p éléments parmi un lot de n éléments sans prise en compte de l’ordre.
<br>
Créez un script trianglePascal.py qui initialise une variable N à la valeur 10 et affiche le triangle
de nombres allant de 0 à N (inclus) suivant. On utilisera deux boucles for judicieusement imbriquées.
==

editor.theme=light

grader==#|python|
def expected_output(nb):
    res = ""
    for i in range(nb):
        res += str(i) + '\n'
    return res

def tests(nbs):
    for nb in nbs:
        run(title = f'De 0 à {nb}-1',
            globals = {'nb': nb}, 
            output = expected_output(nb))

begin_test_group("Valeurs fixées")
tests([0, 3, 5])

begin_test_group("Nombres aléatoires")
from random import sample
tests(sample(list(range(100, 200)), 5))
==




