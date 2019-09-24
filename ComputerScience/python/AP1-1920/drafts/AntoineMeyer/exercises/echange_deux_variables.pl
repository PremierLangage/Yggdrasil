# author = Antoine Meyer
extends = ../templates/generic/generic.pl

title = Échange de deux variables

text==
On suppose qu'il existe deux variables `a` et `b` de valeurs et de types 
quelconques précédemment fixées (vous n'avez donc pas à les initialiser
ni à les lire).

Écrire un programme dont l'exécution échange les valeurs de `a` et `b`, 
sans rien afficher.

**Attention**, *votre programe doit fonctionner quelles que soient les valeurs 
de `a` et `b` et leurs types (qui peuvent être différents).*<br><br>
==

grader==
run(
    globals={'a': 1, 'b': 2}, 
    values={'a': 2, 'b': 1}
)

run(
    globals={'a': 1, 'b': 'ça marche !'},
    values={'a': 'ça marche !', 'b': 1}
)

x, y = randint(100), randint(100, 200)
run(
    title={'test aléatoire'},
    globals={'a': x, 'b': y},
    values={'a': y, 'b': x}
)
==



