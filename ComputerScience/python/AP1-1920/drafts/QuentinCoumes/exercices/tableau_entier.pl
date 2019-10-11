extends = ../templates/generic/generic.pl

author = Quentin Coumes

title = Tableaux d'Entiers

text==
On suppose qu'il existe une variables `n` de valeur entière comprises entre 1 et 9.

<br>
Écrivez un programme qui construit une chaine de caractères représentant un tableau
des entiers de `1` à `n^2`.

<br>
Le tableau doit être formaté suivant ces règles :

* Le tableau doit être carré ;
* Chaque colonne doit comprendre **deux caractères**, soit 2 chiffres ("35") ;
  soit 1 chiffre suivit d'un espace ("7&nbsp;" );
* Les colonnes sont séparées par **un espaces**.

**N'oubliez pas l'espace en fin de ligne si celle-ci se termine par un nombre à 1 chiffre.**

---

Exemple :

* pour `n = 3` :
<pre><code>
        1  2  3 
        4  5  6 
        7  8  9 
</code></pre>

* pour `n = 7` :
<pre><code>
        1  2  3  4  5  6  7 
        8  9  10 11 12 13 14
        15 16 17 18 19 20 21
        22 23 24 25 26 27 28
        29 30 31 32 33 34 35
        36 37 38 39 40 41 42
        43 44 45 46 47 48 49
</code></pre>
==

grader== #|python|

def table(n):
    s = ""
    for i in range(n):
        if i <= 9:
            s += " "
        
        for j in range(1, n + 1):
            res = i*n + j
            s += " %d" % res
            if res <= 9:
                s += " "
        
        s += "\n"

    return s

begin_test_group("Tableaux d'Entiers")
for i in range(1, 10):
    set_title(f"n = {i}")
    set_globals(n=i)
    run()
    assert_output(table(i) + "\n")
end_test_group()
==


