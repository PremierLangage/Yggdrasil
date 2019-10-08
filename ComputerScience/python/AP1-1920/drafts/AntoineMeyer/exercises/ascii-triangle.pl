# author = Antoine Meyer
extends = ../templates/generic/generic.pl

title = Dessin en mode texte : triangle

text==
On suppose qu'il existe une variables `nb` désignant un entier strictement positif. 
Écrire un programme dont l'exécution affiche sur la sortie standard un triangle composé 
de caractères `*`.

Par exemple, si `nb` vaut 5, votre programme doit afficher :

    *
    **
    ***
    ****
    *****

**Attention**, *le programe doit fonctionner quelle que soit la valeur 
de `nb`.*<br>
==

editor.theme=light

grader==#|python|
def expected_output(nb):
    res = ""
    for i in range(nb):
        res += '*' * i + '\n'
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

