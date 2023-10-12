Ces grottes semblent être des tubes de lave. Certaines parties sont même encore volcaniquement actives; de petits évents hydrothermaux libèrent de la fumée dans les grottes qui se dépose lentement comme la pluie.

Si vous pouvez modéliser la façon dont la fumée traverse les grottes, vous pourrez peut-être l'éviter et être d'autant plus en sécurité. Le sous-marin génère pour vous une carte des hauteurs du sol des grottes voisines (votre entrée de puzzle).

La fumée s'écoule vers le point le plus bas de la zone dans laquelle elle se trouve. Par exemple, considérez la carte de hauteur suivante :

    2199943210
    3987894921
    9856789892
    8767896789
    9899965678

Chaque nombre correspond à la hauteur d'un emplacement particulier, où 9 est le plus haut et 0 est le plus bas qu'un emplacement puisse être.

Votre premier objectif est de trouver les points bas - les emplacements qui sont plus bas que n'importe lequel de ses emplacements adjacents. La plupart des emplacements ont quatre emplacements adjacents (haut, bas, gauche et droite) ; les emplacements sur le bord ou le coin de la carte ont trois ou deux emplacements adjacents, respectivement. (Les emplacements en diagonale ne comptent pas comme adjacents.)

Dans l'exemple ci-dessus, il y a quatre points bas, tous mis en surbrillance : deux sont dans la première rangée (un 1 et un 0), un est dans la troisième rangée (un 5) et un est dans la rangée du bas (également un 5 ). Tous les autres emplacements sur la carte des hauteurs ont un emplacement adjacent inférieur et ne sont donc pas des points bas.

Le niveau de risque d'un point bas est de 1 plus sa hauteur. Dans l'exemple ci-dessus, les niveaux de risque des points bas sont 2, 1, 6 et 6. La somme des niveaux de risque de tous les points bas de la carte des hauteurs est donc de 15.

Trouvez tous les points bas sur votre carte de hauteur. Quelle est la somme des niveaux de risque de tous les points bas de votre carte des hauteurs ?