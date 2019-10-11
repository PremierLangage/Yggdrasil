extends = ../templates/generic/generic.pl

title = Table de multiplication

text==
On suppose qu'il existe deux variables $%col%$ et $%lin%$ de valeurs entières $%1 \le col \le 9%$
et $%1 \le lin \le 9%$.  
<br>
Ecrire un programme qui affiche un tableau des multiplications de 1 à $%col%$ par 1 à $%lin%$.
<br>
Le tableau doit respecter plusieurs règles:

* Chaque colonne doit comprendre deux caractères, soit 2 chiffres (`35`), soit 1 chiffre suivit d'un espace (`4 `).
* Les colonnes sont séparées par deux espaces.
* L'entête de colonne est séparé du tableau par des tirets `-`.
* L'entête de ligne est séparé du tableau par des barres verticales `|` (`ALT GR` + `6`).

Exemples :

* pour $%col = 3%$ et $%lin = 2%$:
<pre><code>
        *  |  1   2   3 
        ----------------
        1  |  1   2   3 
        2  |  2   4   6 
</code></pre>

* pour $%col = 9%$ et $%lin = 9%$:
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
==

grader== #|python|
from itertools import permutations

def mult_table(col, lin):
    s = "*  | "
    for i in range(1, col+1):
        s += " %d  " % i
    s += "\n----" + "----" * col + "\n"

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
    # Donne un titre à la prochaine exécution
    set_title(f"col = lin = {i}")
    # Fixe les variables globales disponibles pour les prochaines exécution
    set_globals(col=i, lin=i)
    # Lance l'exécution du programme dans les conditions spécifiées
    run()
    # Vérifie la sortie standard obtenue
    assert_output(mult_table(i, i))
# Clôt le précédent groupe de tests
end_test_group()
==

