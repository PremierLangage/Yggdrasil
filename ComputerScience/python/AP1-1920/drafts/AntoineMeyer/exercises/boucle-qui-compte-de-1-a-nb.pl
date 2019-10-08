# author = Antoine Meyer
extends = ../templates/generic/generic.pl

title = Boucle qui compte de 1 à `nb`

text==
On suppose qu'il existe une variables `nb` désignant un entier strictement positif. 
Écrire un programme dont l'exécution affiche sur la sortie standard les nombres de 
`1` à `nb` (chacun suivi d'un retour à la ligne), à l'exclusion de tout autre caractère.

Par exemple, si `nb` vaut 5, votre programme doit afficher :

    1
    2
    3
    4
    5

**Attention**, *le programe doit fonctionner quelle que soit la valeur 
de `nb`.*<br>
==

editor.theme=light

grader==#|python|
def expected_output(nb):
    res = ""
    for i in range(1, nb+1):
        res += str(i) + '\n'
    return res

def tests(nbs):
    for nb in nbs:
        run(title = f'De 1 à {nb}',
            globals = {'nb': nb}, 
            output = expected_output(nb))

begin_test_group("Valeurs fixées")
tests([0, 3, 5])

begin_test_group("Nombres aléatoires")
from random import sample
tests(sample(list(range(100, 200)), 5))
==







