# Ne fonctionne pas !

extends = ../templates/ap1_template.pl
title = Échange de deux variables

text==
On suppose qu'il existe deux variables `a` et `b` de valeurs et de types 
quelconques précédemment fixées (vous n'avez donc pas à les initialiser
ni à les lire).

Écrire un programme dont l'exécution échange les valeurs de `a` et `b`, 
sans rien afficher.

**Attention**, *votre programe doit fonctionner quelles que soient les valeurs 
de `a` et `b` et leurs types (qui peuvent être différents).*
==

grader==
set_globals(a=1, b=2)
run()
assert_variable_values(a=2, b=1)
==
