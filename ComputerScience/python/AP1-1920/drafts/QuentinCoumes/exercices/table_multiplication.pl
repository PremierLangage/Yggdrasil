extends = ../templates/generic/generic.pl

title = Table de multiplication

text==
On suppose qu'il existe une variable $%n%$ d'une valeur entière $%1 \le n \le 9%$.  
<br>
Ecrire un programme représentant un tableau des multiplications de 1 à $%n%$.
<br>
Le tableau doit respecter plusieurs règles:

* Chaque colonne doit comprendre deux caractères, soit 2 chiffres (`35`), soit 1 chiffre suivit d'un espace (`4 `).
* Les colonnes sont séparées d'un espace.
* L'entête de colonne est séparé du tableau par des tirets `-`.
* L'entête de ligne est séparé du tableau par des  barre verticale `|` (`ALT GR` + `6`).

Exemple pour $%n = 9%$ :
<pre><code>
        * | 1   2   3   4   5   6   7   8   9
        --------------------------------------
        1 | 1   2   3   4   5   6   7   8   9 
        2 | 2   4   6   8   10  12  14  16  18
        3 | 3   6   9   12  15  18  21  24  27
        4 | 4   8   12  16  20  24  28  32  36
        5 | 5   10  15  20  25  30  35  40  45
        6 | 6   12  18  24  30  36  42  48  54
        7 | 7   14  21  28  35  42  49  56  63
        8 | 8   16  24  32  40  48  56  64  72
        9 | 9   18  27  36  45  54  63  72  81
</code></pre>
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

