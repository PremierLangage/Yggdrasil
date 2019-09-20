# author = Antoine Meyer

# solutions à essayer :
# 
# a, b, c = sorted(a, b, c)
# print(a, b, c)
#
# print(*sorted((a, b, c)))
#
# if a > b:
#     a, b = b, a
# if b > c:
#     b, c = c, b
# if a > b:
#     a, b = b, a
# print(a, b, c)
# 

extends = ../templates/ap1_template.pl
title = Tri de trois valeurs

text==
On suppose qu'il existe trois variables `a`, `b` et `c` de valeurs quelconques et
comparables entre elles (vous n'avez donc pas à les initialiser ni à les lire).

Écrire un programme dont l'exécution affiche (à l'aide de la fonction `print`) 
les valeurs de `a` `b` et `c` dans l'ordre croissant, séparées par des espaces, 
suivies d'un retour à la ligne.

**Par exemple,** si on suppose qu'au début du programme `a` vaut `5`, `b` vaut `1` 
et `c` vaut 3, le programme devra afficher *précisément* la chaîne `'1 3 5\n'`.

**Attention :**

- Le programe doit fonctionner quelles que soient les valeurs 
  de `a`, `b` et `c` du moment qu'elles sont comparables ;
- Le programme ne doit pas modifier les valeurs des variables `a`, `b` et `c`, 
  ni créer de nouvelles variables.
==

grader==
from itertools import permutations

begin_test_group("Tris d'éléments distincts")
for x, y, z in permutations((1, 2, 3)):
    # TODO: display global change in feedback
    set_globals(a=x, b=y, c=z)
    run()
    assert_output("1 2 3\n")
    assert_no_global_change()
end_test_group()
==

