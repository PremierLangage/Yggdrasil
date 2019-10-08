# author = Antoine Meyer
extends = ../templates/generic/generic.pl

title = Dessin en mode texte : pyramide

text==
On suppose qu'il existe une variables `nb` désignant un entier positif. 
Écrire un programme dont l'exécution affiche sur la sortie standard 
une pyramide composée 
de `nb` lignes utilisant les caractères `*` et espace.

Par exemple, si `nb` vaut 5, votre programme doit afficher :

        *
       ***
      *****
     *******
    *********

**Attention**, *le programe doit fonctionner quelle que soit la valeur 
de `nb`.*<br>
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

