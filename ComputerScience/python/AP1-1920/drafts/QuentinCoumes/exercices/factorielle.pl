extends = ../templates/generic/generic.pl

author = Quentin Coumes

title = Tableau d'Entiers

text==
Ecrire un programme qui affiche un tableau des entiers de `0` à `99`
avec dix entiers par lignes.

<br>
Le tableau doit être formaté suivant ces règles :

* Chaque colonne doit comprendre **deux caractères**, soit 2 chiffres ("35"),
  soit 1 chiffre suivit d'un espace ("7&nbsp;").
* Les colonnes sont séparées par **un espaces**.

---

Exemple :

<pre><code>
        0  1  2  3  4  5  6  7  8  9 
        10 11 12 13 14 15 16 17 18 19
        20 21 22 23 24 25 26 27 28 29
        30 31 32 33 34 35 36 37 38 39
        40 41 42 43 44 45 46 47 48 49
        50 51 52 53 54 55 56 57 58 59
        60 61 62 63 64 65 66 67 68 69
        70 71 72 73 74 75 76 77 78 79
        80 81 82 83 84 85 86 87 88 89
        90 91 92 93 94 95 96 97 98 99
</code></pre>
==

grader== #|python|
from itertools import permutations

def mult_table(col, lin):
    s = "*  | "
    for i in range(1, col + 1):
        s += " %d  " % i
    s += "\n-----" + "----" * col + "\n"

    for i in range(1, col + 1):
        s += "%d  | " % i
        for j in range(1, lin + 1):
            res = i*j
            if res < 10:
                s += " %d  " % res
            else:
                s += " %d " % res
        s += "\n"
    
    return s

begin_test_group("Tableaux carrés")
for i in range(1, 10):
    set_title(f"col = lin = {i}")
    set_globals(col=i, lin=i)
    run()
    assert_output(mult_table(i, i) + "\n")
end_test_group()

begin_test_group("Tout les Tableaux")
for i in range(1, 10):
    for j in range (1, 10):
        if i == j:
            continue
        set_title(f"col {i}, lin = {j}")
        set_globals(col=i, lin=j)
        run()
        assert_output(mult_table(i, j) + "\n")

        set_title(f"col {j}, lin = {i}")
        set_globals(col=j, lin=i)
        run()
        assert_output(mult_table(j, i) + "\n")
end_test_group()
==

