Vous atteignez une autre partie volcaniquement active de la grotte. Ce serait bien si vous pouviez faire une sorte d'imagerie thermique afin que vous puissiez savoir à l'avance quelles grottes sont trop chaudes pour entrer en toute sécurité.

Heureusement, le sous-marin semble être équipé d'une caméra thermique ! Lorsque vous l'activez, vous êtes accueilli par :

Félicitations pour votre achat ! Pour activer cette imagerie thermique infrarouge
système de caméra, veuillez entrer le code qui se trouve à la page 1 du manuel.
Apparemment, les Elfes n'ont jamais utilisé cette fonctionnalité. A votre grande surprise, vous parvenez à trouver le manuel ; que vous allez l'ouvrir, la page 1 tombe. C'est une grande feuille de papier transparent ! Le papier transparent est marqué de points aléatoires et comprend des instructions sur la façon de le plier (votre entrée de puzzle). Par exemple:

    6,10
    0,14
    9,10
    0,3
    10,4
    4,11
    6,0
    6,12
    4,1
    0,13
    10,12
    3,4
    3,0
    8,4
    1,10
    2,14
    8,10
    9,0

plier le long de y=7
plier le long de x=5
La première section est une liste de points sur le papier transparent. 0,0 représente la coordonnée en haut à gauche. La première valeur, x, augmente vers la droite. La deuxième valeur, y, augmente vers le bas. Ainsi, la coordonnée 3,0 est à droite de 0,0 et la coordonnée 0,7 est inférieure à 0,0. Les coordonnées dans cet exemple forment le motif suivant, où # est un point sur le papier et . est une position vide, non marquée :

    ...#..#..#.
    ....#......
    ...........
    #..........
    ...#....#.#
    ...........
    ...........
    ...........
    ...........
    ...........
    .#....#.##.
    ....#......
    ......#...#
    #..........
    #.#........

Ensuite, il y a une liste d'instructions de pliage. Chaque instruction indique une ligne sur le papier transparent et vous demande de plier le papier vers le haut (pour les lignes horizontales y=...) ou vers la gauche (pour les lignes verticales x=...). Dans cet exemple, la première instruction de pliage est plier selon y=7, qui désigne la ligne formée par toutes les positions où y vaut 7 (marquées ici par -) :

    ...#..#..#.
    ....#......
    ...........
    #..........
    ...#....#.#
    ...........
    ...........
    -----------
    ...........
    ...........
    .#....#.##.
    ....#......
    ......#...#
    #..........
    #.#........

Comme il s'agit d'une ligne horizontale, pliez la moitié inférieure vers le haut. Certains des points peuvent finir par se chevaucher une fois le pli terminé, mais les points n'apparaîtront jamais exactement sur une ligne de pliage. Le résultat de ce pli ressemble à ceci :

    #.##..#..#.
    #...#......
    ......#...#
    #...#......
    .#.#..#.###
    ...........
    ...........

Maintenant, seuls 17 points sont visibles.

Remarquez, par exemple, les deux points dans le coin inférieur gauche avant que le papier transparent ne soit plié ; une fois le pli terminé, ces points apparaissent dans le coin supérieur gauche (à 0,0 et 0,1). Parce que le papier est transparent, le point juste en dessous d'eux dans le résultat (à 0,3) reste visible, car il peut être vu à travers le papier transparent.

Notez également que certains points peuvent finir par se chevaucher ; dans ce cas, les points fusionnent et deviennent un seul point.

La deuxième instruction de pliage est plier le long de x=5, ce qui indique cette ligne :

    #.##.|#..#.
    #...#|.....
    .....|#...#
    #...#|.....
    .#.#.|#.###
    .....|.....
    .....|.....

Comme il s'agit d'une ligne verticale, pliez à gauche :

    #####
    #...#
    #...#
    #...#
    #####
    .....
    .....

Les instructions ont fait un carré!

Le papier transparent est assez grand, alors pour l'instant, concentrez-vous sur la réalisation du premier pli. Après le premier pli dans l'exemple ci-dessus, 17 points sont visibles - les points qui finissent par se chevaucher une fois le pli terminé comptent comme un seul point.

Combien de points sont visibles après avoir terminé la première instruction de pliage sur votre papier transparent ?