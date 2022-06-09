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

==

cgtest==
>>> test('1\n2\n') # Somme simple
'3'
>>> test('-6\n4\n') # Somme avec négatif
'-2'
>>> from random import randint; a = randint(0, 100); test('2\n' + str(a) + '\n') == str(2 + a) # Test aléatoire
True
==
