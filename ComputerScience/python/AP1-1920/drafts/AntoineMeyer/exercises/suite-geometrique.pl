extends = ../templates/generic/generic.pl

title = Suite géométrique

text==
On suppose qu'il existe deux variables `a` et `b` désignant des nombres flottants quelconque, et une variable `nb` désignant un entier positif quelconque. 
Écrire un programme dont l'exécution affiche sur la sortie standard les `nb` premiers termes de la suite géométrique de premier terme `a` et de raison `b`
(chacun suivi d'un retour à la ligne), à l'exclusion de tout autre caractère.

On rappelle la définition de la suite :

$%
\begin{cases}
u_0 & = a\\\
u_{n+1} & = b \times u_n
\end{cases}
%$

Par exemple, si `a` vaut 3, `b` vaut 2 et `nb` vaut 5, votre programme doit afficher :

    3
    6
    12
    24
    48

**Attention**, *le programe doit fonctionner quelles que soient les valeurs 
de `a`, `b` et `nb`.*<br>
==

grader==#|python|

#import sys
#print(pl_context, file=sys.stderr)

def expected_output(a, b, nb):
    terme = a
    res = ""
    for i in range(nb):
        res += str(terme) + '\n'
        terme *= b
    return res

def tests(cases):
    for a, b, nb in cases:
        run(title = f'Premier terme {a}, raison {b}, nb = {nb}',
            globals = {'a': a, 'b': b, 'nb': nb}, 
            output = expected_output(a, b, nb))

import random
begin_test_group("Valeurs fixées")
tests([(3, 2, 5), (3, 2, 7), (3, 3, 5)])

begin_test_group("Valeurs aléatoires")
tests([(random.randint(3,7),random.randint(3,7),random.randint(3,7)),
       (random.randint(3,7),random.randint(3,7),random.randint(3,7)),
       (random.randint(3,7),random.randint(3,7),random.randint(3,7))])
==




