extends= template/cgtemplate.pl

author=CG
title=Test

tag=function

text==
Ecrire un programme qui prend une grille 2x2 de nombres et qui renvoie la ligne ou colonne avec le total le plus élevé

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

cgtest==
>>> test('3\n3\n1\n2\n3\n4\n5\n6\n7\n8\n9\n') # Grille 1
'24'
==
