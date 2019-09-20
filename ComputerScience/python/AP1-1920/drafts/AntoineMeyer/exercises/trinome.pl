# author = Antoine Meyer
extends = ../templates/ap1_template.pl
title = Trinôme du second degré

text==
On suppose qu'il existe trois variables `a`, `b` et 'c' de valeurs `int` ou `float`.
Écrire un programme dont l'exécution crée une variable `nb_solutions` dont la valeur 
représente le nombre de solutions réelles de l'équation $a x^2 + b x + c$.

On représentera le fait que l'équation à une infinité de solutions en affectant à 
la variable `nb_solutions` la valeur `float('inf')` (qui représente $+\infty$).

**Attention**, *votre programe doit fonctionner quelles que soient les valeurs 
de `a`, `b` et `c`.*<br><br>
==

grader==
begin_test_group("Échange de deux entiers")
set_globals(a=1, b=2)
run()
assert_variable_values(a=2, b=1)
end_test_group()

begin_test_group("Échange d'un entier et d'une chaîne")
set_globals(a=1, b="ça marche")
run()
assert_variable_values(a="ça marche", b=1)
end_test_group()
==

