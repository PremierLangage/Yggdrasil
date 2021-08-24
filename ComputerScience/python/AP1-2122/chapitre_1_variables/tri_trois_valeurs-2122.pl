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

extends = /ComputerScience/python/AP1-1920/templates/generic/generic.pl
title = Tri de trois valeurs
tag= if|elif|else|conditionnelles|tests|tri

text==
On suppose qu'il existe trois variables `a`, `b` et `c` de valeurs quelconques et
comparables entre elles (vous n'avez donc pas à les initialiser ni à les lire).

Écrire un programme dont l'exécution affiche (à l'aide de la fonction `print`)
les valeurs de `a` `b` et `c` dans l'ordre croissant, séparées par des espaces.

**Par exemple,** si on suppose qu'au début du programme `a` vaut `5`, `b` vaut `1`
et `c` vaut `3`, le programme devra afficher `1 3 5`.

**Attention :**

- Le programme doit fonctionner quelles que soient les valeurs
  de `a`, `b` et `c` du moment qu'elles sont comparables ;
- Le programme ne doit pas modifier les valeurs des variables `a`, `b` et `c`,
  ni créer de nouvelles variables.
==

grader== #|python|
from itertools import permutations

# Ouvre un "groupe de tests" de titre donné
begin_test_group("Tris d'éléments distincts")
# Dans cet exemple on veut faire un test pour chaque permutation de (1, 2, 3)
# On utilise ici un style "verbeux" avec plusieurs appels
for x, y, z in permutations((1, 2, 3)):
    # Donne un titre à la prochaine exécution
    set_title(f"Exécution avec a = {x}, b = {y}, c = {z}")
    # Fixe les variables globales disponibles pour les prochaines exécution
    set_globals(a=x, b=y, c=z)
    # Lance l'exécution du programme dans les conditions spécifiées
    run()
    # Vérifie la sortie standard obtenue
    assert_output(' '.join(sorted(map(str, (x, y, z)))) + '\n')
    # Vérifie que les variables globales n'ont pas changé
    assert_no_global_change()
# Clôt le précédent groupe de tests
end_test_group()

# Second groupe de tests avec le plus grand élément doublé
# On utilise ici un style plus compact avec un seul appel
begin_test_group("Tris de chaînes avec un doublon et un plus petit")
for x, y, z in set(permutations(("un", "un", "deux"))):
    set_title(f"Exécution avec a = {x}, b = {y}, c = {z}")
    set_globals(a=x, b=y, c=z)
    run()
    assert_output(' '.join(sorted(map(str, (x, y, z)))) + '\n')
    assert_no_global_change()
end_test_group()

# Troisième groupe de tests avec le plus petit élément doublé
begin_test_group("Tris avec un doublon et un plus grand")
for x, y, z in set(permutations((1, 1, 2))):
    set_title(f"Exécution avec a = {x}, b = {y}, c = {z}")
    set_globals(a=x, b=y, c=z)
    run()
    assert_output(' '.join(sorted(map(str, (x, y, z)))) + '\n')
    assert_no_global_change()
end_test_group()

# Quatrième groupe de tests avec trois éléments identiques
begin_test_group("Tri de trois valeurs identiques")
set_globals(a=1, b=1, c=1)
set_title(f"Exécution avec a = 1, b = 1, c = 1")
set_globals(a=1, b=1, c=1)
run()
assert_output('1 1 1\n')
assert_no_global_change()
end_test_group()
==







