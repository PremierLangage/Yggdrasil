extends = /ComputerScience/python/AP1-1920/templates/generic/generic.pl

#author = Quentin Coumes

tag=doubleBoucle|forInRange|affichageDeuxDimensions

title = Tableau de multiplications

text==
On suppose qu'il existe deux variables `col` et `lin` de valeurs entières comprises entre 1 et 9
représentant respectivement le nombre de colonnes et le nombre de lignes d'un tableau.

<br>
Écrivez un programme qui construit une chaine de caractères représentant un tableau
des multiplications de 1 à `col` par 1 à `lin`, et qui affiche ensuite cette chaine.

<br>
Le tableau doit être formaté suivant ces règles :

* Chaque colonne doit comprendre **deux caractères**, soit 2 chiffres (`"35"`),
  soit 1 chiffre suivi d'un espace (`"7 "`) ;
* Les colonnes sont séparées par **deux espaces** ;
* L'entête de colonne est séparé du tableau par des **tirets `-`** ;
* L'entête de ligne est séparé du tableau par des **barres verticales `|`** (`[ALT GR]` + `[6]`) ;
* Afin de faciliter la création des boucles, chaque ligne doit se terminer par un espace,
  en plus de l'espace optionnel de la colonne (excepté le séparateur d'entête de ligne) ;
* Le tableau est suivi d'une ligne vide (celle ajoutée par `print()`).

**Rappel** : Utilisez le caractère `\n` pour symboliser un retour à la ligne.

<br>
---

Exemples :

* pour `col = 3` et `lin = 2`:
<pre><code>
        *  |  1   2   3 
        -----------------
        1  |  1   2   3 
        2  |  2   4   6 
</code></pre>

* pour `col = 9` et `lin = 9`:
<pre><code>
        *  |  1   2   3   4   5   6   7   8   9 
        -----------------------------------------
        1  |  1   2   3   4   5   6   7   8   9 
        2  |  2   4   6   8   10  12  14  16  18 
        3  |  3   6   9   12  15  18  21  24  27 
        4  |  4   8   12  16  20  24  28  32  36 
        5  |  5   10  15  20  25  30  35  40  45 
        6  |  6   12  18  24  30  36  42  48  54 
        7  |  7   14  21  28  35  42  49  56  63 
        8  |  8   16  24  32  40  48  56  64  72 
        9  |  9   18  27  36  45  54  63  72  81 
</code></pre>


Pour mieux voir le formatage demandé, voici les exemples précédents avec les espaces remplacés par des points:

* pour `col = 3` et `lin = 2`:
<pre><code>
        *..|..1...2...3..
        -----------------
        1..|..1...2...3..
        2..|..2...4...6..
</code></pre>

* pour `col = 9` et `lin = 9`:
<pre><code>
        *..|..1...2...3...4...5...6...7...8...9..
        -----------------------------------------
        1..|..1...2...3...4...5...6...7...8...9..
        2..|..2...4...6...8...10..12..14..16..18.
        3..|..3...6...9...12..15..18..21..24..27.
        4..|..4...8...12..16..20..24..28..32..36.
        5..|..5...10..15..20..25..30..35..40..45.
        6..|..6...12..18..24..30..36..42..48..54.
        7..|..7...14..21..28..35..42..49..56..63.
        8..|..8...16..24..32..40..48..56..64..72.
        9..|..9...18..27..36..45..54..63..72..81.
</code></pre>
==

grader== #|python|

def mult_table(col, lin):
    s = "*  | "
    for i in range(1, col + 1):
        s += " %d  " % i
    s += "\n-----" + "----" * col + "\n"

    for i in range(1, lin + 1):
        s += "%d  | " % i
        for j in range(1, col + 1):
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

editor.code==
# Vous avez droit d'utiliser des fonctions ;)
# Entête de colonnes
s = "*  | "
for i in range(1, col + 1):
    s += " " + str(i) + " "
s += "\n"

# Séparateur de colonne (à completer)
s += ...

# Lignes (à completer)
...

# Affichage
print(s)
==

editor.height=400px





