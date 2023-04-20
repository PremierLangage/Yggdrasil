extends= ../template/cgbasic.pl

author=CG
title=Somme maximale dans une grille

tag=function

text==
Ecrire un programme qui prend une grille a deux dimensions de nombres positifs et qui renvoie la ligne ou colonne avec le total le plus élevé

Format d'entrée : les deux premiers numéros sont le nombre de lignes puis de colonnes, le contenu de la grille
est ensuite énuméré un par un, de gauche à droite, de haut en bas

Exemple :

3

3

1

2

3

4

5

6

7

8

9

Correspond à la grille :

1 2 3

4 5 6

7 8 9

Format de sortie : somme max trouvée

Dans l'exemple précédent, c'est la 3ème ligne, dont la somme vaut 24
==

example==
if __name__ == '__main__':
    lines = int(input())
    columns = int(input())

    board = []
    for _ in range(lines):
        line = []
        for _ in range(columns):
            line.append(int(input()))
        board.append(line)
    
    lines_sums = [sum(line) for line in board]
    columns_sums = [sum(map(lambda line: line[col], board)) for col in range(columns)]

    print(max(max(lines_sums), max(columns_sums)))
==

testcases==
[('3\n3\n1\n2\n3\n4\n5\n6\n7\n8\n9\n', '24', 'Grille 1'),
('4\n4\n2\n4\n7\n9\n3\n1\n2\n5\n1\n9\n5\n1\n5\n6\n2\n1\n', '22', 'Grille 2'),
('5\n1\n1\n2\n3\n4\n5\n', '15', 'Grille 3'),
('1\n5\n1\n2\n3\n4\n5\n', '15', 'Grille 4')]
==

