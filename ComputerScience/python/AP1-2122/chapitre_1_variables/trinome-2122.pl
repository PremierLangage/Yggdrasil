# author = Antoine Meyer
extends = /ComputerScience/python/AP1-1920/templates/generic/generic.pl
title = Trinôme du second degré

tag= expression|variable|polynome|trinome|int|float|type

text==
On suppose qu'il existe trois variables `a`, `b` et `c` de valeurs `int` ou `float`.
Écrire un programme dont l'exécution crée une variable `nb_solutions` dont la valeur 
représente le nombre de solutions **réelles** de l'équation $%a x^2 + b x + c%$.

On représentera le fait que l'équation a une infinité de solutions en affectant à 
la variable `nb_solutions` la valeur `float('inf')` (qui représente $%+\infty%$).

**Attention**, *votre programme doit fonctionner quelles que soient les valeurs 
de `a`, `b` et `c`.*<br><br>
==

grader==
import random

def nb_sols(a, b, c):
    if a == 0:
        if b == 0:
            if c == 0:
                return float('inf')
            else:
                return 0
        else:
            return 1
    delta = b*b - 4*a*c
    if delta == 0:
        return 1
    elif delta > 0:
        return 2
    else:
        return 0

def d():
    return random.randint(1,10)

essais = [

    [1, 3, 1], [1, 2, 1], [1, 1, 1],
    [0, 0, 0], [0, 0, 1], [0, 1, 1], 
    [
        random.randint(0, 10),
        random.randint(0, 10),
        random.randint(0, 10)
    ],
    [d(),d(),d()]
]

essais += []

begin_test_group("Résultats")
for a, b, c in essais:
    set_globals(a=a, b=b, c=c)
    run(title="$%{} x^2 + {} x + {} = 0%$".format(a, b, c))
    assert_variable_values(nb_solutions=nb_sols(a, b, c))


==









