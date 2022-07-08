Une fois les problèmes de connexion à la luge résolus, vous partez en direction de l'aéroport. Bien que voyager en toboggan puisse être facile, ce n'est certainement pas sûr : il y a très peu de direction et la zone est couverte d'arbres. Vous aurez besoin de voir quels angles vous amèneront près du moins d'arbres.

En raison de la géologie locale, les arbres de cette zone ne poussent que sur des coordonnées entières exactes dans une grille. Vous faites une carte (votre entrée de puzzle) des carrés ouverts (.) et des arbres (#) que vous pouvez voir. Par exemple:

..##.......
#...#...#..
.#....#..#.
..#.#...#.#
.#...##..#.
..#.##.....
.#.#.#....#
.#........#
#.##...#...
#...##....#
.#..#...#.#
Ce ne sont pas les seuls arbres, cependant; en raison de quelque chose que vous avez lu une fois concernant la génétique arboricole et la stabilité du biome, le même schéma se répète plusieurs fois à droite :

    ..##.........##.........##.........##.........##.. .......##....... --->
    #...#...#..#...#...#..#...#...#..#...#...#..#...#. ..#..#...#...#..
    .#....#..#..#....#..#..#....#..#..#....#..#..#.... #..#..#....#..#.
    ..#.#...#.#..#.#...#.#..#.#...#.#..#.#...#.#..#.#. ..#.#..#.#...#.#
    .#...##..#..#...##..#..#...##..#..#...##..#..#...# #..#..#...##..#.
    ..#.##.......#.##.......#.##.......#.##.......#.## .......#.##..... --->
    .#.#.#....#.#.#.#....#.#.#.#....#.#.#.#....#.#.#.# ....#.#.#.#....#
    .#........#.#........#.#........#.#........#.#.... ....#.#........#
    #.##...#...#.##...#...#.##...#...#.##...#...#.##.. .#...#.##...#...
    #...##....##...##....##...##....##...##....##...## ....##...##....#
    .#..#...#.#.#..#...#.#.#..#...#.#.#..#...#.#.#..#. ..#.#.#..#...#.# --->
    
Vous commencez sur le carré ouvert (.) dans le coin supérieur gauche et devez atteindre le bas (sous la ligne la plus en bas sur votre carte).

Le toboggan ne peut suivre que quelques pentes précises (vous avez opté pour un modèle moins cher qui préfère les nombres rationnels) ; commencez par compter tous les arbres que vous rencontrerez pour la pente à droite 3, en bas 1 :

À partir de votre position de départ en haut à gauche, vérifiez la position qui est à droite 3 et en bas 1. Ensuite, vérifiez la position qui est à droite 3 et en bas 1 à partir de là, et ainsi de suite jusqu'à ce que vous dépassiez le bas de la carte.

Les emplacements que vous vérifieriez dans l'exemple ci-dessus sont marqués ici d'un O là où il y avait un carré ouvert et d'un X là où il y avait un arbre :

    ..##.........##.........##.........##.........##.. .......##....... --->
    #..O#...#..#...#...#..#...#...#..#...#...#..#...#. ..#..#...#...#..
    .#....X..#..#....#..#..#....#..#..#....#..#..#.... #..#..#....#..#.
    ..#.#...#O#..#.#...#.#..#.#...#.#..#.#...#.#..#.#. ..#.#..#.#...#.#
    .#...##..#..X...##..#..#...##..#..#...##..#..#...# #..#..#...##..#.
    ..#.##.......#.X#.......#.##.......#.##.......#.##. ......#.##..... --->
    .#.#.#....#.#.#.#.O..#.#.#.#....#.#.#.#....#.#.#.# ....#.#.#.#....#
    .#........#.#........X.#........#.#........#.#.... ....#.#........#
    #.##...#...#.##...#...#.X#...#...#.##...#...#.##... #...#.##...#...
    #...##....##...##....##...#X....##...##....##...## ....##...##....#
    .#..#...#.#.#..#...#.#.#..#...X.#.#..#...#.#.#..#. ..#.#.#..#...#.# --->

Dans cet exemple, traverser la carte en utilisant cette pente vous ferait rencontrer 7 arbres.

En commençant par le coin supérieur gauche de votre carte et en suivant une pente de 3 à droite et de 1 en bas, combien d'arbres rencontreriez-vous ?